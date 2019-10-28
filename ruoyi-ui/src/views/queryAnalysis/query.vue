<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.name" placeholder="水体搜索" style="width: 180px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.name" placeholder="水体选择" clearable style="width: 180px" class="filter-item">
        <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.type" placeholder="数据源" clearable class="filter-item" style="width: 90px">
        <el-option v-for="item in TypeOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-date-picker
        v-model="listQuery.dateRange"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        value-format="timestamp"
        class="filter-item"
        style="width: 500px"
      />
      <!-- <el-date-picker type="date" placeholder="选择日期" v-model="listQuery.startDate" style="width: 100%;"></el-date-picker>
      <el-col class="line" :span="2">-</el-col>
      <el-time-picker placeholder="选择日期" v-model="listQuery.endDate" style="width: 100%;"></el-time-picker> -->
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
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
      <el-table-column label="ID" prop="id" sortable="custom" align="center" width="80" :class-name="getSortClass('id')">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="拍摄日期" width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.timestamp | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="水体" min-width="80px">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
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
      <el-table-column label="类型" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.type }}</span>
        </template>
      </el-table-column>
      <el-table-column label="反演结果图" class-name="status-col" width="300">
        <template slot-scope="scope">
          <img :src="scope.row.tp.resultPicture" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
        </template>
      </el-table-column>
      <el-table-column label="统计值" align="center" width="230" class-name="small-padding fixed-width">
        <el-table-column label="均值" class-name="status-col" width="100">
          <el-table-column label="总磷" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tp.mean }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tn.mean }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总悬浮物" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tss.mean }}</span>
            </template>
          </el-table-column>
          <el-table-column label="叶绿素a" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.chla.mean }}</span>
            </template>
          </el-table-column>
          <el-table-column label="氨氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.nh.mean }}</span>
            </template>
          </el-table-column>
        </el-table-column>

        <el-table-column label="最小值" class-name="status-col" width="100">
          <el-table-column label="总磷" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tp.min }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tn.min }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总悬浮物" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tss.min }}</span>
            </template>
          </el-table-column>
          <el-table-column label="叶绿素a" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.chla.min }}</span>
            </template>
          </el-table-column>
          <el-table-column label="氨氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.nh.min }}</span>
            </template>
          </el-table-column>
        </el-table-column>
        <el-table-column label="最大值" class-name="status-col" width="100">
          <el-table-column label="总磷" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tp.max }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tn.max }}</span>
            </template>
          </el-table-column>
          <el-table-column label="总悬浮物" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.tss.max }}</span>
            </template>
          </el-table-column>
          <el-table-column label="叶绿素a" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.chla.max }}</span>
            </template>
          </el-table-column>
          <el-table-column label="氨氮" class-name="status-col" width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.nh.max }}</span>
            </template>
          </el-table-column>
        </el-table-column>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="90px" style="width: 400px; margin-left:50px;">
        <el-form-item label="数据源" prop="type">
          <el-select v-model="temp.type" class="filter-item" placeholder="请选择">
            <el-option v-for="item in TypeOptions" :key="item.key" :label="item.display_name" :value="item.key" />
          </el-select>
        </el-form-item>
        <el-form-item label="拍摄日期" prop="timestamp">
          <el-date-picker v-model="temp.timestamp" type="datetime" placeholder="请选择日期" />
        </el-form-item>
        <el-form-item label="水体" prop="name">
          <el-input v-model="temp.name" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="temp.remark" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="请输入" />
        </el-form-item>
        <el-form-item v-show="dialogStatus!='create'" label="图片">
          <div class="block">
            <span class="demonstration">加载中</span>
            <el-image :src="temp.rgb" />
          </div>
        </el-form-item>
        <el-form-item v-show="dialogStatus==='create'" label="上传">
          <el-input v-model="temp.remark" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="请输入" />
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

    <el-dialog :visible.sync="dialogPvVisible" title="Reading statistics">
      <el-table :data="pvData" border fit highlight-current-row style="width: 100%">
        <el-table-column prop="key" label="Channel" />
        <el-table-column prop="pv" label="Pv" />
      </el-table>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogPvVisible = false">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { fetchList, createData, updateData, fetchResult, fetchLevel } from '@/api/data'

import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // secondary package based on el-pagination

const TypeOptions = [
  { key: 'MODIS', display_name: 'MODIS' },
  { key: 'GF-1', display_name: '高分一号' },
  { key: 'GF-2', display_name: '高分二号' },
  { key: 'GF-3', display_name: '高分三号' },
  { key: 'LANDSAT-5', display_name: 'LANDSAT-5' },
  { key: 'LANDSAT-8', display_name: 'LANDSAT-8' }
]
const nameOptions = []
const provinceOptions = [
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
  name: 'Query',
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
        limit: 20,
        province: undefined,
        name: undefined,
        type: undefined,
        sort: '+id',
        dateRange: undefined
      },
      uniqueQuery: {
        province: undefined,
        name: undefined,
        type: undefined,
        id: undefined,
        dateRange: undefined,
        city: undefined
      },
      TypeOptions,
      provinceOptions,
      provinceNunique: 0,
      nameOptions,
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      showReviewer: false,
      temp: {
        id: undefined,
        timestamp: new Date(),
        name: '',
        type: '',
        province: '浙江省',
        rgb: ''
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
        type: [{ required: true, message: 'type is required', trigger: 'change' }],
        timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        title: [{ required: true, message: 'title is required', trigger: 'blur' }]
      },
      downloadLoading: false
    }
  },
  created() {
    this.getList()
    // this.getUnique()
  },
  methods: {
    getList() {
      this.listLoading = true

      fetchList(this.listQuery).then(response => {
        this.list = response.data.items
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    getUnique() {
      this.listLoading = true
      fetchUnique(this.uniqueQuery).then(response => {
        this.provinceOptions = response.data.provinceUnique
        this.provinceNunique = response.data.provinceNunique
        this.nameOptions = response.data.nameUnique
        this.TypeOptions = response.data.typeUnique
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
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
        id: undefined,
        importance: 1,
        remark: '',
        timestamp: new Date(),
        title: '',
        status: 'published',
        type: ''
      }
    },
    handleView(row) {
      // this.temp = Object.assign({}, row) // copy obj
      // this.temp.timestamp = new Date(this.temp.timestamp)
      // this.dialogStatus = 'view'
      // this.dialogFormVisible = true
      this.$router.push({
        path: `/monitorEvaluation/monitor/${row.id}`
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
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.temp.id = parseInt(Math.random() * 100) + 1024 // mock a id
          this.temp.author = 'vue-element-admin'
          createArticle(this.temp).then(() => {
            this.list.unshift(this.temp)
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Created Successfully',
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
          tempData.timestamp = +new Date(tempData.timestamp) // change Thu Nov 30 2017 16:41:05 GMT+0800 (CST) to 1512031311464
          updateArticle(tempData).then(() => {
            for (const v of this.list) {
              if (v.id === this.temp.id) {
                const index = this.list.indexOf(v)
                this.list.splice(index, 1, this.temp)
                break
              }
            }
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Update Successfully',
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    },
    handleDelete(row) {
      this.$notify({
        title: 'Success',
        message: 'Delete Successfully',
        type: 'success',
        duration: 2000
      })
      const index = this.list.indexOf(row)
      this.list.splice(index, 1)
    },
    handleFetchPv(pv) {
      fetchPv(pv).then(response => {
        this.pvData = response.data.pvData
        this.dialogPvVisible = true
      })
    },
    handleDownload() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['timestamp', 'title', 'type', 'importance', 'status']
        const filterVal = ['timestamp', 'title', 'type', 'importance', 'status']
        const data = this.formatJson(filterVal, this.list)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'table-list'
        })
        this.downloadLoading = false
      })
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => {
        if (j === 'timestamp') {
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
