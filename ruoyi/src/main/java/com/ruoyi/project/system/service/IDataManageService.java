package com.ruoyi.project.system.service;

import java.util.List;

import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.RetrievalResult;

/**
 * 角色业务层
 *
 * @author ruoyi
 */
public interface IDataManageService
{
    /**
     * 根据条件分页查询水体数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    public List<DataManage> selectDataList(DataManage dataQuery);

    public List<String> selectUniqueByDictCode(String dictCode);

    public int selectNUniqueByDictCode(String dictCode);

    public List<RetrievalResult> selectResultByDictCode(RetrievalResult dataQuery);

    /**
     * 修改保存水体信息
     *
     * @param dataManage 水体信息
     * @return 结果
     */
    public int updateWater(DataManage dataManage);
    public int insertWater(DataManage dataManage);
//    public List<DataManage> insertDataManage(DataManage dataManage);
//    /**
//     * 根据用户ID查询角色
//     *
//     * @param userId 用户ID
//     * @return 权限列表
//     */
//    public Set<String> selectRolePermissionByUserId(Long userId);
//
//    /**
//     * 查询所有角色
//     *
//     * @return 角色列表
//     */
//    public List<SysRole> selectRoleAll();
//
//    /**
//     * 根据用户ID获取角色选择框列表
//     *
//     * @param userId 用户ID
//     * @return 选中角色ID列表
//     */
//    public List<Integer> selectRoleListByUserId(Long userId);
//
//    /**
//     * 通过角色ID查询角色
//     *
//     * @param roleId 角色ID
//     * @return 角色对象信息
//     */
//    public SysRole selectRoleById(Long roleId);
//
//    /**
//     * 校验角色名称是否唯一
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public String checkRoleNameUnique(SysRole role);
//
//    /**
//     * 校验角色权限是否唯一
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public String checkRoleKeyUnique(SysRole role);
//
//    /**
//     * 校验角色是否允许操作
//     *
//     * @param role 角色信息
//     */
//    public void checkRoleAllowed(SysRole role);
//
//    /**
//     * 新增保存角色信息
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public int insertRole(SysRole role);
//
//    /**
//     * 修改保存角色信息
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public int updateRole(SysRole role);
//
//    /**
//     * 修改角色状态
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public int updateRoleStatus(SysRole role);
//
//    /**
//     * 修改数据权限信息
//     *
//     * @param role 角色信息
//     * @return 结果
//     */
//    public int authDataScope(SysRole role);
//
//    /**
//     * 通过角色ID删除角色
//     *
//     * @param roleId 角色ID
//     * @return 结果
//     */
//    public int deleteRoleById(Long roleId);
}
