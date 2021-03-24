<template>
  <div class="monitor-container">
    <el-row :gutter="6" style="margin:2px">
      <el-col :xs="24" :sm="24" :md="12" :lg="12" >
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <h3>水体信息</h3>              
          </div>
          <div class="form-wrapper">
            <el-form :inline=true ref="waterId" prop="listForm" label-width="100px" @submit.native.prevent onSubmit="return false">
              <el-form-item label="水体ID" prop="waterId">
                <el-input v-model="listQuery.waterId"  @keyup.enter.native="changeWater"/>
              </el-form-item>
              <el-form-item style="float: right;">  
                <el-button type="primary" style="float: right;" @click="changeWater">重新选择水体</el-button>
              </el-form-item>
            </el-form> 
            <el-divider></el-divider>    
            <el-form ref="listForm" :model="listForm" prop="listForm" label-width="100px">
              <el-form-item label="水体" prop="waterName" >
                <span>{{listForm.waterName}}</span>
              </el-form-item>
              <el-form-item label="数据源" prop="type">
                <span>{{listForm.type}}</span>
              </el-form-item>
              <el-form-item label="数据类型" prop="dataType">
                <span>{{listForm.dataType}}</span>
              </el-form-item>
              <el-form-item label="数据生成时间" name="photoTime">
                <span>{{parseTime(listForm.photoTime)}}</span>
              </el-form-item>
              <el-form-item label="省份" prop="province">
                <span>{{listForm.province}}</span>
              </el-form-item>
              <el-form-item label="城市" prop="city">
                <span>{{listForm.city}}</span>              
              </el-form-item>
              <el-form-item label="区县">
                <span>{{listForm.county}}</span>
              </el-form-item>
              <el-form-item label="详细位置">
                <span>{{listForm.location}}</span>
              </el-form-item>
              <el-form-item label="主管部门">
                <span>{{listForm.department}}</span>
              </el-form-item>
              <el-form-item label="联系人">
                <span>{{listForm.contact}}</span>
              </el-form-item>
              <el-form-item label="联系方式">
                <span>{{listForm.contactInformation}}</span>
              </el-form-item>
              <!-- <el-form-item label="波段数" prop="bands">
                <span>{{listForm.bands}}</span>
                <!-- <el-input v-model="listForm.bands" :disabled="true" /> -->
              <!-- </el-form-item>       -->
              <el-form-item label="RGB图片" prop="rgbPath" v-if="listForm.dataType == '影像数据'">
                <el-image v-if="listForm.rgbPath" :src="listForm.rgbPath" :alt="listForm.rgbPath"
                  style="width:380px;height:80px;display:block" :preview-src-list="listForm.previewSrcList">
                </el-image>
              </el-form-item>
            </el-form>
          </div> 
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-row :gutter="12" style="margin:10px">
          <el-card class="box-card" v-if="listForm.dataType == '影像数据'">
            <div slot="header" class="clearfix">
              <h3>水体提取</h3>              
            </div>
            <div class="form-wrapper">
              <el-form ref="waterLandForm" :model="waterLandForm" prop="waterLandForm" label-width="100px">
                <el-form-item label="NDWI阈值">
                  <el-slider v-model="waterLandForm.ndwiParam" show-input :step="0.01"
                    :min="-20" :max="20"></el-slider>
                </el-form-item>
                <el-form-item label="闭运算核大小">
                  <el-slider v-model="waterLandForm.closeParam" show-input
                    :max="20"></el-slider>
                </el-form-item>
                <el-form-item label="开运算核大小">
                  <el-slider v-model="waterLandForm.openParam" show-input
                    :max="20"></el-slider>
                </el-form-item>
                <el-form-item style="vertical-align:middle;text-align:center" label=''>
                  <el-button type="primary" round size="medium" @click="waterLandSegment()">水体提取</el-button>
                </el-form-item>
                <el-form-item v-if="waterLandForm.waterLandPath!=''" 
                  style="vertical-align:middle;text-align:center" label='提取结果'>
                  <el-image :src="waterLandForm.waterLandPath" v-if="waterLandForm.waterLandPath" :alt="waterLandForm.waterLandPath"
                  :preview-src-list="waterLandForm.previewSrcList" style="width:380px;height:80px;display:block">
                  </el-image>
                </el-form-item>
                <el-form-item v-if="waterLandForm.waterLandPath!=''" style="vertical-align:middle;text-align:center" label=''>
                  <el-button v-if="waterLandForm.waterLandPath!=''"
                   type="primary" round size="medium" @click="saveWaterLandResult()">保存</el-button>
                </el-form-item>
              </el-form>
            </div>
          </el-card>
        </el-row>
        <el-row :gutter="12" style="margin:10px">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <h3>指标反演</h3>              
            </div>
            <el-collapse>
              <el-collapse-item title="总悬浮物" name="0">
                <div class="form-wrapper">
                  <el-form ref="listForm.tss" :model="listForm" prop="listForm.tss" 
                   @submit.native.prevent label-width="100px">
                    <el-form-item style="vertical-align:middle;text-align:center;margin-top:20px" label='反演算法选择'>
                      <el-select v-model="listForm.tssSaveMethod" placeholder="Modified-QAA">
                        <el-option
                          v-for="item in inverseMethodOptions.tss"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                      <el-input v-model="listForm.tssCustomModel" v-if='listForm.tssSaveMethod === "自定义"'
                        placeholder="自定义反演模型" style="vertical-align:middle;text-align:center;margin-top:20px"/>
                    </el-form-item>
                    <el-form-item style="vertical-align:middle;text-align:center" label=''>
                      <el-button type="primary" round size="medium" @click="waterQualityInverse('tss')">总悬浮物反演</el-button>
                    </el-form-item>
                    <el-form-item 
                      style="vertical-align:middle;text-align:center" label='反演结果' v-if="listForm.tssResultPath">
                      <el-image :src="listForm.tssResultPath" :alt="listForm.tssResultPath" v-if="listForm.tssResultPath"
                        :preview-src-list="listForm.tssPreviewSrcList" style="width:380px;height:80px;display:block,margin-top:auto;margin-bottom:auto;">
                      </el-image>
                    </el-form-item>
                    <el-form-item  v-if="listForm.tssMin || listForm.tssMax || listForm.tssMean"
                      style="vertical-align:middle;text-align:center" label='反演统计量'>
                      最小值：{{listForm.tssMin}}，平均值：{{listForm.tssMean}}，最大值：{{listForm.tssMax}}
                    </el-form-item>
                    <el-form-item v-if="tssResultPath" style="vertical-align:middle;text-align:center" label=''>
                      <el-button v-if="tssResultPath"
                      type="primary" round size="medium" @click="saveWaterQuality('tss')">保存</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>
              <el-collapse-item title="叶绿素" name="1">
                <div class="form-wrapper">
                  <el-form ref="listForm.chla" :model="listForm" prop="listForm.chla" 
                   @submit.native.prevent label-width="100px">
                    <el-form-item style="vertical-align:middle;text-align:center;margin-top:20px" label='反演算法选择'>
                      <el-select v-model="listForm.chlaSaveMethod" placeholder="PNN-L1-NN">
                        <el-option
                          v-for="item in inverseMethodOptions.chla"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                      <el-input v-model="listForm.chlaCustomModel" v-if='listForm.chlaSaveMethod === "自定义"'
                        placeholder="自定义反演模型" style="vertical-align:middle;text-align:center;margin-top:20px"/>
                    </el-form-item>
                    <el-form-item style="vertical-align:middle;text-align:center" label=''>
                      <el-button type="primary" round size="medium" @click="waterQualityInverse('chla')">总悬浮物反演</el-button>
                    </el-form-item>
                    <el-form-item 
                      style="vertical-align:middle;text-align:center" label='反演结果' v-if="listForm.chlaResultPath">
                      <el-image :src="listForm.chlaResultPath" :alt="listForm.chlaResultPath" v-if="listForm.chlaResultPath"
                        :preview-src-list="listForm.chlaPreviewSrcList" style="width:380px;height:80px;display:block,margin-top:auto;margin-bottom:auto;">
                      </el-image>
                    </el-form-item>
                    <el-form-item  v-if="listForm.chlaMin || listForm.chlaMax || listForm.chlaMean"
                      style="vertical-align:middle;text-align:center" label='反演统计量'>
                      最小值：{{listForm.chlaMin}}，平均值：{{listForm.chlaMean}}，最大值：{{listForm.chlaMax}}
                    </el-form-item>
                    <el-form-item v-if="chlaResultPath" style="vertical-align:middle;text-align:center" label=''>
                      <el-button v-if="chlaResultPath"
                      type="primary" round size="medium" @click="saveWaterQuality('chla')">保存</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>

              <el-collapse-item title="氨氮" name="2">
                <div class="form-wrapper">
                  <el-form ref="listForm.nh" :model="listForm" prop="listForm.nh" 
                   @submit.native.prevent label-width="100px">
                    <el-form-item style="vertical-align:middle;text-align:center;margin-top:20px" label='反演算法选择'>
                      <el-select v-model="listForm.nhSaveMethod" placeholder="多元回归模型">
                        <el-option
                          v-for="item in inverseMethodOptions.nh"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                      <el-input v-model="listForm.nhCustomModel" v-if='listForm.nhSaveMethod === "自定义"'
                        placeholder="自定义反演模型" style="vertical-align:middle;text-align:center;margin-top:20px"/>
                    </el-form-item>
                    <el-form-item style="vertical-align:middle;text-align:center" label=''>
                      <el-button type="primary" round size="medium" @click="waterQualityInverse('nh')">总悬浮物反演</el-button>
                    </el-form-item>
                    <el-form-item 
                      style="vertical-align:middle;text-align:center" label='反演结果' v-if="listForm.nhResultPath">
                      <el-image :src="listForm.nhResultPath" :alt="listForm.nhResultPath" v-if="listForm.nhResultPath"
                        :preview-src-list="listForm.nhPreviewSrcList" style="width:380px;height:80px;display:block,margin-top:auto;margin-bottom:auto;">
                      </el-image>
                    </el-form-item>
                    <el-form-item  v-if="listForm.nhMin || listForm.nhMax || listForm.nhMean"
                      style="vertical-align:middle;text-align:center" label='反演统计量'>
                      最小值：{{listForm.nhMin}}，平均值：{{listForm.nhMean}}，最大值：{{listForm.nhMax}}
                    </el-form-item>
                    <el-form-item v-if="nhResultPath" style="vertical-align:middle;text-align:center" label=''>
                      <el-button v-if="nhResultPath"
                      type="primary" round size="medium" @click="saveWaterQuality('nh')">保存</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>

              <el-collapse-item title="总磷" name="3">
                <div class="form-wrapper">
                  <el-form ref="listForm.tp" :model="listForm" prop="listForm.tp" 
                   @submit.native.prevent label-width="100px">
                    <el-form-item style="vertical-align:middle;text-align:center;margin-top:20px" label='反演算法选择'>
                      <el-select v-model="listForm.tpSaveMethod" placeholder="一阶微分模型">
                        <el-option
                          v-for="item in inverseMethodOptions.tp"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                      <el-input v-model="listForm.tpCustomModel" v-if='listForm.tpSaveMethod === "自定义"'
                        placeholder="自定义反演模型" style="vertical-align:middle;text-align:center;margin-top:20px"/>
                    </el-form-item>
                    <el-form-item style="vertical-align:middle;text-align:center" label=''>
                      <el-button type="primary" round size="medium" @click="waterQualityInverse('tp')">总悬浮物反演</el-button>
                    </el-form-item>
                    <el-form-item 
                      style="vertical-align:middle;text-align:center" label='反演结果' v-if="listForm.tpResultPath">
                      <el-image :src="listForm.tpResultPath" :alt="listForm.tpResultPath" v-if="listForm.tpResultPath"
                        :preview-src-list="listForm.tpPreviewSrcList" style="width:380px;height:80px;display:block,margin-top:auto;margin-bottom:auto;">
                      </el-image>
                    </el-form-item>
                    <el-form-item  v-if="listForm.tpMin || listForm.tpMax || listForm.tpMean"
                      style="vertical-align:middle;text-align:center" label='反演统计量'>
                      最小值：{{listForm.tpMin}}，平均值：{{listForm.tpMean}}，最大值：{{listForm.tpMax}}
                    </el-form-item>
                    <el-form-item v-if="tpResultPath" style="vertical-align:middle;text-align:center" label=''>
                      <el-button v-if="tpResultPath"
                      type="primary" round size="medium" @click="saveWaterQuality('tp')">保存</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>

              <el-collapse-item title="总氮" name="4">
                <div class="form-wrapper">
                  <el-form ref="listForm.tn" :model="listForm" prop="listForm.tn" 
                   @submit.native.prevent label-width="100px">
                    <el-form-item style="vertical-align:middle;text-align:center;margin-top:20px" label='反演算法选择'>
                      <el-select v-model="listForm.tnSaveMethod" placeholder="比值模型">
                        <el-option
                          v-for="item in inverseMethodOptions.tn"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                      <el-input v-model="listForm.tnCustomModel" v-if='listForm.tnSaveMethod === "自定义"'
                        placeholder="自定义反演模型" style="vertical-align:middle;text-align:center;margin-top:20px"/>
                    </el-form-item>
                    <el-form-item style="vertical-align:middle;text-align:center" label=''>
                      <el-button type="primary" round size="medium" @click="waterQualityInverse('tn')">总悬浮物反演</el-button>
                    </el-form-item>
                    <el-form-item 
                      style="vertical-align:middle;text-align:center" label='反演结果' v-if="listForm.tnResultPath">
                      <el-image :src="listForm.tnResultPath" :alt="listForm.tnResultPath" v-if="listForm.tnResultPath"
                        :preview-src-list="listForm.tnPreviewSrcList" style="width:380px;height:80px;display:block,margin-top:auto;margin-bottom:auto;">
                      </el-image>
                    </el-form-item>
                    <el-form-item  v-if="listForm.tnMin || listForm.tnMax || listForm.tnMean"
                      style="vertical-align:middle;text-align:center" label='反演统计量'>
                      最小值：{{listForm.tnMin}}，平均值：{{listForm.tnMean}}，最大值：{{listForm.tnMax}}
                    </el-form-item>
                    <el-form-item v-if="tnResultPath" style="vertical-align:middle;text-align:center" label=''>
                      <el-button v-if="tnResultPath"
                      type="primary" round size="medium" @click="saveWaterQuality('tn')">保存</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>
              <el-collapse-item title="水质评价" name="6">
                <div class="form-wrapper">
                  <el-form ref="listForm.level" :model="listForm" prop="listForm.level" label-width="100px">
                    <!-- <el-form-item label="水质评价方法">
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
                    <el-form-item style="vertical-align:middle;text-align:center" label='反演结果'>
                      <el-button type="primary" round size="medium" @click="displayLevel(levelSelect)">水质评价</el-button>
                    </el-form-item> -->
                    <el-form-item label="水质评价结果">
                      1
                    </el-form-item>
                  </el-form>
                </div>
              </el-collapse-item>
            </el-collapse>
          </el-card>
        </el-row>
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
import { fetchList, fetchWaterQuality, inverseWaterQuality,
         fetchLevel, fetchWaterLand, segmentWaterLand } from '@/api/data'
import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'

const inverseMethodOptions = {'tss': [{label: 'Modified-QAA', value: 'Modified-QAA'},
                                      {label: 'PNN-L1-NN',    value: 'PNN-L1-NN'},
                                      {label: 'PNN-L2-NN',    value: 'PNN-L2-NN'},
                                      {label: "自定义",        value: "自定义"}],
                              'chla': [{label: 'PNN-L1-NN',   value: 'PNN-L1-NN'},
                                      {label: 'PNN-L2-NN',    value: 'PNN-L2-NN'},
                                      {label: "自定义",        value: "自定义"}],
                              'nh':   [{label: '多元回归模型', value: 'multiple-regression'},
                                      {label: "自定义",        value: "自定义"}],
                              'tp':   [{label: '一阶微分模型', value: '一阶微分模型'},
                                      {label: "自定义",        value: "自定义"}],
                              'tn':   [{label: '比值模型',     value: '比值模型'},
                                      {label: "自定义",        value: "自定义"}],
                              }
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
    }
  },
  data() {
    return {
      tableKey: 0,
      list: null,
      listForm: { waterId: 1000 },
      waterLandForm: {waterId: undefined, ndwiParam: undefined, closeParam: undefined,
                      openParam: undefined, waterLandPath: undefined, previewSrcList: undefined },
      retrievalParamms: {
        waterId: undefined,
        retrievalParamms: 'tp',
        para1: 0,
        para2: 0,
        para3: 0
      },
      total: 0,
      listLoading: true,
      listQuery: {
        waterId: this.$route.params.id,
      },
      inverseQuery: {
        waterId: this.$route.params.id,
        retrievalParamms: 'tp'
      },
      importanceOptions: [1, 2, 3],
      provinceOptions,
      evaluteMethodOptions,
      inverseMethodOptions,
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      showReviewer: false,
      temp: {
        waterId: undefined,
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
      levelSelect, 
      wrongIdFlag: 0,
    }
  },
  created() {
    if(this.$route.params.id==':id'){
      this.listQuery.waterId=1000
      this.inverseQuery.waterId=1000
    }
    this.getData()
  },
  methods: {
    formatListForm() {
      const dataTypeMap = {0:'影像数据', 1:'列表数据'}
      if (this.listForm ) {
        this.listForm.dataType = dataTypeMap[this.listForm.dataType]
        if(this.listForm.dataType == "影像数据") {
          this.listForm.rgbPath = process.env.VUE_APP_BASE_API + "/profile/" +this.listForm.rgbPath
          this.listForm.previewSrcList = [this.listForm.rgbPath, ]
          if(this.listForm.tssResultPath) {
            this.listForm.tssResultPath = process.env.VUE_APP_BASE_API + "/profile/" + this.listForm.tssResultPath
            this.listForm.tssPreviewSrcList = [this.listForm.tssResultPath]
          }
          if(this.listForm.chlaResultPath) {
            this.listForm.chlaResultPath = process.env.VUE_APP_BASE_API + "/profile/" + this.listForm.chlaResultPath
            this.listForm.chlaPreviewSrcList = [this.listForm.chlaResultPath]
          }
          if(this.listForm.nhResultPath) {
            this.listForm.nhResultPath = process.env.VUE_APP_BASE_API + "/profile/" + this.listForm.nhResultPath
            this.listForm.nhPreviewSrcList = [this.listForm.nhResultPath]
          }
          if(this.listForm.tpResultPath) {
            this.listForm.tpResultPath = process.env.VUE_APP_BASE_API + "/profile/" + this.listForm.tpResultPath
            this.listForm.tpPreviewSrcList = [this.listForm.tpResultPath]
          }
          if(this.listForm.tnResultPath) {
            this.listForm.tnResultPath = process.env.VUE_APP_BASE_API + "/profile/" + this.listForm.tnResultPath
            this.listForm.tnPreviewSrcList = [this.listForm.tnResultPath]
          }
        }
      }
    },
    getWaterQuality() {
      this.listLoading = true
      fetchWaterQuality(this.listQuery).then(response => {
        if(response.total==0)
        {
          this.listQuery.waterId = this.listForm.waterId || 1000;
          this.wrongIdFlag = 1
          this.msgSuccess("数据库中不存在此水体");
        }
        else{
          this.listForm = response.rows[0];
          this.formatListForm()
          this.total = response.total;
          this.listLoading = false
        }
      })
    },
    getWaterLand() {
      this.listLoading = true
      fetchWaterLand(this.listQuery).then(response => {
        if(response.total==0)
        {
          this.listQuery.waterId = this.listForm.waterId || 1000;
          this.msgError("数据库中不存在此水体");
        }
        else{
          this.waterLandForm = response.rows[0];
          this.waterLandForm.waterLandPath = process.env.VUE_APP_BASE_API + "/profile/" + this.waterLandForm.waterLandPath
          this.waterLandForm.previewSrcList = [this.waterLandForm.waterLandPath]
          // Just to simulate the time of the request
          this.listLoading = false
        }
      })
    },
    getData() {
      this.listLoading = true
      fetchWaterQuality(this.listQuery).then(response => {
        if(response.total==0)
        {
          this.listQuery.waterId = this.listForm.waterId || 1000;
          this.wrongIdFlag = 1
          this.msgSuccess("数据库中不存在此水体");
        }
        else{
          this.listForm = response.rows[0];
          this.formatListForm()
          if (this.listForm.dataType == "影像数据") {
            this.getWaterLand()
          } else {
            this.wrongIdFlag = 0
          }
        }
      })
    },
    changeWater() {
      this.getData()
    },
    waterLandSegment() {
      let upFormData = new FormData();
      this.tempWaterLandForm = Object.assign({}, this.waterLandForm) // copy obj
      if (this.tempWaterLandForm.waterLandPath.indexOf("profile/") > 0) {
        this.tempWaterLandForm.waterLandPath = this.waterLandForm.waterLandPath.split("profile/")[1]
      }
      upFormData.append('body', JSON.stringify(this.tempWaterLandForm))
      upFormData.append('filePath', this.listForm.filePath)
      upFormData.append('bandWavelengthPath', this.listForm.bandWavelengthFilePath)
      upFormData.append('save', "false")
      segmentWaterLand(upFormData).then(response => {
        if(response.code === 200 && response.imgUrl != undefined && response.imgUrl != null && response.imgUrl != "")
        {
          this.waterLandForm.waterLandPath = process.env.VUE_APP_BASE_API + "/profile/" + response.imgUrl;
          this.waterLandForm.previewSrcList = [this.waterLandForm.waterLandPath]
          this.msgSuccess("水体提取成功");
          console.log(response.imgUrl)
        } else {
          this.msgError(response.msg);
        }
      })
    },
    saveWaterLandResult() {
      let upFormData = new FormData();
      this.tempWaterLandForm = Object.assign({}, this.waterLandForm) // copy obj
      if (this.tempWaterLandForm.waterLandPath.indexOf("profile/") > 0) {
        this.tempWaterLandForm.waterLandPath = this.waterLandForm.waterLandPath.split("profile/")[1]
      }
      upFormData.append('body', JSON.stringify(this.tempWaterLandForm))
      upFormData.append('filePath', this.listForm.filePath)
      upFormData.append('bandWavelengthPath', this.listForm.bandWavelengthFilePath)
      upFormData.append('save', "true")
      segmentWaterLand(upFormData).then(response => {
        if(response.code === 200 && response.imgUrl != undefined && response.imgUrl != null && response.imgUrl != "")
        {
          this.waterLandForm.waterLandPath = process.env.VUE_APP_BASE_API + "/profile/" + response.imgUrl;
          this.waterLandForm.previewSrcList = [this.waterLandForm.waterLandPath]
          this.msgSuccess("水体保存成功");
        } else {
          this.msgError(response.msg);
        }
      })
    },
    waterQualityInverse() {},
    saveWaterQuality() {},
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