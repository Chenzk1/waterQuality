package com.ruoyi.project.system.service;

import com.alibaba.fastjson.JSONObject;

import java.net.UnknownHostException;

public interface IRemoteCallService {
    public JSONObject remoteCall(String method, String params) throws UnknownHostException;
}
