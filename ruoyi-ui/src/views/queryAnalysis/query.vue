<template>
  <div class="app-container">
    <!-- <panel-group @handleSetLineChartData="handleSetLineChartData" /> -->
    <div class="filter-container">
      <el-input v-model="listQuery.waterName" placeholder="水体搜索" style="width: 150px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.waterName" placeholder="水体选择" clearable style="width: 150px" class="filter-item">
        <el-option v-for="item in nameOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.province" placeholder="省份" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in provinceOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.city" placeholder="城市" clearable style="width: 90px" class="filter-item">
        <el-option v-for="item in cityOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-select v-model="listQuery.type" placeholder="数据源" clearable class="filter-item" style="width: 90px">
        <el-option v-for="item in typeOptions" :key="item" :label="item" :value="item" />
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
        style="width: 350px"
      />
      <!-- <el-date-picker type="date" placeholder="选择日期" v-model="listQuery.startDate" style="width: 100%;"></el-date-picker>
      <el-col class="line" :span="2">-</el-col>
      <el-time-picker placeholder="选择日期" v-model="listQuery.endDate" style="width: 100%;"></el-time-picker> -->
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        检索
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
    >
      <el-table-column label="ID" prop="id" fixed align="center" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.waterId }}</span>
        </template>
      </el-table-column>
      <el-table-column label="日期" width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.photoTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="水体" min-width="50px">
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
      <el-table-column label="水质要求" class-name="status-col" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.waterQualityStandard }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="RGB图片" class-name="status-col" width="110">
        <template slot-scope="scope">
          <el-popover
            placement="left"
            title=""
            trigger="click">
            <el-image
            slot="reference" 
            style="width: 100px; height: 100px"
            :src="scope.row.rgbPath"
            :fit="fit"
            ></el-image>
            <el-image :src="scope.row.rgbPath"></el-image>
          </el-popover>
        </template>
      </el-table-column> -->
      <el-table-column label="反演结果" class-name="status-col" width="250">
        <template slot-scope="scope">
          <el-popover
            placement="right"
            width="250"
            trigger="click"
            >
            <el-button slot="reference" type="primary" size="small" round>总悬浮物</el-button>
            <el-form label-position="left" width="250"  inline v-if="scope.row.tssSaveMethod != null">
              <el-form-item label="结果" width="20">
                <el-image
                  style="object-fit: contain"
                  :src="scope.row.tssResultPath"
                  v-if="isAssetTypeAnImage(scope.row.tssResultPath.substr(scope.row.tssResultPath.lastIndexOf('.')+1))"></el-image>
              </el-form-item>
              <el-form-item label="统计量" width="20">
                <span>最小值：{{ scope.row.tssMin }}</span>
                <span>最大值：{{ scope.row.tssMax }}</span>
                <span>平均值：{{ scope.row.tssMax }}</span>
              </el-form-item>
              <el-form-item>
                <el-button type="text" size="middle" icon="el-icon-view" @click="handleView(scope.row)">
                  详细结果
                </el-button>
              </el-form-item>
            </el-form>
            <h3 v-if="scope.row.tssSaveMethod === null"> 该指标还未进行反演 </h3>
          </el-popover>
          <el-popover
            placement="right"
            width="250"
            trigger="click"
            >
            <el-button slot="reference" type="primary" size="small" round>叶绿素</el-button>
            <el-form label-position="left" width="250"  inline v-if="scope.row.chlaSaveMethod != null">
              <el-form-item label="结果" width="20">
                <el-image
                  style="object-fit: contain"
                  :src="scope.row.chlaResultPath"
                  v-if="isAssetTypeAnImage(scope.row.chlaResultPath.substr(scope.row.chlaResultPath.lastIndexOf('.')+1))"></el-image>
              </el-form-item>
              <el-form-item label="统计量" width="20">
                <span>最小值：{{ scope.row.chlaMin }}</span>
                <span>最大值：{{ scope.row.chlaMax }}</span>
                <span>平均值：{{ scope.row.chlaMax }}</span>
              </el-form-item>
              <el-form-item>
                <el-button type="text" size="middle" icon="el-icon-view" @click="handleView(scope.row)">
                  详细结果
                </el-button>
              </el-form-item>
            </el-form>
            <h3 v-if="scope.row.chlaSaveMethod === null"> 该指标还未进行反演 </h3>
          </el-popover>
          <el-popover
            placement="right"
            width="250"
            trigger="click"
            >
            <el-button slot="reference" type="primary" size="small" round>总氮</el-button>
            <el-form label-position="left" width="250"  inline v-if="scope.row.tnSaveMethod != null">
              <el-form-item label="结果" width="20">
                <el-image
                  style="object-fit: contain"
                  :src="scope.row.tnResultPath"
                  v-if="isAssetTypeAnImage(scope.row.tnResultPath.substr(scope.row.tnResultPath.lastIndexOf('.')+1))"></el-image>
              </el-form-item>
              <el-form-item label="统计量" width="20">
                <span>最小值：{{ scope.row.tnMin }}</span>
                <span>最大值：{{ scope.row.tnMax }}</span>
                <span>平均值：{{ scope.row.tnMax }}</span>
              </el-form-item>
              <el-form-item>
                <el-button type="text" size="middle" icon="el-icon-view" @click="handleView(scope.row)">
                  详细结果
                </el-button>
              </el-form-item>
            </el-form>
            <h3 v-if="scope.row.tnSaveMethod === null"> 该指标还未进行反演 </h3>
          </el-popover>

          <el-popover
            placement="right"
            width="250"
            trigger="click"
            >
            <el-button slot="reference" type="primary" size="small" round>总磷</el-button>
            <el-form label-position="left" width="250"  inline v-if="scope.row.tpSaveMethod != null">
              <el-form-item label="结果" width="20">
                <el-image
                  style="object-fit: contain"
                  :src="scope.row.tpResultPath"
                  v-if="isAssetTypeAnImage(scope.row.tpResultPath.substr(scope.row.tpResultPath.lastIndexOf('.')+1))"></el-image>
              </el-form-item>
              <el-form-item label="统计量" width="20">
                <span>最小值：{{ scope.row.tpMin }}</span>
                <span>最大值：{{ scope.row.tpMax }}</span>
                <span>平均值：{{ scope.row.tpMax }}</span>
              </el-form-item>
              <el-form-item>
                <el-button type="text" size="middle" icon="el-icon-view" @click="handleView(scope.row)">
                  详细结果
                </el-button>
              </el-form-item>
            </el-form>
            <h3 v-if="scope.row.tpSaveMethod === null"> 该指标还未进行反演 </h3>
          </el-popover>

          <el-popover
            placement="right"
            width="250"
            trigger="click"
            >
            <el-button slot="reference" type="primary" size="small" round>氨氮</el-button>
            <el-form label-position="left" width="250"  inline v-if="scope.row.nhSaveMethod != null">
              <el-form-item label="结果" width="20">
                <el-image
                  style="object-fit: contain"
                  :src="scope.row.nhResultPath"
                  v-if="isAssetTypeAnImage(scope.row.nhResultPath.substr(scope.row.nhResultPath.lastIndexOf('.')+1))"></el-image>
              </el-form-item>
              <el-form-item label="统计量" width="20">
                <span>最小值：{{ scope.row.nhMin }}</span>
                <span>最大值：{{ scope.row.nhMax }}</span>
                <span>平均值：{{ scope.row.nhMax }}</span>
              </el-form-item>
              <el-form-item>
                <el-button type="text" size="middle" icon="el-icon-view" @click="handleView(scope.row)">
                  详细结果
                </el-button>
              </el-form-item>
            </el-form>
            <h3 v-if="scope.row.nhSaveMethod === null"> 该指标还未进行反演 </h3>
          </el-popover>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit"
     @pagination="getResultList" />
  </div>
</template>

<script>
import { fetchWaterQuality, fetchLevel } from '@/api/data'

import waves from '@/directive/waves' // waves directive
import { parseTime, isAssetTypeAnImage } from '@/utils'
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import PanelGroup from './PanelGroup'

const nameOptions = []
const provinceOptions = [
  '北京市', '广东省', '山东省', '江苏省', '河南省', '上海市', '河北省', '浙江省', '香港特别行政区', '陕西省', '湖南省', '重庆市',
  '福建省', '天津市', '云南省', '四川省', '广西壮族自治区', '安徽省', '海南省', '江西省', '湖北省', '山西省', '辽宁省', '台湾省',
  '黑龙江', '内蒙古自治区', '澳门特别行政区', '贵州省', '甘肃省', '青海省', '新疆维吾尔自治区', '西藏自治区', '吉林省', '宁夏回族自治区'
]
const cityOptions = []
const dataTypeOptions = [{'label':'影像数据', 'value':0}, 
                         {'label':'列表数据', 'value':1}]
const dataTypeMap = {0:'影像数据', 1:'列表数据'}
// arr to obj, such as { CN : "China", US : "USA" }
// const calendarTypeKeyValue = typeOptions.reduce((acc, cur) => {
//   acc[cur.key] = cur.display_name
//   return acc
// }, {})

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
        dataType: undefined,
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
      typeOptions: [],
      cityOptions,
      dataTypeOptions,
      provinceOptions,
      // 检索日期范围
      dateRange: [],
      dataTypeMap,
      provinceNunique: 0,
      nameOptions,
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      downloadLoading: false
    }
  },
  created() {
    this.getResultList();
    // this.getUser();
    this.getUnique("city").then(response => {
      this.cityOptions = response.data;
    });
    this.getUnique("province").then(response => {
      this.provinceOptions = response.data;
    });
    this.getUnique("name").then(response => {
      this.nameOptions = response.data;
    });
    this.getUnique("type").then(response => {
      this.typeOptions = response.data;
    });
    // this.getUnique()
  },
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
      fetchWaterQuality(this.addDateRange(this.listQuery, this.dateRange)).then(response => {
        // this.list = response.rows;
        this.total = response.total;
        this.list = response.rows;
        this.list.forEach(function(element){
          const dataTypeMap = {0:'影像数据', 1:'列表数据'}
          const standardMap = {'无':'无', 'one': 1, 'two': '2', 'three': '3', 'four': '4', 'five': '5'}

          if(element.rgbPath!=null) element.rgbPath=process.env.VUE_APP_BASE_API + '/profile/' + element.rgbPath
          if(element.tpResultPath!=null) element.tpResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.tpResultPath
          if(element.tnResultPath!=null) element.tnResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.tnResultPath
          if(element.tssResultPath!=null) element.tssResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.tssResultPath
          if(element.chlaResultPath!=null) element.chlaResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.chlaResultPath
          if(element.nhResultPath!=null) element.nhResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.nhResultPath
          if(element.codResultPath!=null) element.codResultPath = process.env.VUE_APP_BASE_API + '/profile/' + element.codResultPath
          element.waterQualityStandard = standardMap[element.waterQualityStandard]
          element.dataType = dataTypeMap[element.dataType]
        })

      })
      this.listLoading = false;
    },
    handleFilter() {
      this.listQuery.page = 1;
      this.getResultList();
    },
    handleView(row) {
      this.$router.push({
        path: `/monitorEvaluation/monitor/${row.waterId}`
      })
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
    handleDownload() {
      this.downloadLoading = true
        import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['waterId', 'waterName', 'photoTime', 'province', 'city', 'location', 'type', 'dataType',
                         'tssMin', 'tssMax', 'tssMean', 'chlaMin', 'chlaMax', 'chlaMean', 'tnMin', 'tnMax', 'tnMean', 
                         'codMin', 'codMax', 'codMean', 'nhMin', 'nhMax', 'nhMean', 'tpMin', 'tpMax', 'tpMean', 
                         'department', 'contact', "phonenumber", 'creatyBy', 'creatyTime', 'updateBy', 'updateTime', 'remark']
        const filterVal = tHeader
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
