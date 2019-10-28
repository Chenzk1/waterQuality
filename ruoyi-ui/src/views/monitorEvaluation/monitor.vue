<template>
  <div class="monitor-container">
    <el-row :gutter="24" style="margin:20px">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="listForm" :model="listForm" prop="listForm" label-width="100px">
            <el-form-item label="ID" prop="waterId">
              <el-input v-model="listForm.waterId" :disabled="true" />
            </el-form-item>
            <el-form-item label="水体" prop="waterName">
              <el-input v-model="listForm.waterName" :disabled="true" />
            </el-form-item>
            <el-form-item label="国家" prop="country">
              <el-input v-model="listForm.conntry" :disabled="true" />
            </el-form-item>
            <el-form-item label="省份" prop="province">
              <el-input v-model="listForm.province" :disabled="true" />
            </el-form-item>
            <el-form-item label="城市" prop="city">
              <el-input v-model="listForm.city" :disabled="true" />
            </el-form-item>
            <el-form-item label="数据源" prop="type">
              <el-input v-model="listForm.type" :disabled="true" />
            </el-form-item>
            <el-form-item label="波段数" prop="bands">
              <el-input v-model="listForm.bands" :disabled="true" />
            </el-form-item>
            <el-form-item label="拍摄时间" name="photoTime">
              <el-date-picker v-model="listForm.photoTime" :disabled="true" align="right" type="date" placeholder="日期" />
            </el-form-item>
            <el-form-item label="RGB图片" prop="rgbPath">
              <img v-if="listForm.rgbPath" :src="listForm.rgbPath" style="width:200px;height:200px;display:block">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="resultForm.tp" :model="resultForm" prop="result.tp" label-width="100px">
            <el-form-item label="参数1">
              <el-input v-model="resultForm.tp.para1" placeholder="5" />
            </el-form-item>
            <el-form-item label="参数2">
              <el-input v-model="resultForm.tp.para2" placeholder="5" />
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="retrieval('tp')">总磷反演</el-button>
            </el-form-item>
            <el-form-item style="vertical-align:middle;text-align:center">
              <img v-if="resultForm.tp.rgbPath" :src="resultForm.tp.rgbPath" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="resultForm.tn" :model="resultForm" prop="resultForm.tn" label-width="100px">
            <el-form-item label="参数1">
              <el-input v-model="resultForm.tn.para1" placeholder="5" />
            </el-form-item>
            <el-form-item label="参数2">
              <el-input v-model="resultForm.tn.para2" placeholder="5" />
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="retrieval('tn')">总氮反演</el-button>
            </el-form-item>
            <el-form-item style="vertical-align:middle;text-align:center">
              <img v-if="resultForm.tn.rgbPath" :src="resultForm.tn.rgbPath" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin:20px">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="resultForm.chla" :model="resultForm" prop="resultForm.chla" label-width="100px">
            <el-form-item label="参数1">
              <el-input v-model="resultForm.chla.para1" placeholder="5" />
            </el-form-item>
            <el-form-item label="参数2">
              <el-input v-model="resultForm.chla.para2" placeholder="5" />
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="retrieval('chla')">叶绿素a反演</el-button>
            </el-form-item>
            <el-form-item style="vertical-align:middle;text-align:center">
              <img v-if="resultForm.chla.rgbPath" :src="resultForm.chla.rgbPath" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="resultForm.tss" :model="resultForm" prop="resultForm.tss" label-width="100px">
            <el-form-item label="参数1">
              <el-input v-model="resultForm.tss.para1" placeholder="5" />
            </el-form-item>
            <el-form-item label="参数2">
              <el-input v-model="resultForm.tss.para2" placeholder="5" />
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="retrieval('tss')">总悬浮物反演</el-button>
            </el-form-item>
            <el-form-item style="vertical-align:middle;text-align:center">
              <img v-if="resultForm.tss.rgbPath" :src="resultForm.tss.rgbPath" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="resultForm.nh" :model="resultForm" prop="resultForm.nh" label-width="100px">
            <el-form-item label="参数1">
              <el-input v-model="resultForm.nh.para1" placeholder="5" />
            </el-form-item>
            <el-form-item label="参数2">
              <el-input v-model="resultForm.nh.para2" placeholder="5" />
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="retrieval('nh')">氨氮反演</el-button>
            </el-form-item>
            <el-form-item style="vertical-align:middle;text-align:center">
              <img v-if="resultForm.nh.rgbPath" :src="resultForm.nh.rgbPath" style="width:200px;height:200px;display:block,margin-top:auto;margin-bottom:auto;">
            </el-form-item>
          </el-form>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin:20px">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="form-wrapper">
          <el-form ref="listForm.level" :model="listForm" prop="listForm.level" label-width="100px">
            <el-form-item label="水质评价方法">
              <el-select v-model="levelSelect" placeholder="请选择">
                <el-option
                  v-for="item in evaluteMethodOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  :disabled="item.disabled"
                />
              </el-select>
            </el-form-item>
            <el-form-item size="medium" style="vertical-align:middle;text-align:center">
              <el-button type="primary" round="True" size="medium" @click="displayLevel(levelSelect)">水质评价</el-button>
            </el-form-item>
            <el-form-item label="水质评价结果">
              1
            </el-form-item>
          </el-form>
        </div>
      </el-col>
    </el-row>

    <!-- <el-dialog :visible.sync="dialogPvVisible" title="Reading statistics">
        <el-form :model="listForm" prop='listForm.chla' ref='listForm.chla' label-width="100px">
          <el-form-item label="水质评价结果">
          </el-form-item>
        </el-form>
    </el-dialog> -->
  </div>
</template>

<script>

import { fetchList, createData, updateData, fetchRetrieval, fetchLevel } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'

const TypeOptions = [
  { key: 'MODIS', display_name: 'MODIS' },
  { key: 'GF-1', display_name: '高分一号' },
  { key: 'GF-2', display_name: '高分一号' },
  { key: 'GF-3', display_name: '高分一号' },
  { key: 'LANDSAT-5', display_name: 'LANDSAT-5' },
  { key: 'LANDSAT-8', display_name: 'LANDSAT-8' }
]
const evaluteMethodOptions = [
  { key: '1', label: '单因子', value: 'single', disabled: false },
  { key: '2', label: '多因子', value: 'multi', disabled: false },
  { key: '3', label: 'svr', value: 'svr', disabled: false }
]
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
const levelSelect = 'single'
export default {
  name: 'Monitor',
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
      listForm: { waterId: this.$route.params.id },
      resultForm: { 
        waterId: this.$route.params.id,
        tp:undefined,
        tn:undefined,
        tss:undefined,
        nh:undefined,
        chla:undefined,
      },
      retrievalParams: {
        retrievalParams: 'tp',
        para1: 0,
        para2: 0,
        para3: 0
      },
      total: 0,
      listLoading: true,
      listQuery: {
        waterId: this.$route.params.id | 1000,
      },
      resultQuery: {
        waterId: this.$route.params.id | 1000,
        retrievalParams: 'tp'
      },
      importanceOptions: [1, 2, 3],
      TypeOptions,
      provinceOptions,
      evaluteMethodOptions,
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
      downloadLoading: false,
      multipleSelection: [],
      levelSelect
    }
  },
  created() {
    this.getList()
    this.getResult('tp')
    this.getResult('tn')
    this.getResult('tss')
    this.getResult('nh')
    this.getResult('chla')
    console.log(this.result.tp)
    // console.log(this.list)
    // console.log(this.listForm)
  },
  methods: {
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    getList() {
      this.listLoading = true
      fetchList(this.listQuery).then(response => {
        this.listForm = response.rows[0];
        this.total = response.total;
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    getResult(r) {
      this.listLoading = true;
      this.resultQuery.waterId = this.$route.params.id | 1000;
      this.resultQuery.retrievalParams = r;
      fetchResult(this.resultQuery).then(response => {
        switch (r){
          case 'tp':
            this.resultForm.tp = response.rows[0];
            break;
          case 'tn':
            this.resultForm.tn = response.rows[0];
            break;
          case 'tss':
            this.resultForm.tss = response.rows[0];
            break;
          case 'nh':
            this.resultForm.nh = response.rows[0];
            break;          
          case 'chla':
            this.resultForm.chla = response.rows[0];
            break;
          case 'cod':
            this.resultForm.cod = response.rows[0];
            break;
          default:
            alert('获取反演结果失败！')
            break;
        }

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    retrieval(param) {
      this.retrievalParams.retrievalParams = param
      switch (param){
        case 'tp':
            this.retrievalParams.para1 = this.resultForm.tp.para1;
            this.retrievalParams.para2 = this.resultForm.tp.para2;
            break;
          case 'tn':
            this.retrievalParams.para1 = this.resultForm.tn.para1;
            this.retrievalParams.para2 = this.resultForm.tn.para2;
            break;
          case 'tss':
            this.retrievalParams.para1 = this.resultForm.tss.para1;
            this.retrievalParams.para2 = this.resultForm.tss.para2;
            break;
          case 'nh':
            this.retrievalParams.para1 = this.resultForm.nh.para1;
            this.retrievalParams.para2 = this.resultForm.nh.para2;
            break;          
          case 'chla':
            this.retrievalParams.para1 = this.resultForm.chla.para1;
            this.retrievalParams.para2 = this.resultForm.chla.para2;
            break;
          case 'cod':
            this.retrievalParams.para1 = this.resultForm.chla.para1;
            this.retrievalParams.para2 = this.resultForm.chla.para2;
            break;
          default:
            alert('反演失败！')
            break;
      }

      fetchRetrieval(this.retrievalParams).then(response => {
        switch (param){
          case 'tp':
            this.resultForm.tp = response.rows[0];
            break;
          case 'tn':
            this.resultForm.tn = response.rows[0];
            break;
          case 'tss':
            this.resultForm.tss = response.rows[0];
            break;
          case 'nh':
            this.resultForm.nh = response.rows[0];
            break;          
          case 'chla':
            this.resultForm.chla = response.rows[0];
            break;
          case 'cod':
            this.resultForm.cod = response.rows[0];
            break;
          default:
            alert('反演失败！')
            break;
        }

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
    })},
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
    resetTemp() {
      this.temp = {
        waterId: undefined,
        photoTime: new Date(),
        waterName: '',
        type: '',
        province: '浙江省',
        rgbPath: ''
      }
    },
    handleView(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'view'
      this.dialogFormVisible = true
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
          createData(this.temp).then(() => {
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
          updateData(tempData).then(() => {
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
    },
    displayLevel: function(key) {
      console.log(key)
      fetchLevel(key)
    }
  }
}
</script>

<style>
  .monitor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;

    .github-corner {
      position: absolute;
      top: 0px;
      border: 0;
      right: 0;
    }

    .form-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 32px;

    }

  }

  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
  }
</style>
