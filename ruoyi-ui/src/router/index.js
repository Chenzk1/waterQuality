import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/* Router Modules */
// import componentsRouter from './modules/components'
// import chartsRouter from './modules/charts'
// import tableRouter from './modules/table'
// import nestedRouter from './modules/nested'

/**
 * Note: 路由配置项
 *
 * hidden: true                   // 当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1
 * alwaysShow: true               // 当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面
 *                                // 只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面
 *                                // 若你想不管路由下面的 children 声明的个数都显示你的根路由
 *                                // 你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由
 * redirect: noRedirect           // 当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
 * name:'router-name'             // 设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题
 * meta : {
    roles: ['admin','editor']    // 设置该路由进入的权限，支持多个权限叠加
    title: 'title'               // 设置该路由在侧边栏和面包屑中展示的名字
    icon: 'svg-name'             // 设置该路由的图标，对应路径src/icons/svg
    breadcrumb: false            // 如果设置为false，则不会在breadcrumb面包屑中显示
  }
 */

// 公共路由
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path*',
        component: () => import('@/views/redirect')
      }
    ]
  },
  {
    path: '/login',
    component: () => import('@/views/login'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/error/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/error/401'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: 'index',
    children: [    
      {
        path: 'index',
        component: () => import('@/views/queryAnalysis/query'),
        name: '水体检索',
        meta: {
          title: '水体检索',
          icon: 'search',
          affix: true 
        }
      },
    ]
  },
  // {
  //   path: '',
  //   component: Layout,
  //   // redirect: 'index',
  //   children: [
  //     {
  //       path: 'test',
  //       component: () => import('@/views/index'),
  //       name: '首页',
  //       meta: { title: '首页', icon: 'dashboard', noCache: true, affix: true }
  //     }
  //   ]
  // },
  {
    path: '/user',
    component: Layout,
    hidden: true,
    redirect: 'noredirect',
    children: [
      {
        path: 'profile',
        component: () => import('@/views/system/user/profile/index'),
        name: '个人中心',
        meta: { title: '个人中心', icon: 'user' }
      }
    ]
  },
  {
    path: '/dict',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'type/data/:dictId(\\d+)',
        component: () => import('@/views/system/dict/data'),
        name: '字典数据',
        meta: { title: '字典数据', icon: '' }
      }
    ]
  },
  {
    path: '/dataManage',
    component: Layout,
    redirect: '/dataManage/index',
    hidden: false,
    children: [
      {
        path: 'index',
        component: () => import('@/views/dataManage/index'),
        name: 'DataManage',
        meta: { title: '数据管理', icon: 'table', noCache: true }
      }
    ]
  },
  {
    path: '/monitorEvaluation',
    component: Layout,
    redirect: '/MonitorEvaluation/monitor',
    hidden: false,
    name: 'MonitorEvaluation',
    children: [
      {
        path: 'monitor/:id',
        component: () => import('@/views/monitorEvaluation/monitor'),
        name: 'Monitor',
        meta: {
          title: '水质反演',
          icon: 'example'
        }
      },
    ]
  },
  {
    path: '',
    component: Layout,
    children: [
      {
        path: 'https://www.mee.gov.cn/ywgz/fgbz/bz/bzwb/shjbh/shjzlbz/200206/W020061027509896672057.pdf',
        meta: { title: '地表水标准', icon: 'link' }
      }
    ]
  },
  // {
  //   path: '/dashboard',
  //   component: Layout,
  //   hidden: false,
  //   name: 'Dashboard',
  //   children: [
  //     {
  //       path: 'index',
  //       component: () => import('@/views/queryAnalysis/index'),
  //       name: '信息统计',
  //       meta: { title: '信息统计', icon: 'dashboard' }
  //     }
  //   ]
  // },
  
  {
    path: '/queryAnalysis/',
    component: Layout,
    hidden: false,
    name: 'analysis',
    children: [    
      {
        path: 'analysis',
        component: () => import('@/views/queryAnalysis/analysis'),
        name: 'Analysis',
        meta: {
          title: '水质数据分析',
          icon: 'chart'
        }
      }
    ]
  },
  // {
  //   path: '/waterMatterManage',
  //   component: Layout,
  //   // redirect: '/waterMatter/index',
  //   hidden: false,
  //   children: [
  //     {
  //       path: 'index',
  //       component: () => import('@/views/dataManage/index'),
  //       name: 'DataManage',
  //       meta: { title: '数据管理', icon: 'table', noCache: true }
  //     }
  //   ]
  // },
  {
    path: '/waterMatterDruid',
    component: Layout,
    hidden: false,
    name: 'waterMatterDruid',
    children: [   
      {
        path: 'druid',
        component: () => import('@/views/monitor/deviceManage/index'),
        name: 'Druid',
        meta: {
          title: '水务监控与报警',
          icon: 'druid'
        }
      }, {
        path: 'device/:id',
        component: () => import('@/views/monitor/deviceManage/device'),
        name: 'Device',
        meta: {
          title: '设备历史数据',
          icon: 'example'
        },
        hidden: true
      },
    ]
  },
  // {
  //   path: '/deviceHistory',
  //   component: Layout,
  //   // redirect: '/MonitorEvaluation/monitor',
  //   hidden: true,
  //   name: 'deviceHistory',
  //   children: [
  //     {
  //       path: 'device/:id',
  //       component: () => import('@/views/monitor/deviceManage/device'),
  //       name: 'Device',
  //       meta: {
  //         title: '设备历史数据',
  //         icon: 'example'
  //       }
  //     },
  //   ]
  // },
  {
    path: '/waterMatterNotice',
    component: Layout,
    hidden: false,
    name: 'waterMatterNotice',
    children: [   
      {
        path: 'notice',
        component: () => import('@/views/system/notice/index'),
        name: 'Notice',
        meta: {
          title: '通知公告',
          icon: 'message'
        }
      }
    ]
  },
]

export default new Router({
  mode: 'history', // 去掉url中的#
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})
