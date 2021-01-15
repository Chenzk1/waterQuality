<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.waterName" placeholder="水体搜索" style="width: 120px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.waterName" placeholder="水体选择" clearable style="width: 120px" class="filter-item">
        <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.type" placeholder="数据源" clearable class="filter-item" style="width: 90px">
        <el-option v-for="item in TypeOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.dataType" placeholder="数据类型" clearable class="filter-item" style="width: 120px">
        <el-option v-for="item in dataTypeOptions" :key="item.value" :label="item.label" :value="item.value" />
      </el-select>
      <el-date-picker
        v-model="dateRange"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        class="filter-item"
        style="width: 360px"
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
    </div>

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
      <el-table-column fixed label="ID" prop="waterId" sortable="custom" align="center" width="80" :class-name="getSortClass('id')">
        <template slot-scope="scope">
          <span>{{ scope.row.waterId }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据生成时间" width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.photoTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="水体" min-width="150px">
        <template slot-scope="scope">
          <span>{{ scope.row.waterName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="省份" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.province }}</span>
        </template>
      </el-table-column>
      <el-table-column label="城市" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.city }}</span>
        </template>
      </el-table-column>
      <el-table-column label="区县" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.county }}</span>
        </template>
      </el-table-column>
      <el-table-column label="位置" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.location }}</span>
        </template>
      </el-table-column>
      <el-table-column label="主管部门" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.department }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系人" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.contact }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系方式" width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.phonenumber }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据源" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.type }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据类型" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.dataType }}</span>
        </template>
      </el-table-column>
      <el-table-column label="波段数" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.bands }}</span>
        </template>
      </el-table-column>
      <el-table-column label="波段文件" class-name="status-col" width="100" v-if="false">
        <template slot-scope="scope">
          <span>{{ scope.row.bandWavelengthFilePath }}</span>
        </template>
      </el-table-column>
      <el-table-column label="列表文件" class-name="status-col" width="100" v-if="false">
        <template slot-scope="scope">
          <span>{{ scope.row.filePath }}</span>
        </template>
      </el-table-column>
      <el-table-column fixed='right' label="Actions" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="text" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button type="text" size="mini" icon="el-icon-view" @click="handleView(row)">
            查看
          </el-button>
          <el-button type="text" size="mini" icon="el-icon-delete" @click="handleDelete(row)" v-hasPermi="['system:user:remove']">
            删除
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="备注" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.remark }}</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.pageSize" @pagination="getList" />

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="90px" style="width: 400px; margin-left:50px;">
        <el-form-item label="数据源" prop="type">
          <el-select v-model="temp.type" placeholder="数据源" clearable class="filter-item">
            <el-option v-for="item in TypeOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="数据类型" prop="dataType">
          <el-select v-model="temp.dataType" placeholder="数据类型" clearable class="filter-item">
            <el-option v-for="item in dataTypeOptions" :key="item.value" :label="item.label" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="数据日期" prop="photoTime">
          <el-date-picker v-model="temp.photoTime" type="datetime" placeholder="请选择日期" />
        </el-form-item>
        <el-form-item label="水体" prop="waterName">
          <el-input v-model="temp.waterName" />
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
        <el-form-item label="联系人" width="80px">
          <el-input v-model="temp.contact" />
        </el-form-item>
        <el-form-item label="联系方式" width="80px">
          <el-input v-model="temp.phonenumber" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="temp.remark" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="请输入" />
        </el-form-item>
        <!-- <el-form-item v-show="dialogStatus!='create' && temp.rgbPath!=''" label="图片">
          <div class="block">
            <span class="demonstration">加载中</span>
            <el-image :src="temp.rgbPath" />
          </div>
        </el-form-item> -->
        <el-form-item label="遥感影像文件路径" v-if="temp.dataType === 0">
          <el-input v-model="temp.filePath" />
        </el-form-item>
        <el-form-item label="遥感列表文件上传" v-if="temp.dataType === 1">
          <el-upload :show-file-list="true" :before-upload="beforeCsvUpload"
                     accept=".xls,.xlsx,.csv" action="" :headers="uploadCsv.headers"
                     :file-list="uploadCsv.fileList" :on-remove="handleCsvRemove" :auto-upload="false"
                     :on-change="handleCsvChange" :on-exceed="handleCsvExceed"
                     :on-progress="handleCsvProgress" :on-success="handleCsvSuccess"
                     :http-request="httpCsvRequest" ref="uploadCsv" :limit="1">
            <el-button slot="trigger" size="medium" type="primary">选取文件</el-button>
            <div slot="tip" class="el-upload__tip">只能上传一个csv/xls/xlsx格式的文件，且不超过100MB</div>
          </el-upload>
        </el-form-item>
        <el-form-item label="波段文件" v-if="temp.type === '自定义'">
          <el-upload :show-file-list="true" :before-upload="beforeBandUpload"
                     accept=".txt"  action="" :headers="uploadBand.headers"
                     :file-list="uploadBand.fileList" :on-remove="handleBandRemove" :auto-upload="false"
                     :on-change="handleBandChange" :on-exceed="handleBandExceed" 
                     :on-progress="handleBandProgress" :on-success="handleBandSuccess"
                     :http-request="httpBandRequest" ref="uploadBand" :limit="1">
            <el-button slot="trigger" size="medium" type="primary">选取文件</el-button>
            <div slot="tip" class="el-upload__tip">只能上传一个txt格式的文件</div>
          </el-upload>
        </el-form-item>
        <!-- <el-form-item label="上传">
          <el-upload :show-file-list="True" :before-upload="beforeUpload" 
          :file-list="fileList" :on-remove="handleRemove" :auto-upload="false"
          ref="upload" limit=1>
            <el-button slot="trigger" size="medium" type="primary">选取文件</el-button>
            <div slot="tip" class="el-upload__tip">只能上传一个文件</div>
          </el-upload>
        </el-form-item> -->
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
import { fetchList, fetchCreateList, fetchUpdateList, delWaterId } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { parseTime } from "@/utils/ruoyi";
import { isNull } from 'util';
import { getUserProfile } from "@/api/system/user";
import { getToken } from "@/utils/auth";

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
const TypeOptions = ['MODIS', 'GF-1', 'GF-2', 'GF-3', 'LANDSAT-5', 'LANDSAT-8', '自定义']
const dataTypeOptions = [{'label':'影像数据', 'value':0}, 
                         {'label':'列表数据', 'value':1}]
const dataTypeMap = {0:'影像数据', 1:'列表数据'}

let nameOptions = []
let provinceOptions = [
  '北京市', '广东省', '山东省', '江苏省', '河南省', '上海市', '河北省', '浙江省', '香港特别行政区', '陕西省', '湖南省', '重庆市',
  '福建省', '天津市', '云南省', '四川省', '广西壮族自治区', '安徽省', '海南省', '江西省', '湖北省', '山西省', '辽宁省', '台湾省',
  '黑龙江', '内蒙古自治区', '澳门特别行政区', '贵州省', '甘肃省', '青海省', '新疆维吾尔自治区', '西藏自治区', '吉林省', '宁夏回族自治区'
]
// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = TypeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

export default {
  name: 'DataManage',
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
        pageSize: 10,
        province: undefined,
        name: undefined,
        type: undefined,
        sort: '+id',
      },
      // 日期范围
      dateRange: [],
      TypeOptions,
      dataTypeOptions,
      dataTypeMap,
      provinceOptions: [],
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      nameOptions: [],
      showReviewer: false,
      temp: {
        waterId: undefined,
        photoTime: new Date(),
        waterName: '',
        type: '',
        dataType: '',
        province: '浙江省',
        rgbPath: '',
        filePath: '',
        fileName: '',
        county: '',
        location:'',
        department:'',
        contact:'',
        phonenumber:'',
        remark:""
      }, // 用来upadte和create的，别瞎用
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
        dataType: [{ required: true, message: '请输入数据类型', trigger: 'blur' }],
        photoTime: [{ type: 'date', required: true, message: '请输入数据生成时间', trigger: 'blur' }],
        waterName: [{ required: true, message: '请输入水体', trigger: 'blur' }],
        province: [{ required: true, message: '请输入省份', trigger: 'blur' }],
        city: [{ required: true, message: '请输入城市', trigger: 'blur' }],
        filePath: [{ required: true, message: '请上传文件', trigger: 'blur' }]
      },
      downloadLoading: false,
      uploadCsv: {fileList: [],
                  headers: { Authorization: "Bearer " + getToken() },
                  isUploading: false,
                  url: process.env.VUE_APP_BASE_API + '/profile/' + 'remoteTableFile/'
      },
      uploadBand: {fileList: [],
                   headers: { Authorization: "Bearer " + getToken() },
                   isUploading: false,
                   url: process.env.VUE_APP_BASE_API + '/profile/' + 'bandWavelengthFile/'
      },
      user: {},
    }
  },
  created() {
    this.getList();
    this.getUser();
    // this.getUnique("type").then(response => {
    //   this.TypeOptions = response.data;
    // });
    this.getUnique("province").then(response => {
      this.provinceOptions = response.data;
    });
    this.getUnique("name").then(response => {
      this.nameOptions = response.data;
    });

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
      this.temp = Object.assign({}, this.listQuery) // copy obj
      if(this.temp.type == '自定义') this.temp.type = 'custom';
      fetchList(this.addDateRange(this.temp, this.dateRange)).then(response => {
        this.list = response.rows;
        this.list.forEach(function(element){
          element.rgbPath = process.env.VUE_APP_BASE_API + '/profile/' + element.rgbPath
          const dataTypeMap = {0:'影像数据', 1:'列表数据'}
          element.dataType = dataTypeMap[element.dataType]
          if(!element.bandWavelengthFilePath) {
            element.bandWavelengthFilePath = 'bandWavelengthFile/' + element.type + ".txt"
          }
        })
        this.total = response.total;
        // Just to simulate the time of the request
        this.listLoading = false;
      })
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
        waterId: undefined,
        photoTime: new Date(),
        waterName: '',
        type: '',
        dataType: '',
        province: '浙江省',
        rgbPath: '',
        filePath: '',
        fileName: '',
        county: '',
        location:'',
        department:'',
        contact:'',
        phonenumber:'',
        remark:""
      }
    },
    handleView(row) {
      // this.temp = Object.assign({}, row) // copy obj
      // this.temp.photoTime= new Date(this.temp.timestamp)
      // this.dialogStatus = 'view'
      // this.dialogFormVisible = true
      this.$router.push({
        path: `/monitorEvaluation/monitor/${row.waterId}`
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
          fetchCreateList(this.temp).then(() => {
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
      // if (this.temp.filePath!=null){
      //   this.fileList.push({name:this.temp.fileName, url:this.temp.filePath})
      // }
      const bandWavelengthFilePath = [this.temp.bandWavelengthFilePath]
      let bandFile = bandWavelengthFilePath.map(item => {
        let pos = item.lastIndexOf('/')
        let lastName = item.substring(pos+1, item.length)
        return {
          name: lastName,
          url: process.env.VUE_APP_BASE_API + '/profile/' + item
        }
      })
      this.uploadBand.fileList = bandFile

      const filePath = [this.temp.filePath]
      let csvFile = filePath.map(item => {
        let pos = item.lastIndexOf('/')
        let lastName = item.substring(pos+1, item.length)
        return {
          name: lastName,
          url: process.env.VUE_APP_BASE_API + '/profile/' + item
        }
      })
      this.uploadCsv.fileList = csvFile
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      console.log('test')
      let upFormData = new FormData();
      if (this.temp.type==='自定义' && this.uploadBand.fileList.length>=1) {
        this.temp.bandWavelengthFilePath = 'bandWavelengthFile/' + this.uploadBand.fileList[0].name
        this.$refs.uploadBand.submit()
        if(!this.uploadBand.file) {this.uploadBand.file = this.uploadBand.fileList[0].raw}
        upFormData.append('bandWavelengthFile', this.uploadBand.file)
      }
      if (this.temp.dataType===1 && this.uploadCsv.fileList.length>=1) {
        this.temp.filePath = 'remoteTableFile/' + this.uploadCsv.fileList[0].name
        this.temp.fileName = this.uploadCsv.fileList[0].name
        console.log("uploadCsv: ", this.uploadCsv.file)
        this.$refs.uploadCsv.submit()
        console.log("uploadCsv: ", this.uploadCsv.file)
        if(!this.uploadCsv.file) {this.uploadCsv.file = this.uploadCsv.fileList[0].raw}
        upFormData.append('remoteTableFile', this.uploadCsv.file)
      }
      
      upFormData.append('body', JSON.stringify(this.temp))
      // const tempData = Object.assign({}, this.temp);
      // this.$refs.uploadCsv.submit();
      // this.$refs.uploadBand.submit();
      fetchUpdateList(upFormData).then(() => {
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

    handleCsvExceed(files, fileList) {
        // if(fileList.length >= 1) this.uploadCsv.fileList = [fileList[fileList.length-1]]
        this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
    },
    beforeCsvUpload(file) {
      let fileName = file.name
      let pos = fileName.lastIndexOf('.')
      let lastName = fileName.substring(pos, fileName.length)
      const fileType = lastName.toLowerCase() !== ".csv" && lastName.toLowerCase() !== ".xls" && lastName.toLowerCase() !== ".xlsx";
      const fileLimit = file.size / 1024 / 1024 < 100;
      if (fileType) {
        this.msgError("文件格式错误，请上传csv/xls/xlsx后缀的文件。");
      } else if (!fileLimit) {
        this.msgError("文件大小不超过100M！");
      }
      return fileType && fileLimit;
    },
    handleCsvChange(file, fileList) {
      if(fileList.length >= 1) this.uploadCsv.fileList = [fileList[fileList.length-1]]
    },
    handleCsvRemove(file, fileList) {
      if(fileList.length < 1) this.csvUploadDisabled = true
    },
    handleCsvProgress(event, file, fileList) {
      this.uploadCsv.isUploading = true;
    },
    handleCsvSuccess(response, file, fileList) {
      this.uploadCsv.isUploading = false;
      // this.form.filePath = response.url;
      this.msgSuccess(response.msg);
    },
    httpCsvRequest(param) {
      console.log('param:', param)
      this.uploadCsv.file = param.file
    },

    handleBandExceed(files, fileList) {
        // if(fileList.length >= 1) this.uploadBand.fileList = [fileList[fileList.length-1]]
        this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
    },
    beforeBandUpload(file) {
      let fileName = file.name
      let pos = fileName.lastIndexOf('.')
      let lastName = fileName.subsring(pos, fileName.length)
      const fileType = lastName.toLowerCase() !== ".txt";
      const fileLimit = file.size / 1024 / 1024 < 100;
      if (fileType) {
        this.msgError("文件格式错误，请上传txt后缀的文件。");
      } else if (!fileLimit) {
        this.msgError("文件大小不超过100M！");
      }
      return fileType && fileLimit;
    },
    handleBandChange(file, fileList) {
      if(fileList.length >= 1) this.uploadBand.fileList = [fileList[fileList.length-1]]
    },
    handleBandRemove(file, fileList) {
      if(fileList.length < 1) this.bandUploadDisabled = true
    },
    handleBandProgress(event, file, fileList) {
      this.uploadBand.isUploading = true;
    },
    handleBandSuccess(response, file, fileList) {
      this.uploadBand.isUploading = false;
      // this.form.filePath = response.url;
      this.msgSuccess(response.msg);
    },
    httpBandRequest(param) {
      this.uploadBand.file = param.file
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
        const tHeader = ['waterId','photoTime', 'waterName', 'type', 'province']
        const filterVal = ['waterId','photoTime', 'waterName', 'type', 'province']
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
        if (j === 'photoTime') {
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
