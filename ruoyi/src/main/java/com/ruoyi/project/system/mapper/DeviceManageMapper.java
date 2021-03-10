package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.DeviceManage;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.ListResult;
import org.apache.ibatis.annotations.Param;

public interface DeviceManageMapper {
    public List<DeviceManage> selectDataList(DeviceManage dataQuery);
    public int insertDevice(DeviceManage dataQuery);
    public int updateDevice(DeviceManage dataQuery);
    public int insertDeviceHistory(DeviceManage dataQuery);
    public int updateDeviceHistory(DeviceManage dataQuery);
    public List<DeviceManage> selectHistoryList(DeviceManage dataQuery);
    public List<String> selectUniqueDeviceName();
    public List<String> selectUniqueId();
    public List<String> selectUniqueCountry();
    public List<String> selectUniqueProvince();
    public List<String> selectUniqueCity();

    public int selectNUniqueDeviceName();
    public int selectNUniqueId();
    public int selectNUniqueCountry();
    public int selectNUniqueProvince();
    public int selectNUniqueCity();

    public int selectMaxDeviceId();
    public int deleteDeviceById(long deviceId);

}
