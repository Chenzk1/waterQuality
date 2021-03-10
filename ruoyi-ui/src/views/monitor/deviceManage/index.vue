<template>
  <div class="app-container">
    <div class="filter-container">
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

      <el-table-column label="运行状态" class-name="status-col" width="100"  align="center">
        <template slot-scope="scope">
            <el-switch
            v-model="scope.row.currentStatus"
            active-value=1
            inactive-value=0
            @change="handleStatusChange(scope.row)"
            ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="报警下限" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.lowerLimit }}</span>
        </template>
      </el-table-column>
      <el-table-column label="报警上限" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.upperLimit }}</span>
        </template>
      </el-table-column>
      <el-table-column label="时间" width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.generateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="当前值" min-width="150px" align="center" >
        <template slot-scope="scope" > 
          <span style="color:#FF0000;font-weight:bold" >{{ scope.row.currentValue }}</span>
        </template>
      </el-table-column>
      <el-table-column label="采样间隔" min-width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.timeOffset }}</span>
        </template>
      </el-table-column>
      <el-table-column label="历史数据" min-width="150px" align="center">
        <template slot-scope="{row}">
          <el-button type="text" size="mini" icon="el-icon-view" @click="handleView(row)">
            点击查看
          </el-button>
        </template>
      </el-table-column>
      <!-- <el-table-column label="接口" min-width="150px" align="center">
        <template slot-scope="{row}">
          <el-popover
            placement="right"
            width="220"
            trigger="hover">
            <el-table
              :data="apiData"
              height="250"
              border
              style="width: 100%">
              <el-table-column
                prop="action"
                label="操作"
                width="40">
              </el-table-column>
              <el-table-column
                prop="code"
                label="代码"
                width="160">
              </el-table-column>
            </el-table>
            <el-button slot="reference" type="primary" icon="el-icon-document">代码示例</el-button>
          </el-popover>
        </template> -->
        <!-- <template slot-scope="{row}">
          <el-button type="text" size="mini" icon="el-icon-view" @click="handleView(row)">
            点击查看
          </el-button>
        </template> -->
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

      <el-table-column label="责任人" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.contact }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系电话" width="80px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.phonenumber }}</span>
        </template>
      </el-table-column>

      <el-table-column fixed='right' label="Actions" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="text" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button type="text" size="mini" icon="el-icon-delete" @click="handleDelete(row)" v-hasPermi="['system:user:remove']">
            删除
          </el-button>
        </template>
      </el-table-column>
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
        <el-form-item label="状态" prop="currentStatus">
            <el-radio-group v-model="temp.currentStatus">
              <el-radio label="1"> 运行 </el-radio>
              <el-radio label="0"> 停用 </el-radio>
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
        <el-form-item label="当前值" prop="currentValue">
          <el-input v-model="temp.currentValue" />
        </el-form-item>
        <el-form-item label="省份" prop="province">
          <el-input v-model="temp.province" />
        </el-form-item>
        <el-form-item label="城市" prop="city">
          <el-input v-model="temp.city" />
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
  </div>
</template>

<script>
import { fetchDeviceList, fetchCreateDevice, fetchUpdateDevice, delDeviceId } from '@/api/data'
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
const statusOptions = [{'dictValue': "1", 'dictLable': '运行'},
                       {'dictValue': "0", 'dictLable': '停用'}]
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
      provinceOptions: [],
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      deviceNameOptions: [],
      statusOptions,
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
        currentStatus:""
      },
      dialogFormVisible: false,
      apiDialogFormVisible: false,
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
        currentValue: [{ required: true, message: '请输入测量读数', trigger: 'blur' }],
        generateTime: [{ type: 'date', required: true, message: '请输入数据生成时间', trigger: 'blur' }],
        deviceName: [{ required: true, message: '请输入设备名称', trigger: 'blur' }],
        province: [{ required: true, message: '请输入省份', trigger: 'blur' }],
        city: [{ required: true, message: '请输入城市', trigger: 'blur' }],
        currentStatus: [{ required: true, message: '请输入设备状态', trigger: 'blur' }],
        contact: [{ required: true, message: '请输入责任人', trigger: 'blur' }],
        emailAddress: [{ required: true, message: '请输入责任人邮箱', trigger: 'blur' }],
      },
      downloadLoading: false,
      fileList: [],
      user: {},
    }
  },
  created() {
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
      this.temp = Object.assign({}, this.listQuery) // copy obj
      fetchDeviceList(this.temp).then(response => {
        this.list = response.rows;
        this.total = response.total;
        // Just to simulate the time of the request
        console.log(this.list)
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
      row.currentStatus = status
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
        currentStatus:"1"
      }
    },
    handleView(row) {
      this.$router.push({
        path: `/waterMatterDruid/device/${row.deviceId}`
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
      var tempData = {}
      console.log(this.temp)
      for (var key in this.temp) {
        if (this.temp[key] != '') {tempData[key] = this.temp[key]}
      }
      let upFormData = new FormData();
      upFormData.append('body', JSON.stringify(tempData))
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          fetchCreateDevice(upFormData).then(() => {
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
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      let upFormData = new FormData();
      upFormData.append('body', JSON.stringify(this.temp))

      fetchUpdateDevice(upFormData).then(() => {
        for (const v of this.list) {
          if (v.deviceId === this.temp.deviceId) {
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
    handleDelete(row) {
      this.$confirm('是否确认删除ID为"' + row.deviceId + '"的设备数据?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delDeviceId(row.deviceId);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
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
