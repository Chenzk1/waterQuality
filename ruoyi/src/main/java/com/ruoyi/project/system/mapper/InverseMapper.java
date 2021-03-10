package com.ruoyi.project.system.mapper;

import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.ListResult;

import java.util.List;

import com.ruoyi.project.system.domain.WaterLandData;
import org.apache.ibatis.annotations.Param;

public interface InverseMapper {
    public List<ListResult> selectInverseResult(DataManage query);
    public List<WaterLandData> selectWaterLandResult(DataManage query);
    public int updateWaterLandData(WaterLandData waterLandData);
}
