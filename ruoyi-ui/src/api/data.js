import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/data/list',
    method: 'get',
    params: query
  })
}

export function fetchUnique(query) {
  return request({
    url: '/data/unique',
    method: 'get',
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

export function fetchPv(pv) {
  return request({
    url: '/data/pv',
    method: 'get',
    params: { pv }
  })
}

export function createData(data) {
  return request({
    url: '/data/create',
    method: 'post',
    data
  })
}

export function updateData(data) {
  return request({
    url: '/data/update',
    method: 'post',
    data
  })
}
