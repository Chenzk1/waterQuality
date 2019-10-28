<template>
  <div class="app-container">
    <el-card style="margin-bottom:20px;">
      <div slot="header" class="clearfix">
        <span>数据统计</span>
      </div>

      <div class="user-profile">
        <div class="box-center">
          <pan-thumb :image="user.avatar" :height="'100px'" :width="'100px'" :hoverable="false">
            <div>你好</div>
            {{ user.role }}
          </pan-thumb>
        </div>
        <div class="box-center">
          <div class="user-name text-center">{{ user.name }}</div>
          <div class="user-role text-center text-muted">{{ user.role }}</div>
        </div>
      </div>

      <div class="user-bio">
        <!-- <div class="user-education user-bio-section">
          <div class="user-bio-section-header"><svg-icon icon-class="education" /><span>Education</span></div>
          <div class="user-bio-section-body">
            <div class="text-muted">
              JS in Computer Science from the University of Technology
            </div>
          </div>
        </div> -->

        <div class="user-skills user-bio-section">
          <div class="user-bio-section-header"><svg-icon icon-class="skill" /><span>详细信息</span></div>
          <div class="user-bio-section-body">
            <div class="progress-item">
              <span>水体数量:{{ nameNunique }}</span>
            </div>
            <div class="progress-item">
              <span>图片数量:{{ pictureNunique }}</span>
            </div>
            <div class="progress-item">
              <span>时间范围：{{ startDate | parseTime('{y}-{m}-{d}') }} ~ {{ endDate | parseTime('{y}-{m}-{d}') }}</span>
            </div>
            <div class="progress-item">
              <span>数据源：{{ typeUnique }}</span>
            </div>
            <div class="progress-item">
              <span>可反演指标：总磷（TP）、总氮（TN）、叶绿素a（Chl-a）、氨氮（NH）、总悬浮物（TSS）</span>
            </div>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import PanThumb from '@/components/PanThumb'
import { fetchUnique } from '@/api/data'
import { mapGetters } from 'vuex'

export default {
  name: 'Statistics',
  components: { PanThumb },
  data() {
    return {
      user: {},
      uniqueQuery: {
        province: undefined,
        name: undefined,
        type: undefined,
        id: undefined,
        city: undefined
      },
      pictureNunique: 0,
      nameNunique: 0,
      typeUnique: 0,
      provinceNunique: 0,
      startDate: undefined,
      endDate: undefined
    }
  },
  computed: {
    ...mapGetters([
      'name',
      'avatar',
      'roles'
    ])
  },
  created() {
    this.getUser()
    this.getUnique()
  },
  methods: {
    getUser() {
      this.user = {
        name: this.name,
        role: this.roles.join(' | '),
        email: 'admin@test.com',
        avatar: this.avatar
      }
    },
    getUnique() {
      this.listLoading = true
      fetchUnique(this.uniqueQuery).then(response => {
        this.pictureNunique = response.data.pictureNunique
        this.nameNunique = response.data.nameNunique
        this.typeUnique = response.data.typeUnique
        this.provinceNunique = response.data.provinceNunique

        this.startDate = response.data.startDate
        this.endDate = response.data.endDate
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
 .box-center {
   margin: 0 auto;
   display: table;
 }

 .text-muted {
   color: #777;
 }

 .user-profile {
   .user-name {
     font-weight: bold;
   }

   .box-center {
     padding-top: 10px;
   }

   .user-role {
     padding-top: 10px;
     font-weight: 400;
     font-size: 14px;
   }

   .box-social {
     padding-top: 30px;

     .el-table {
       border-top: 1px solid #dfe6ec;
     }
   }

   .user-follow {
     padding-top: 20px;
   }
 }

 .user-bio {
   margin-top: 20px;
   color: #606266;

   span {
     padding-left: 4px;
   }

   .user-bio-section {
     font-size: 14px;
     padding: 15px 0;

     .user-bio-section-header {
       border-bottom: 1px solid #dfe6ec;
       padding-bottom: 10px;
       margin-bottom: 10px;
       font-weight: bold;
     }
   }
 }
</style>
