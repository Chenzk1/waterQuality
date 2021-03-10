package com.ruoyi.project.system.service;

import java.util.List;

import com.ruoyi.project.system.domain.DeviceManage;

/**
 * 角色业务层
 *
 * @author ruoyi
 */
public interface IDeviceManageService
{
    public List<DeviceManage> selectDataList(DeviceManage dataQuery);
    public List<DeviceManage> selectHistoryList(DeviceManage dataQuery);

    public int insertDevice(DeviceManage dataQuery);
    public int updateDevice(DeviceManage dataQuery);

    public int insertDeviceHistory(DeviceManage dataQuery);
    public int updateDeviceHistory(DeviceManage dataQuery);

    public List<String> selectUniqueByDictCode(String dictCode);

    public int selectNUniqueByDictCode(String dictCode);

    public int deleteDeviceById(Long waterId);
    public int selectMaxDeviceId();
}
