<template>
  <div class="app-container">
    <!-- <div class="filter-container">
      <el-input v-model="listQuery.deviceName" placeholder="设备搜索" style="width: 160px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.deviceName" placeholder="设备选择" clearable style="width: 160px" class="filter-item">
        <el-option v-for="item in deviceNameOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.indexType" placeholder="指标" clearable class="filter-item" style="width: 90px">
        <el-option v-for="item in indexTypeOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-date-picker
        v-model="dateRange"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        class="filter-item"
        style="width: 400px"
      />
      <el-select v-model="listQuery.sort" style="width: 140px" class="filter-item" @change="handleFilter">
        <el-option v-for="item in sortOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        添加
      </el-button>
      <!-- <el-button v-waves :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">
        导出
      </el-button> -->
    <!-- </div> -->

    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      @sort-change="sortChange"
    >
      <el-table-column fixed label="ID" prop="deviceId" sortable="custom" align="center" width="80" :class-name="getSortClass('id')">
        <template slot-scope="scope">
          <span>{{ scope.row.deviceID }}</span>
        </template>
      </el-table-column>
      <el-table-column label="设备名称" min-width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.deviceName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="指标类型" min-width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.indexType }}</span>
        </template>
      </el-table-column>
      <el-table-column label="位置" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.location }}</span>
        </template>
      </el-table-column>
      <el-table-column label="时间" width="150px" align="center">
        <template slot-scope="scope">
          <span style="color:#0000FF;font-weight:bold">{{ parseTime(scope.row.generateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="监控数据" min-width="150px" align="center" >
        <template slot-scope="scope" > 
          <span style="color:#0000FF;font-weight:bold">{{ scope.row.currentValue }}</span>
        </template>
      </el-table-column>
      <el-table-column label="采样间隔" min-width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.timeOffset }}</span>
        </template>
      </el-table-column>
      
      <el-table-column label="省份" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.province }}</span>
        </template>
      </el-table-column>
      <el-table-column label="城市" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.city }}</span>
        </template>
      </el-table-column>

      <!-- <el-table-column label="责任人" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.contact }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系电话" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.phonenumber }}</span>
        </template>
      </el-table-column> -->

      <!-- <el-table-column fixed='right' label="Actions" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="text" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button type="text" size="mini" icon="el-icon-delete" @click="handleDelete(row)" v-hasPermi="['system:user:remove']">
            删除
          </el-button>
        </template>
      </el-table-column> -->
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.pageSize" @pagination="getList" />

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="90px" style="width: 400px; margin-left:50px;">
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="temp.deviceName" />
        </el-form-item>
        <el-form-item label="指标类型" prop="type">
          <el-select v-model="temp.indexType" placeholder="指标类型">
            <el-option v-for="item in indexTypeOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
            <el-radio-group v-model="temp.status">
                    <el-radio
                    v-for="dict in statusOptions"
                    :key="dict.dictValue"
                    :label="dict.dictValue"
                    >{{dict.dictLabel}}</el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="报警上限" prop="upperLimit">
          <el-input v-model="temp.upperLimit" />
        </el-form-item>
        <el-form-item label="报警下限" prop="lowerLimit">
          <el-input v-model="temp.lowerLimit" />
        </el-form-item>
        <el-form-item label="采样间隔" prop="timeOffset">
          <el-input v-model="temp.timeOffset" />
        </el-form-item>
        <el-form-item label="时间" prop="generateTime">
          <el-date-picker v-model="temp.generateTime" type="datetime" placeholder="请选择日期" />
        </el-form-item>
        <el-form-item label="省份" prop="province">
          <el-input v-model="temp.province" />
        </el-form-item>
        <el-form-item label="城市" prop="city">
          <el-input v-model="temp.city" />
        </el-form-item>
        <el-form-item label="区县" width="80px">
          <el-input v-model="temp.county" />
        </el-form-item>
        <el-form-item label="位置" width="80px">
          <el-input v-model="temp.location" />
        </el-form-item>
        <el-form-item label="主管部门" width="80px">
          <el-input v-model="temp.department" />
        </el-form-item>
        <el-form-item label="责任人" width="80px">
          <el-input v-model="temp.contact" />
        </el-form-item>
        <el-form-item label="责任人电话" width="80px">
          <el-input v-model="temp.phonenumber" />
        </el-form-item>
        <el-form-item label="责任人邮箱" width="80px">
          <el-input v-model="temp.emailAddress" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">
          Cancel
        </el-button>
        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">
          Confirm
        </el-button>
      </div>
    </el-dialog>
<!-- 
    <el-dialog :visible.sync="dialogPvVisible" title="Reading statistics">
      <el-table :data="pvData" border fit highlight-current-row style="width: 100%">
        <el-table-column prop="key" label="Channel" />
        <el-table-column prop="pv" label="Pv" />
      </el-table>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogPvVisible = false">Confirm</el-button>
      </span>
    </el-dialog> -->
  </div>
</template>

<script>
import { fetchList, fetchCreate, fetchUpdate, delWaterId } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { parseTime } from "@/utils/ruoyi";
import { isNull } from 'util';
import { getUserProfile } from "@/api/system/user";

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
const indexTypeOptions = ['总悬浮物', '叶绿素', '溶解氧', '氨氮', '总磷', '化学需氧量']
const dataindexTypeOptions = [{'label':'影像数据', 'value':0}, 
                         {'label':'列表数据', 'value':1}]
const dataTypeMap = {0:'影像数据', 1:'列表数据'}
const statusOptions = [{'dictValue': 1, 'dictLable': '运行'},
                       {'dictValue': 0, 'dictLable': '停用'}]
let deviceNameOptions = []
let provinceOptions = [
  '北京市', '广东省', '山东省', '江苏省', '河南省', '上海市', '河北省', '浙江省', '香港特别行政区', '陕西省', '湖南省', '重庆市',
  '福建省', '天津市', '云南省', '四川省', '广西壮族自治区', '安徽省', '海南省', '江西省', '湖北省', '山西省', '辽宁省', '台湾省',
  '黑龙江', '内蒙古自治区', '澳门特别行政区', '贵州省', '甘肃省', '青海省', '新疆维吾尔自治区', '西藏自治区', '吉林省', '宁夏回族自治区'
]
// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = indexTypeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

export default {
  name: 'deviceManage',
  components: { Pagination },
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
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        pageSize: 5,
        province: undefined,
        deviceName: undefined,
        indexType: undefined,
        sort: '+id',
      },
      // 日期范围
      dateRange: [],
      indexTypeOptions,
      statusOptions,
      provinceOptions: [],
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      deviceNameOptions: [],
      showReviewer: false,
      temp: {
        deviceId: undefined,
        generateTime: new Date(),
        deviceName: '',
        indexType: '',
        lowerLimit: '',
        upperLimit: '',
        generateTime: '',
        currentValue: '',
        province: '',
        city: '',
        location:'',
        department:'',
        contact:'',
        phonenumber:'',
        status:""
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
        indexType: [{ required: true, message: '请输入测量指标', trigger: 'blur' }],
        generateTime: [{ type: 'date', required: true, message: '请输入数据生成时间', trigger: 'blur' }],
        deviceName: [{ required: true, message: '请输入设备名称', trigger: 'blur' }],
        province: [{ required: true, message: '请输入省份', trigger: 'blur' }],
        city: [{ required: true, message: '请输入城市', trigger: 'blur' }],
        status: [{ required: true, message: '请输入设备状态', trigger: 'blur' }],
        contact: [{ required: true, message: '请输入责任人', trigger: 'blur' }],
        emailAddress: [{ required: true, message: '请输入责任人邮箱', trigger: 'blur' }],
      },
      downloadLoading: false,
      fileList: [],
      user: {},
    }
  },
  created() {
    if(this.$route.params.id==':id'){
        this.listQuery.deviceId=100001
    }
    this.getList();
    this.getUser();
    // this.getUnique("type").then(response => {
    //   this.indexTypeOptions = response.data;
    // });
    this.getUnique("province").then(response => {
      this.provinceOptions = response.data;
    });
    // this.getUnique("deviceName").then(response => {
    //   this.deviceNameOptions = response.data;
    // });

  },
  methods: {
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data;
        this.roleGroup = response.roleGroup;
        this.postGroup = response.postGroup;
      });
    },
    getList() {
      this.listLoading = true
      this.list = [
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.6, 
         "generateTime":"2020-08-05T06:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.2, 
         "generateTime":"2020-08-05T00:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.3, 
         "generateTime":"2020-08-04T18:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.7, 
         "generateTime":"2020-08-04T12:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.8, 
         "generateTime":"2020-08-04T06:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.6, 
         "generateTime":"2020-08-04T00:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
        {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.5, 
         "generateTime":"2020-08-03T18:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"}, 
         {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.3, 
         "generateTime":"2020-08-03T12:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"}, 
         {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.6, 
         "generateTime":"2020-08-03T06:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},  
         {"deviceID":"100001", "deviceName":"ph测定仪", "indexType":"ph值", "timeOffset": '6小时',
         "lowerLimit":"6.0", "upperLimit":"9.0", "status": "1", "currentValue": 7.8, 
         "generateTime":"2020-08-03T00:00:00.000+0000", "province":"广东省","city":"深圳市",
         "location":"深圳市茅洲河洋涌大桥断面","department":"深州市水务管理局","contact":"D",
         "phonenumber":"17812345569", "emailAddress": "17812345569@xx.com"},      
      ]
      this.total = 20
      this.listLoading = false
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作Success',
        type: 'success'
      })
      row.status = status
    },
    sortChange(data) {
      const { prop, order } = data
      if (prop === 'id') {
        this.sortByID(order)
      }
    },
    sortByID(order) {
      if (order === 'ascending') {
        this.listQuery.sort = '+id'
      } else {
        this.listQuery.sort = '-id'
      }
      this.handleFilter()
    },
    resetTemp() {
      this.temp = {
        deviceId: undefined,
        generateTime: new Date(),
        deviceName: '',
        indexType: '',
        lowerLimit: '',
        upperLimit: '',
        generateTime: '',
        currentValue: '',
        province: '',
        city: '',
        location:'',
        department:'',
        contact:'',
        phonenumber:'',
        status:""
      }
    },
    handleView(row) {
      // this.temp = Object.assign({}, row) // copy obj
      // this.temp.generateTime= new Date(this.temp.timestamp)
      // this.dialogStatus = 'view'
      // this.dialogFormVisible = true
      this.$router.push({
        path: `/monitor/deviceManagement/${row.deviceId}`
      })
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      // this.temp.fileName = this.fileList[0].name
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          fetchCreate(this.temp).then(() => {
            this.list.unshift(this.temp)
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Created Successfully',
              type: 'success',
              duration: 2000
            })
            this.getList();
          })
        }
      })
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj

      const dataTypeMap = {'影像数据':0, '列表数据': 1}
      this.temp.dataType = dataTypeMap[row.dataType]

      if (this.temp.filePath!=null){
        this.fileList.push({name:this.temp.fileName, url:this.temp.filePath})
      }
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.temp.fileName = this.fileList[0].name
      console.log('test')
      console.log(this.$refs['dataForm'])

      const tempData = Object.assign({}, this.temp)
      console.log('test1')

      fetchUpdate(tempData).then(() => {
        for (const v of this.list) {
          if (v.waterId === this.temp.waterId) {
            const index = this.list.indexOf(v)
            this.list.splice(index, 1, this.temp)
            break
          }
        }
        this.dialogFormVisible = false
        this.$notify({
          title: 'Success',
          message: '更新成功',
          type: 'success',
          duration: 2000
        })
      })

    },
    beforeUpload(file){
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        this.temp.fileName = reader.result.fileName;
      };
    },
    // handleRemove(file, fileList) {
    //     this.temp.fileName;
    // },
    // handleDelete(row) {
    //   this.$notify({
    //     title: 'Success',
    //     message: '删除成功',
    //     type: 'success',
    //     duration: 2000
    //   })
    //   const index = this.list.indexOf(row)
    //   this.list.splice(index, 1)
    // },
    handleDelete(row) {
      this.$confirm('是否确认删除ID为"' + row.waterId + '"的水体数据?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delWaterId(row.waterId);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    handleDownload() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['waterId','generateTime', 'waterName', 'type', 'province']
        const filterVal = ['waterId','generateTime', 'waterName', 'type', 'province']
        const data = this.formatJson(filterVal, this.list)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: '导出'
        })
        this.downloadLoading = false
      })
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => {
        if (j === 'generateTime') {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    },
    getSortClass: function(key) {
      const sort = this.listQuery.sort
      return sort === `+${key}`
        ? 'ascending'
        : sort === `-${key}`
          ? 'descending'
          : ''
    }
  }
}
</script>
