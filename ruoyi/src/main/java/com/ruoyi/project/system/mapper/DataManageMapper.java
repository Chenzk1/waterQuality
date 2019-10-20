package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.DataManage;

public interface DataManageMapper {
    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    public List<DataManage> selectDataList(DataManage dataQuery);
}
