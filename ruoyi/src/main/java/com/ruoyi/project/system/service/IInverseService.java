package com.ruoyi.project.system.service;
import java.util.List;

import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.domain.WaterLandData;

/**
 * 角色业务层
 *
 * @author Kayden
 */
public interface IInverseService {
    // 获取某个水体的（所有）水质指标结果
    public List<ListResult> selectInverseResult(DataManage query);
    // 获取某水体的水陆分割结果
    public List<WaterLandData> selectWaterLandResult(DataManage query);
    // 更新水陆分割表
    public int updateWaterLandData(WaterLandData waterLandData);
}
