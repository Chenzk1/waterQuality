<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from '../dashboard/mixins/resize'

const animationDuration = 2000

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    autoResize: {
      type: Boolean,
      default: true
    },
    height: {
      type: String,
      default: '400px'
    },
    chartData: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      chart: null
    }
  },
  watch: {
    chartData: {
      deep: true,
      handler(val) {
        this.setOptions(val)
      },
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy() {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')
      console.log(this.chartData)
      this.setOptions(this.chartData)
    },
    setOptions({ max, mean, min } = {}) {
      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          top: '10%',
          left: '2%',
          right: '2%',
          bottom: '5%',
          // containLabel: true
        },
        xAxis: [{
          type: 'time',
          axisTick: {
            alignWithLabel: true
          }
        }],
        yAxis: [{
          type: 'value',
          axisTick: {
            show: false
          }
        }],
        legend:{
          data:["最大值",'平均值',"最小值"],
          orient: 'horizontal', // 'vertical'
          x: 'center', // 'center' | 'left' | {number},
          y: 'top', // 'center' | 'bottom' | {number}
          // borderWidth: 4,
          padding: 10, 
          },
        series: [{
          name: '平均值',
          type: 'bar',
          stack: 'vistors',
          barWidth: '35%',
          data: mean,
          animationDuration
        }, {
          name: '最小值',
          type: 'bar',
          stack: 'vistors',
          barWidth: '35%',
          data: min,
          animationDuration
        }, {
          name: '最大值',
          type: 'bar',
          stack: 'vistors',
          barWidth: '35%',
          data: max,
          animationDuration
        }]
      })
    }
  }
}
</script>
