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
          <span>{{ scope.row.deviceId }}</span>
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
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.pageSize" @pagination="getList" />
  </div>
</template>

<script>
import { fetchDeviceHistory } from '@/api/data'
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
const statusOptions = [{'dictValue': 1, 'dictLable': '运行'},
                       {'dictValue': 0, 'dictLable': '停用'}]
// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = indexTypeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

export default {
  name: 'deviceHistory',
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
        deviceId: undefined,
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
    console.log('id:', this.$route.params.id)
    if(this.$route.params.id==':id'){
      this.listQuery.deviceId=100000
    } else {
      this.listQuery.deviceId = this.$route.params.id
    }
    console.log('query:', this.listQuery)
    this.getList();
    this.getUser();
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
      console.log(this.temp)
      fetchDeviceHistory(this.temp).then(response => {
        this.list = response.rows;
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
