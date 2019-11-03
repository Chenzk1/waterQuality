import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/data/list',
    method: 'get',
    params: query
  })
}

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

export function fetchResult(query) {
  return request({
    url: '/data/list/result',
    method: 'get',
    params: query
  })
}

export function fetchRetrieval(query) {
  return request({
    url: '/data/list/retrieval',
    method: 'put',
    params: query

  })
}


export function fetchCreate(data) {
  return request({
    url: '/data/list',
    method: 'post',
    data
  })
}

export function fetchUpdate(data) {
  return request({
    url: '/data/list',
    method: 'put',
    data
  })
}

export function fetchData(id) {
  return request({
    url: '/data/detail',
    method: 'get',
    params: { id }
  })
}


export function delWaterId(waterId) {
  return request({
    url: '/data/list/' + waterId,
    method: 'delete'
  })
}

export function fetchResultList(query){
  return request({
    url: '/data/list/listResult',
    method: 'get',
    params: query
  })
}