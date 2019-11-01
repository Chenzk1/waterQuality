<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.waterName" placeholder="水体搜索" style="width: 160px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.waterName" placeholder="水体选择" clearable style="width: 160px" class="filter-item">
        <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.type" placeholder="数据源" clearable class="filter-item" style="width: 90px">
        <el-option v-for="item in TypeOptions" :key="item" :label="item" :value="item" />
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
      <el-button v-waves :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">
        导出
      </el-button>
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
      <el-table-column label="拍摄日期" width="150px" align="center">
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
          <span>{{ scope.row.contactInformation }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据源" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.type }}</span>
        </template>
      </el-table-column>
      <el-table-column label="波段数" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.bands }}</span>
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
        <!-- <el-form-item label="拍摄日期" prop="photoTime">
          <el-date-picker v-model="temp.photoTime" type="datetime" placeholder="请选择日期" />
        </el-form-item> -->
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
          <el-input v-model="temp.contactInformation" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="temp.remark" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="请输入" />
        </el-form-item>
        <el-form-item v-show="dialogStatus!='create' && temp.rgbPath!=''" label="图片">
          <div class="block">
            <span class="demonstration">加载中</span>
            <el-image :src="temp.rgbPath" />
          </div>
        </el-form-item>
        <el-form-item label="上传">
          <el-upload :show-file-list="True" :before-upload="beforeUpload" 
          :file-list="fileList" :on-remove="handleRemove" :auto-upload="false"
          ref="upload" limit=1>
            <el-button slot="trigger" size="medium" type="primary">选取文件</el-button>
            <!-- <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button> -->
            <div slot="tip" class="el-upload__tip">只能上传一个文件</div>
          </el-upload>
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
let TypeOptions = [
  { key: 'MODIS', display_name: 'MODIS' },
  { key: 'GF-1', display_name: '高分一号' },
  { key: 'GF-2', display_name: '高分二号' },
  { key: 'GF-3', display_name: '高分三号' },
  { key: 'LANDSAT-5', display_name: 'LANDSAT-5' },
  { key: 'LANDSAT-8', display_name: 'LANDSAT-8' }
]
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
      TypeOptions: [],
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
    this.getList();
    this.getUser();
    this.getUnique("type").then(response => {
      this.TypeOptions = response.data;
    });
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
      fetchList(this.addDateRange(this.listQuery, this.dateRange)).then(response => {
        this.list = response.rows;
        this.total = response.total;
        // Just to simulate the time of the request
        this.listLoading = false;
        // setTimeout(() => {
        //   this.listLoading = false
        // }, 1.5 * 1000)
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
      console.log(this.fileList)
      this.temp.fileName = this.fileList[0].name
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
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
        }
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
