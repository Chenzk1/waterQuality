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
import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.mapper.DataManageMapper;
import com.ruoyi.project.system.service.IDataManageService;

//import javax.validation.constraints.NotNull;

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

    @Override
    public List<ListResult> selectListResult(RetrievalResult dataQuery)
    {
        return dataManageMapper.selectListResult(dataQuery);
    }

    @Override
    public List<String> selectUniqueByDictCode(@NotNull String dictCode)
    {
        List<String> result = null;
        if(dictCode.equals("type")){
            result = dataManageMapper.selectUniqueType();
        } else if(dictCode.equals("name")){
            result = dataManageMapper.selectUniqueWaterName();
        } else if(dictCode.equals("province")){
            result = dataManageMapper.selectUniqueProvince();
        } else if(dictCode.equals("country")){
            result = dataManageMapper.selectUniqueCountry();
        } else if(dictCode.equals("city")){
            result = dataManageMapper.selectUniqueCity();
        } else if(dictCode.equals("id")){
            result = dataManageMapper.selectUniqueId();
        }
        return result;
    }

    @Override
    public int selectNUniqueByDictCode(@NotNull String dictCode)
    {
        int result = 0;
        if(dictCode.equals("type")){
            result = dataManageMapper.selectNUniqueType();
        } else if(dictCode.equals("name")){
            result = dataManageMapper.selectNUniqueWaterName();
        } else if(dictCode.equals("province")){
            result = dataManageMapper.selectNUniqueProvince();
        } else if(dictCode.equals("country")){
            result = dataManageMapper.selectNUniqueCountry();
        } else if(dictCode.equals("city")){
            result = dataManageMapper.selectNUniqueCity();
        } else if(dictCode.equals("id")){
            result = dataManageMapper.selectNUniqueId();
        }
        return result;
    }

    @Override
    public List<RetrievalResult> selectResultByDictCode(RetrievalResult dataQuery)
    {
        List<RetrievalResult> result = new ArrayList<>();
        switch (dataQuery.getRetrievalParams()){
            case "tp":
                result = dataManageMapper.selectTp(dataQuery.getWaterId());
                break;
            case "tn":
                result = dataManageMapper.selectTn(dataQuery.getWaterId());
                break;
            case "tss":
                result = dataManageMapper.selectTss(dataQuery.getWaterId());
                break;
            case "chla":
                result = dataManageMapper.selectChla(dataQuery.getWaterId());
                break;
            case "nh":
                result = dataManageMapper.selectNh(dataQuery.getWaterId());
                break;
            case "cod":
                result = dataManageMapper.selectCod(dataQuery.getWaterId());
                break;
            default:
                break;
        };
        return result;
    }

    @Override
    @Transactional
    public int updateWater(DataManage dataManage)
    {
        dataManageMapper.updateWater(dataManage);
        // 删除角色与菜单关联
//        dataManageMapper.deleteRoleMenuByRoleId(role.getRoleId());
        return 1;
    }

    @Override
    @Transactional
    public int insertWater(DataManage dataManage)
    {
        int row = dataManageMapper.insertWater(dataManage);
        long waterId = dataManage.getWaterId();
        // 关联
        dataManageMapper.insertTp(waterId);
        dataManageMapper.insertTn(waterId);
        dataManageMapper.insertChla(waterId);
        dataManageMapper.insertNh(waterId);
        dataManageMapper.insertCod(waterId);
        dataManageMapper.insertTss(waterId);
        return row;
    }

    @Override
    public int deleteWaterById(Long waterId)
    {
//        userRoleMapper.deleteUserRoleByUserId(userId);
//        userPostMapper.deleteUserPostByUserId(userId);
        return dataManageMapper.deleteWaterById(waterId);
    }
//    public void insertTp(int rows)
//    {
//        if (rows!=0)
//        {
//            // 新增用户与角色管理
//            List<SysUserRole> list = new ArrayList<SysUserRole>();
//            for (Long roleId : roles)
//            {
//                SysUserRole ur = new SysUserRole();
//                ur.setUserId(user.getUserId());
//                ur.setRoleId(roleId);
//                list.add(ur);
//            }
//            if (list.size() > 0)
//            {
//                userRoleMapper.batchUserRole(list);
//            }
//        }
//    }
}
