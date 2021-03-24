package com.ruoyi.project.system.service.impl;

import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.WaterLandData;
import com.ruoyi.project.system.mapper.DataManageMapper;
import com.ruoyi.project.system.mapper.InverseMapper;
import com.ruoyi.project.system.service.IInverseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InverseServiceImpl implements IInverseService {
    @Autowired
    private InverseMapper inverseMapper;

    public List<ListResult> selectInverseResult(DataManage query)
    {
        return inverseMapper.selectInverseResult(query);
    }

    public List<WaterLandData> selectWaterLandResult(DataManage query)
    {
        return inverseMapper.selectWaterLandResult(query);
    }

    public int updateWaterLandData(WaterLandData waterLandData)
    {
        return inverseMapper.updateWaterLandData(waterLandData);
    }
}
