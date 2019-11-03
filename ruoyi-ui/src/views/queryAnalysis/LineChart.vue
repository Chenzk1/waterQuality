<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from '../dashboard/mixins/resize'

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
    height: {
      type: String,
      default: '350px'
    },
    autoResize: {
      type: Boolean,
      default: true
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
      }
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
      this.setOptions(this.chartData)
    },
    setOptions({ chla,cod,nh,tn,tp,tss } = {}) {
      this.chart.setOption({
        xAxis: {
          // data: [1,2,3,4,5,6,7],
          boundaryGap: false,
          type: 'time',
          axisTick: {
            show: false
          }
        },
        grid: {
          left: 10,
          right: 10,
          bottom: 20,
          top: 30,
          containLabel: true
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          },
          padding: [5, 10]
        },
        yAxis: {
          axisTick: {
            show: false
          }
        },
        legend: {
          data: ['叶绿素a', '化学需氧量', '氨氮','总氮', '总磷', '总悬浮物']
        },
        series: [{
          name: '总磷', itemStyle: {
            normal: {
              color: '#FF005A',
              lineStyle: {
                color: '#FF005A',
                width: 2
              }
            }
          },
          smooth: true,
          type: 'line',
          data: tp,
          animationDuration: 2800,
          animationEasing: 'cubicInOut'
        },
        {
          name: '总氮',
          smooth: true,
          type: 'line',
          itemStyle: {
            normal: {
              color: '#3888fa',
              lineStyle: {
                color: '#3888fa',
                width: 2
              },
              areaStyle: {
                color: '#f3f8ff'
              }
            }
          },
          data: tn,
          animationDuration: 2800,
          animationEasing: 'quadraticOut'
        },
        {
          name: '总悬浮物',
          smooth: true,
          type: 'line',
          itemStyle: {
            normal: {
              color: '#ff5511',
              lineStyle: {
                color: '#ff5511',
                width: 2
              },
              areaStyle: {
                color: '#ff5511'
              }
            }
          },
          data: tss,
          animationDuration: 2800,
          animationEasing: 'quadraticOut'
        },
        {
          name: '叶绿素a',
          smooth: true,
          type: 'line',
          itemStyle: {
            normal: {
              color: '#00ff99',
              lineStyle: {
                color: '#00ff99',
                width: 2
              },
              areaStyle: {
                color: '#00ff99'
              }
            }
          },
          data: chla,
          animationDuration: 2800,
          animationEasing: 'quadraticOut'
        },
        {
          name: '氨氮',
          smooth: true,
          type: 'line',
          itemStyle: {
            normal: {
              color: '#ff00ff',
              lineStyle: {
                color: '#ff00ff',
                width: 2
              },
              areaStyle: {
                color: '#ff00ff'
              }
            }
          },
          data: nh,
          animationDuration: 2800,
          animationEasing: 'quadraticOut'
        },
        {
          name: '化学需氧量',
          smooth: true,
          type: 'line',
          itemStyle: {
            normal: {
              color: '#ffff00',
              lineStyle: {
                color: '#ffff00',
                width: 2
              },
              areaStyle: {
                color: '#ffff00'
              }
            }
          },
          data: cod,
          animationDuration: 2800,
          animationEasing: 'cubicOut'
        }
        ]
      })
    }
  }
}
</script>
