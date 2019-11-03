<template>
  <div class="chart-container">
    <div class="filter-container">
      <el-form :inline="true" v-model="listQuery">
        <!-- <el-form-item>
          <el-checkbox-group v-model="listQuery.retrievalParams" size="small" style="inline">
            <el-checkbox-button v-for="param in paramOptions" :label="param.key" :key="param.key">{{param.display_name}}</el-checkbox-button>
          </el-checkbox-group>
        </el-form-item> -->
        <el-form-item>
      <!-- <el-input v-model="listQuery.name" placeholder="水体" style="width: 200px;" class="filter-item" @keyup.enter.native="handleFilter" /> -->
          <el-select v-model="listQuery.waterName" placeholder="水体" clearable style="width: 150px" class="filter-item">
            <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <!-- <el-form-item>
          <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
            <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-select v-model="listQuery.city" placeholder="城市" clearable style="width: 90px" class="filter-item">
            <el-option v-for="item in cityOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>        -->
        <el-form-item>
          <el-date-picker
            v-model="dateRange"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            class="filter-item"
            style="width: 400px"
          />
        </el-form-item>
        <el-form-item>
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="getResultList">
            搜索
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-tabs v-model="activeTab" @tab-click="handleTabClick" type="border-card">
      <el-tab-pane label="拟合效果" name="fit">
        <el-row justify="end">
          <el-radio-group v-model="displayParams" size="small" @change="toggleParam">
            <el-radio-button v-for="param in displayOptions" :label="param.key" :key="param.key">{{param.display_name}}</el-radio-button>
          </el-radio-group>
        </el-row>
        <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;" v-if="'fit' === activeTab">
          <line-chart :chart-data="lineChartData" />
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="条形图" name="hist">
        <el-row justify="end">
          <el-radio-group v-model="displayParams1" size="small" @change="toggleParam1">
            <el-radio-button v-for="param in displayOptions1" :label="param.key" :key="param.key">{{param.display_name}}</el-radio-button>
          </el-radio-group>
        </el-row>
        <!-- <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;"  v-if="'hist' === activeTab">
          <line-chart :chart-data="lineChartData" />
        </el-row> -->
        <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;"  v-if="'hist' === activeTab">
          <div class="chart-wrapper">
            <bar-chart :chart-data="barChartData"/>
          </div>
        </el-row>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { fetchResultList, fetchCreate, fetchUpdate, delWaterId } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { parseTime } from "@/utils/ruoyi";
import { isNull } from 'util';
import { getUserProfile } from "@/api/system/user";
import LineChart from './LineChart'
import BarChart from './BarChart'

Date.prototype.Format = function (fmt) { //author: meizz
  var o = {
  "M+": this.getMonth() + 1, //月份
  "d+": this.getDate(), //日
  "h+": this.getHours(), //小时
  "m+": this.getMinutes(), //分
  "s+": this.getSeconds(), //秒
  "q+": Math.floor((this.getMonth() + 3) / 3), //季度
  "S": this.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
  if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
  }
const typeOptions = ['MODIS', 'GF-1', 'GF-2', 'GF-3', 'LANDSAT-5', 'LANDSAT-8']
const displayOptions1 = [
  {key:'tp',display_name:'总磷'},
  {key:'tn',display_name:'总氮'},
  {key:'tss',display_name:'总悬浮物'},
  {key:'chla',display_name:'叶绿素a'},
  {key:'cod',display_name:'化学需氧量'},
  {key:'nh',display_name:'氨氮'},
]
const displayOptions = [
  {key:'min',display_name:'最小值'},
  {key:'max',display_name:'最大值'},
  {key:'mean',display_name:'平均值'},
]
let nameOptions = []
let provinceOptions = [
  '北京市', '广东省', '山东省', '江苏省', '河南省', '上海市', '河北省', '浙江省', '香港特别行政区', '陕西省', '湖南省', '重庆市',
  '福建省', '天津市', '云南省', '四川省', '广西壮族自治区', '安徽省', '海南省', '江西省', '湖北省', '山西省', '辽宁省', '台湾省',
  '黑龙江', '内蒙古自治区', '澳门特别行政区', '贵州省', '甘肃省', '青海省', '新疆维吾尔自治区', '西藏自治区', '吉林省', '宁夏回族自治区'
]
// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = typeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

let lineDisplay = {mean:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
          min:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
          max:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}}

let barDisplay = {
  tp: {mean:[], min:[], max:[]},
  tn: {mean:[], min:[], max:[]},
  tss: {mean:[], min:[], max:[]},
  chla: {mean:[], min:[], max:[]},
  cod: {mean:[], min:[], max:[]},
  nh: {mean:[], min:[], max:[]}}

export default {
  name: 'Analysis',
  components: { LineChart,BarChart },
  directives: { waves },
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'info',
        deleted: 'danger'
      }
      return statusMap[status]
    },
    typeFilter(type) {
      return calendarTypeKeyValue[type]
    }
  },
  data() {
    return {
      activeTab: 'fit',
      lineChartData:null,
      barChartData:null,
      params:['tp'],
      tableKey: 0,
      list: null,
      lineDisplay,
      barDisplay,
      total: 0,
      listLoading: true,
      listQuery: {
        province: undefined,
        waterName: undefined,
        type: undefined,
        city: undefined,
        // retrievalParams: ['tp'],
      },
      // 日期范围
      displayParams: 'mean',
      displayParams1: 'tp',
      dateRange: [],
      typeOptions: [],
      cityOptions:[],
      displayOptions,
      displayOptions1,
      provinceOptions: [],
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      nameOptions: [],
      showReviewer: false,
      temp: {
        waterId: undefined,
        photoTime: new Date(),
        waterName: '',
        type: '',
        province: '浙江省',
        rgbPath: '',
        filePath: '',
        fileName: '',
        county: '',
        location:'',
        department:'',
        contact:'',
        contactInformation:'',
        remark:""
      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: 'Edit',
        create: 'Create',
        view: 'View',
        export: 'Export'
      },
      dialogPvVisible: false,
      pvData: [],
      rules: {
        type: [{ required: true, message: '请输入数据源', trigger: 'blur' }],
        photoTime: [{ type: 'date', required: true, message: '请输入拍摄时间', trigger: 'blur' }],
        waterName: [{ required: true, message: '请输入水体', trigger: 'blur' }],
        province: [{ required: true, message: '请输入省份', trigger: 'blur' }],
        city: [{ required: true, message: '请输入城市', trigger: 'blur' }],
        filePath: [{ required: true, message: '请上传文件', trigger: 'blur' }]
      },
      downloadLoading: false,
      fileList: [],
      user: {},
    }
  },
  created() {
    this.getResultList();
    this.getUser();
    this.getUnique("city").then(response => {
      this.cityOptions = response.data;
    });
    this.getUnique("province").then(response => {
      this.provinceOptions = response.data;
    });
    this.getUnique("name").then(response => {
      this.nameOptions = response.data;
    });

  },
  // watch:{
  //   lineChartData: function(){
  //     console.log('t:', this.lineDisplay.mean)
  //     return this.lineDisplay.mean
  //   }
  // },
  methods: {
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data;
        this.roleGroup = response.roleGroup;
        this.postGroup = response.postGroup;
      });
    },
    getResultList() {
      this.listLoading = true
      fetchResultList(this.addDateRange(this.listQuery, this.dateRange)).then(response => {
        // this.list = response.rows;
        this.total = response.total;
        this.list = response.rows
        let lineDisplay = {mean:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
          min:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
          max:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}}        
        let barDisplay = {
          tp: {mean:[], min:[], max:[]},
          tn: {mean:[], min:[], max:[]},
          tss: {mean:[], min:[], max:[]},
          chla: {mean:[], min:[], max:[]},
          cod: {mean:[], min:[], max:[]},
          nh: {mean:[], min:[], max:[]}}

        this.list.forEach(function(ele){
          lineDisplay.mean.tp.push([ele.photoTime, ele.tpMean])
          lineDisplay.min.tp.push([ele.photoTime, ele.tpMin])
          lineDisplay.max.tp.push([ele.photoTime, ele.tpMax])

          lineDisplay.mean.tn.push([ele.photoTime, ele.tnMean])
          lineDisplay.min.tn.push([ele.photoTime, ele.tnMin])
          lineDisplay.max.tn.push([ele.photoTime, ele.tnMax])

          lineDisplay.mean.tss.push([ele.photoTime, ele.tssMean])
          lineDisplay.min.tss.push([ele.photoTime, ele.tssMin])
          lineDisplay.max.tss.push([ele.photoTime, ele.tssMax])

          lineDisplay.mean.cod.push([ele.photoTime, ele.codMean])
          lineDisplay.min.cod.push([ele.photoTime, ele.codMin])
          lineDisplay.max.cod.push([ele.photoTime, ele.codMax])

          lineDisplay.mean.chla.push([ele.photoTime, ele.chlaMean])
          lineDisplay.min.chla.push([ele.photoTime, ele.chlaMin])
          lineDisplay.max.chla.push([ele.photoTime, ele.chlaMax])

          lineDisplay.mean.nh.push([ele.photoTime, ele.nhMean])
          lineDisplay.min.nh.push([ele.photoTime, ele.nhMin])
          lineDisplay.max.nh.push([ele.photoTime, ele.nhMax])

          barDisplay.tp.mean.push([ele.photoTime, ele.tpMean])
          barDisplay.tp.min.push([ele.photoTime, ele.tpMin])
          barDisplay.tp.max.push([ele.photoTime, ele.tpMax])

          barDisplay.tn.mean.push([ele.photoTime, ele.tnMean])
          barDisplay.tn.min.push([ele.photoTime, ele.tnMin])
          barDisplay.tn.max.push([ele.photoTime, ele.tnMax])

          barDisplay.tss.mean.push([ele.photoTime, ele.tssMean])
          barDisplay.tss.min.push([ele.photoTime, ele.tssMin])
          barDisplay.tss.max.push([ele.photoTime, ele.tssMax])

          barDisplay.cod.mean.push([ele.photoTime, ele.codMean])
          barDisplay.cod.min.push([ele.photoTime, ele.codMin])
          barDisplay.cod.max.push([ele.photoTime, ele.chlaMax])

          barDisplay.chla.mean.push([ele.photoTime, ele.chlaMean])
          barDisplay.chla.min.push([ele.photoTime, ele.chlaMin])
          barDisplay.chla.max.push([ele.photoTime, ele.nhMax])

          barDisplay.nh.mean.push([ele.photoTime, ele.nhMean])
          barDisplay.nh.min.push([ele.photoTime, ele.nhMin])
          barDisplay.nh.max.push([ele.photoTime, ele.tpMax])
        })

        this.lineDisplay = lineDisplay
        this.barDisplay = barDisplay

        this.toggleParam(this.displayParams)
        this.toggleParam1(this.displayParams1)
        // [{"waterName":"西湖","tpMin":0.0,"tpMax":0.0,"tpMean":0.0,"photoTime":"2018-07-30T16:00:00.000+0000"}]}
      })
        // Just to simulate the time of the request
        this.listLoading = false;
        // setTimeout(() => {
        //   this.listLoading = false
        // }, 1.5 * 1000)
    },
    toggleParam(param){
      switch(param){
        case "mean":
          this.lineChartData = this.lineDisplay.mean
          break
        case "min":
          this.lineChartData = this.lineDisplay.min
          break
        case "max":
          this.lineChartData = this.lineDisplay.max
          break
        default:
          this.lineChartData = this.lineDisplay.mean
          break
      }
      
      this.lineChartData.tp.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.lineChartData.tn.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.lineChartData.tss.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.lineChartData.chla.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.lineChartData.cod.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.lineChartData.nh.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
    },

    toggleParam1(param){
      switch(param){
        case "tp":
          this.barChartData = this.barDisplay.tp
          break
        case "tn":
          this.barChartData = this.barDisplay.tn
          break
        case "tss":
          this.barChartData = this.barDisplay.tss
          break
        case "cod":
          this.barChartData = this.barDisplay.cod
          break
        case "chla":
          this.barChartData = this.barDisplay.chla
          break
        case "nh":
          this.barChartData = this.barDisplay.nh
          break
        default:
          this.barChartData = this.barDisplay.tp
          break
      }
      
      this.barChartData.min.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.barChartData.max.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.barChartData.mean.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      console.log('barChartData:',this.barChartData)
      
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => {
        if (j === 'photoTime') {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    },
    handleTabClick(tab, event) {
        // console.log(tab, event);
    }
  }
}
</script>

<style scoped>
.chart-container{
  position: relative;
  width: 100%;
  height: calc(100vh - 84px);
  margin: 10px;
}
</style>
