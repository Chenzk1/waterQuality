import request from '@/utils/request'

/*
  水体基础信息接口
*/

// 获取水体信息
export function fetchList(query) {
  return request({
    url: '/data/list',
    method: 'get',
    params: query
  })
}

// 获取unique的province/city/type/water_name等
export function getUnique(dictCode) {
  return request({
    url: '/data/list/unique/' + dictCode,
    method: 'get'
  })
}

export function getNUnique(dictCode) {
  return request({
    url: '/data/list/nunique/' + dictCode,
    method: 'get'
  })
}

// 删除某id的水体信息、水质信息等
export function delWaterId(waterId) {
  return request({
    url: '/data/list/' + waterId,
    method: 'delete'
  })
}

export function fetchCreateList(data) {
  return request({
    url: '/data/list',
    method: 'post',
    data
  })
}

export function fetchUpdateList(data) {
  return request({
    url: '/data/list',
    method: 'put',
    data
  })
}

/*
  设备信息接口
*/

// 获取水体信息
export function fetchDeviceList(query) {
  return request({
    url: '/data/device/list',
    method: 'get',
    params: query
  })
}
// 获取水体信息
export function fetchDeviceHistory(query) {
  return request({
    url: '/data/device/history',
    method: 'get',
    params: query
  })
}

// 获取unique的province/city/type/water_name等
export function getDeviceUnique(dictCode) {
  return request({
    url: '/data/device/unique/' + dictCode,
    method: 'get'
  })
}

export function getDeviceNUnique(dictCode) {
  return request({
    url: '/data/device/nunique/' + dictCode,
    method: 'get'
  })
}

// 删除某id的水体信息、水质信息等
export function delDeviceId(waterId) {
  return request({
    url: '/data/device/' + waterId,
    method: 'delete'
  })
}

export function fetchCreateDevice(data) {
  return request({
    url: '/data/device/list',
    method: 'post',
    data
  })
}

export function fetchUpdateDevice(data) {
  return request({
    url: '/data/device/list',
    method: 'put',
    data
  })
}

/*
  水质信息
*/

// 接口1：获取某查询条件的某些指标，例如查询条件为water_id时，获得单个水体的水质。返回全部指标，前端选择
export function fetchWaterQuality(query) {
  return request({
    url: '/data/waterQuality',
    method: 'get',
    params: query
  })
}
// 接口2：水陆分割数据获取
export function fetchWaterLand(query) {
  return request({
    url: '/data/waterLand',
    method: 'get',
    params: query
  })
}
// 接口3：按照参数水陆分割。有save参数，save参数为"true",save
export function segmentWaterLand(data) {
  return request({
    url: '/data/waterLand/segment',
    method: 'put',
    data
  })
}
// 接口4：按照参数水质反演
// export function inverseWaterQuality(data) {
//   return request({
//     url: '/data/waterQuality/inverse',
//     method: 'put',
//     data
//   })
// }

// TODO: --> fetchInverse 获取某水体某指标的反演结果
// export function fetchResult(query) {
export function fetchInverse(query) {
  return request({
    url: '/data/list/result',
    method: 'get',
    params: query
  })
}



// TODO: --> inverseWaterQuality 按照参数对某指标进行反演
// export function fetchRetrieval(query) {
export function inverseWaterQuality(query) {
  return request({
    url: '/data/list/retrieval',
    method: 'put',
    params: query
  })
}

export function fetchData(id) {
  return request({
    url: '/data/detail',
    method: 'get',
    params: { id }
  })
}


// 水体信息+所有指标反演信息。
export function fetchResultList(query){
  return request({
    url: '/data/list/listResult',
    method: 'get',
    params: query
  })
}