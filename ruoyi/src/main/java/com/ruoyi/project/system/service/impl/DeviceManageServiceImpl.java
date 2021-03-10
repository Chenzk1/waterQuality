package com.ruoyi.project.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.aspectj.lang.annotation.DataScope;
import com.ruoyi.project.system.domain.DeviceManage;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.mapper.DeviceManageMapper;
import com.ruoyi.project.system.service.IDeviceManageService;

import static java.lang.Integer.max;

//import javax.validation.constraints.NotNull;

/**
 * data 业务层处理
 *
 */
@Service
public class DeviceManageServiceImpl implements IDeviceManageService {
    @Autowired
    private DeviceManageMapper deviceManageMapper;

    @Override
    public List<DeviceManage> selectDataList(DeviceManage dataQuery)
    {
        return deviceManageMapper.selectDataList(dataQuery);
    }

    @Override
    @Transactional
    public int insertDevice(DeviceManage dataQuery)
    {
//        if(dataQuery.getCurrentValue() != ) {
        try {
            int i = deviceManageMapper.insertDeviceHistory(dataQuery);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deviceManageMapper.insertDevice(dataQuery);
    }

    @Override
    @Transactional
    public int updateDevice(DeviceManage dataQuery)
    {
        try {
            int i = deviceManageMapper.insertDeviceHistory(dataQuery);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return deviceManageMapper.updateDevice(dataQuery);
    }

    @Override
    @Transactional
    public int insertDeviceHistory(DeviceManage dataQuery)
    {
        return deviceManageMapper.insertDeviceHistory(dataQuery);
    }

    @Override
    @Transactional
    public int updateDeviceHistory(DeviceManage dataQuery)
    {
        return deviceManageMapper.updateDeviceHistory(dataQuery);
    }

    @Override
    public List<DeviceManage> selectHistoryList(DeviceManage dataQuery)
    {
        return deviceManageMapper.selectHistoryList(dataQuery);
    }

    @Override
    public List<String> selectUniqueByDictCode(@NotNull String dictCode)
    {
        List<String> result = null;
        if(dictCode.equals("name")){
            result = deviceManageMapper.selectUniqueDeviceName();
        } else if(dictCode.equals("province")){
            result = deviceManageMapper.selectUniqueProvince();
        } else if(dictCode.equals("country")){
            result = deviceManageMapper.selectUniqueCountry();
        } else if(dictCode.equals("city")){
            result = deviceManageMapper.selectUniqueCity();
        } else if(dictCode.equals("id")){
            result = deviceManageMapper.selectUniqueId();
        }
        return result;
    }

    @Override
    public int selectNUniqueByDictCode(@NotNull String dictCode)
    {
        int result = 0;
        if(dictCode.equals("name")){
            result = deviceManageMapper.selectNUniqueDeviceName();
        } else if(dictCode.equals("province")){
            result = deviceManageMapper.selectNUniqueProvince();
        } else if(dictCode.equals("country")){
            result = deviceManageMapper.selectNUniqueCountry();
        } else if(dictCode.equals("city")){
            result = deviceManageMapper.selectNUniqueCity();
        } else if(dictCode.equals("id")){
            result = deviceManageMapper.selectNUniqueId();
        }
        return result;
    }

    @Transactional
    public int selectMaxDeviceId(){
        return max(deviceManageMapper.selectMaxDeviceId(), 0);
    }

    @Override
    public int deleteDeviceById(Long deviceId)
    {
        return deviceManageMapper.deleteDeviceById(deviceId);
    }
}
