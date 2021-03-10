<template>
  <div class="chart-container">
    <div class="filter-container">
      <panel-group :displayData="displayData" />
    </div>
    <div class="filter-container">
      <el-form :inline="true" v-model="listQuery">
        <el-form-item>
          <el-select v-model="listQuery.waterName" placeholder="水体" clearable style="width: 150px" class="filter-item">
            <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
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
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="getWaterQuality">
            搜索
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-tabs v-model="activeTab" @tab-click="handleTabClick" type="border-card">
      <el-tab-pane label="水质统计量变化趋势图" name="fit">
        <el-row justify="end">
          <el-radio-group v-model="displayParamFit" size="small" @change="toggleParamFit">
            <el-radio-button v-for="param in displayOptionsFit" :label="param.key" :key="param.key">{{param.display_name}}</el-radio-button>
          </el-radio-group>
        </el-row>
        <el-row style="background:#fff;padding:16px 16px 5;margin-bottom:10px;" v-if="'fit' === activeTab">
          <line-chart :chart-data="fitData" />
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="水质统计量堆积柱形图" name="hist">
        <el-row justify="end">
          <el-radio-group v-model="displayParamHist" size="small" @change="toggleParamHist">
            <el-radio-button v-for="param in displayOptionsHist" :label="param.key" :key="param.key">{{param.display_name}}</el-radio-button>
          </el-radio-group>
        </el-row>
        <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:10px;"  v-if="'hist' === activeTab">
          <div class="chart-wrapper">
            <bar-chart :chart-data="histData"/>
          </div>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="不达标水质指标饼状图" name="pie">
        <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:10px;"  v-if="'pie' === activeTab">
          <div class="chart-wrapper">
            <pie-chart :chart-data="pieData"/>
          </div>
        </el-row>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { fetchWaterQuality, getUnique, getNUnique } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { parseTime } from "@/utils/ruoyi";
import { isNull } from 'util';
import { getUserProfile } from "@/api/system/user";
import LineChart from './LineChart'
import BarChart from './BarChart'
import PanelGroup from './PanelGroup'
import PieChart from "./PieChart"

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

const displayOptionsFit = [
  {key:'min',display_name:'最小值'},
  {key:'max',display_name:'最大值'},
  {key:'mean',display_name:'平均值'},
]

const displayOptionsHist = [
  {key:'tp',display_name:'总磷'},
  {key:'tn',display_name:'总氮'},
  {key:'tss',display_name:'总悬浮物'},
  {key:'chla',display_name:'叶绿素a'},
  {key:'cod',display_name:'化学需氧量'},
  {key:'nh',display_name:'氨氮'},
]

// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = typeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

// const displayData = {
//   idNumber: 7,
//   waterNumber: 4,
//   provinceNumber: 4,
//   typeNumber: 5
// }
const displayData = {
  idNumber: 0,
  waterNumber: 0,
  provinceNumber: 0,
  typeNumber: 0
}
let fitDisplay = {mean:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
                  min:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
                  max:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}}

let histDisplay = {tp: {mean:[], min:[], max:[]},
                   tn: {mean:[], min:[], max:[]},
                   tss: {mean:[], min:[], max:[]},
                   chla: {mean:[], min:[], max:[]},
                   cod: {mean:[], min:[], max:[]},
                   nh: {mean:[], min:[], max:[]}}

export default {
  name: 'Analysis',
  components: { LineChart,BarChart,PanelGroup,PieChart },
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
      displayData: {
        idNumber: 0,
        waterNumber: 0,
        provinceNumber: 0,
        typeNumber: 0
      },
      activeTab: 'fit',
      fitData:null,
      histData:null,
      params:['tp'],
      tableKey: 0,
      list: null,
      fitDisplay,
      histDisplay,
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
      displayParamFit: 'mean',
      displayParamHist: 'tp',
      dateRange: [],
      displayOptionsFit,
      displayOptionsHist,
      rules: {
        type: [{ required: true, message: '请输入数据源', trigger: 'blur' }],
        photoTime: [{ type: 'date', required: true, message: '请输入拍摄时间', trigger: 'blur' }],
        waterName: [{ required: true, message: '请输入水体', trigger: 'blur' }],
        province: [{ required: true, message: '请输入省份', trigger: 'blur' }],
        city: [{ required: true, message: '请输入城市', trigger: 'blur' }],
        filePath: [{ required: true, message: '请上传文件', trigger: 'blur' }]
      },
      downloadLoading: false,
      user: {},
    }
  },
  created() {
    this.getWaterQuality();
    this.getUser();
    this.getNUnique("id").then(response => {
      this.displayData.idNumber = response.data;
    });
    this.getNUnique("name").then(response => {
      this.displayData.waterNumber = response.data;
    });
    this.getNUnique("province").then(response => {
      this.displayData.provinceNumber = response.data;
    });
    this.getNUnique("type").then(response => {
      this.displayData.typeNumber = response.data;
    });
  },
  // watch:{
  //   fitData: function(){
  //     console.log('t:', this.fitDisplay.mean)
  //     return this.fitDisplay.mean
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
    getWaterQuality() {
      this.listLoading = true
      fetchWaterQuality(this.addDateRange(this.listQuery, this.dateRange)).then(response => {
        // this.list = response.rows;
        this.total = response.total;
        this.list = response.rows
        let fitDisplay = {mean:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
                          min:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}, 
                          max:{tp:[],tn:[],tss:[],chla:[],nh:[],cod:[]}}        
        let histDisplay = {tp: {mean:[], min:[], max:[]},
                           tn: {mean:[], min:[], max:[]},
                           tss: {mean:[], min:[], max:[]},
                           chla: {mean:[], min:[], max:[]},
                           cod: {mean:[], min:[], max:[]},
                           nh: {mean:[], min:[], max:[]}}

        this.list.forEach(function(ele){
          fitDisplay.mean.tp.push([ele.photoTime, ele.tpMean])
          fitDisplay.min.tp.push([ele.photoTime, ele.tpMin])
          fitDisplay.max.tp.push([ele.photoTime, ele.tpMax])

          fitDisplay.mean.tn.push([ele.photoTime, ele.tnMean])
          fitDisplay.min.tn.push([ele.photoTime, ele.tnMin])
          fitDisplay.max.tn.push([ele.photoTime, ele.tnMax])

          fitDisplay.mean.tss.push([ele.photoTime, ele.tssMean])
          fitDisplay.min.tss.push([ele.photoTime, ele.tssMin])
          fitDisplay.max.tss.push([ele.photoTime, ele.tssMax])

          fitDisplay.mean.cod.push([ele.photoTime, ele.codMean])
          fitDisplay.min.cod.push([ele.photoTime, ele.codMin])
          fitDisplay.max.cod.push([ele.photoTime, ele.codMax])

          fitDisplay.mean.chla.push([ele.photoTime, ele.chlaMean])
          fitDisplay.min.chla.push([ele.photoTime, ele.chlaMin])
          fitDisplay.max.chla.push([ele.photoTime, ele.chlaMax])

          fitDisplay.mean.nh.push([ele.photoTime, ele.nhMean])
          fitDisplay.min.nh.push([ele.photoTime, ele.nhMin])
          fitDisplay.max.nh.push([ele.photoTime, ele.nhMax])

          histDisplay.tp.mean.push([ele.photoTime, ele.tpMean])
          histDisplay.tp.min.push([ele.photoTime, ele.tpMin])
          histDisplay.tp.max.push([ele.photoTime, ele.tpMax])

          histDisplay.tn.mean.push([ele.photoTime, ele.tnMean])
          histDisplay.tn.min.push([ele.photoTime, ele.tnMin])
          histDisplay.tn.max.push([ele.photoTime, ele.tnMax])

          histDisplay.tss.mean.push([ele.photoTime, ele.tssMean])
          histDisplay.tss.min.push([ele.photoTime, ele.tssMin])
          histDisplay.tss.max.push([ele.photoTime, ele.tssMax])

          histDisplay.cod.mean.push([ele.photoTime, ele.codMean])
          histDisplay.cod.min.push([ele.photoTime, ele.codMin])
          histDisplay.cod.max.push([ele.photoTime, ele.chlaMax])

          histDisplay.chla.mean.push([ele.photoTime, ele.chlaMean])
          histDisplay.chla.min.push([ele.photoTime, ele.chlaMin])
          histDisplay.chla.max.push([ele.photoTime, ele.nhMax])

          histDisplay.nh.mean.push([ele.photoTime, ele.nhMean])
          histDisplay.nh.min.push([ele.photoTime, ele.nhMin])
          histDisplay.nh.max.push([ele.photoTime, ele.tpMax])
        })

        this.fitDisplay = fitDisplay
        this.histDisplay = histDisplay

        this.toggleParamFit(this.displayParamFit)
        this.toggleParamHist(this.displayParamHist)
        // [{"waterName":"西湖","tpMin":0.0,"tpMax":0.0,"tpMean":0.0,"photoTime":"2018-07-30T16:00:00.000+0000"}]}
      })
        this.listLoading = false;
        // setTimeout(() => {
        //   this.listLoading = false
        // }, 1.5 * 1000)
    },
    toggleParamFit(param){
      switch(param){
        case "mean":
          this.fitData = this.fitDisplay.mean
          break
        case "min":
          this.fitData = this.fitDisplay.min
          break
        case "max":
          this.fitData = this.fitDisplay.max
          break
        default:
          this.fitData = this.fitDisplay.mean
          break
      }
      
      this.fitData.tp.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.fitData.tn.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.fitData.tss.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.fitData.chla.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.fitData.cod.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.fitData.nh.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
    },

    toggleParamHist(param){
      switch(param){
        case "tp":
          this.histData = this.histDisplay.tp
          break
        case "tn":
          this.histData = this.histDisplay.tn
          break
        case "tss":
          this.histData = this.histDisplay.tss
          break
        case "cod":
          this.histData = this.histDisplay.cod
          break
        case "chla":
          this.histData = this.histDisplay.chla
          break
        case "nh":
          this.histData = this.histDisplay.nh
          break
        default:
          this.histData = this.histDisplay.tp
          break
      }
      
      this.histData.min.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.histData.max.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      this.histData.mean.sort(
          function(x,y){
            return x[0].localeCompare(y[0])
      })
      console.log('histData:',this.histData)
      
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
  height: 100%;
  margin: 10px;
}
</style>
