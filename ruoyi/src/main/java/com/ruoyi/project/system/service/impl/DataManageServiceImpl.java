package com.ruoyi.project.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.aspectj.lang.annotation.DataScope;
import com.ruoyi.project.system.domain.DataManage ;
import com.ruoyi.project.system.mapper.DataManageMapper;
import com.ruoyi.project.system.service.IDataManageService;

/**
 * data 业务层处理
 *
 */
@Service
public class DataManageServiceImpl implements IDataManageService {
    @Autowired
    private DataManageMapper dataManageMapper;

    /**
     * 根据条件分页查询角色数据
     *
     * @param
     * @return 角色数据集合信息
     */
    @Override
    public List<DataManage> selectDataList(DataManage dataQuery)
    {
        return dataManageMapper.selectDataList(dataQuery);
    }

}
