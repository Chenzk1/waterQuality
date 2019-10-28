package com.ruoyi.project.system.controller;

import java.util.List;

import com.ruoyi.project.system.domain.RetrievalResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.service.IDataManageService;


/**
 * 角色信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/data/list")
public class DataManageController extends BaseController{

    @Autowired
    private IDataManageService dataService;

//    @PreAuthorize("@ss.hasPermi('system:role:list')")
    @GetMapping
    public TableDataInfo list(DataManage dataQuery)
    {
        startPage();
        List<DataManage> list = dataService.selectDataList(dataQuery);
        return getDataTable(list);
    }

    /**
     * 根据dictCode查询unique nunique
     */
    @GetMapping(value = "/unique/{dictCode}")
    public AjaxResult getUniqueByDictCode(@PathVariable String dictCode)
    {
        return AjaxResult.success(dataService.selectUniqueByDictCode(dictCode));
    }

    @GetMapping(value = "/nunique/{dictCode}")
    public AjaxResult getNUniqueByDictCode(@PathVariable String dictCode)
    {
        return AjaxResult.success(dataService.selectNUniqueByDictCode(dictCode));
    }

    @GetMapping(value = "/result")
    public TableDataInfo getResultByDictCode(RetrievalResult dataQuery)
    {
        startPage();
        List<RetrievalResult> retrievalResults = dataService.selectResultByDictCode(dataQuery);
        return getDataTable(retrievalResults);
    }

    /**
     * 修改保存角色
     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
    @Log(title = "数据管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DataManage dataManage)
    {
        dataManage.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(dataService.updateWater(dataManage));
    }

    /**
     * 新增
     */
    @Log(title = "数据管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DataManage dataManage)
    {
        dataManage.setCreateBy(SecurityUtils.getUsername());
        return toAjax(dataService.insertWater(dataManage));
    }
//    /**
//     * 根据角色编号获取详细信息
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:query')")
//    @GetMapping(value = "/{roleId}")
//    public AjaxResult getInfo(@PathVariable Long roleId)
//    {
//        return AjaxResult.success(roleService.selectRoleById(roleId));
//    }
//
//    /**
//     * 新增角色
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:add')")
//    @Log(title = "角色管理", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody SysRole role)
//    {
//        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role)))
//        {
//            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
//        }
//        else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role)))
//        {
//            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
//        }
//        role.setCreateBy(SecurityUtils.getUsername());
//        return toAjax(roleService.insertRole(role));
//
//    }
//
//    /**
//     * 修改保存角色
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
//    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody SysRole role)
//    {
//        roleService.checkRoleAllowed(role);
//        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role)))
//        {
//            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
//        }
//        else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role)))
//        {
//            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
//        }
//        role.setUpdateBy(SecurityUtils.getUsername());
//        return toAjax(roleService.updateRole(role));
//    }
//
//    /**
//     * 修改保存数据权限
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
//    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
//    @PutMapping("/dataScope")
//    public AjaxResult dataScope(@RequestBody SysRole role)
//    {
//        roleService.checkRoleAllowed(role);
//        return toAjax(roleService.authDataScope(role));
//    }
//
//    /**
//     * 状态修改
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
//    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
//    @PutMapping("/changeStatus")
//    public AjaxResult changeStatus(@RequestBody SysRole role)
//    {
//        roleService.checkRoleAllowed(role);
//        role.setUpdateBy(SecurityUtils.getUsername());
//        return toAjax(roleService.updateRoleStatus(role));
//    }
//
//    /**
//     * 删除岗位
//     */
//    @PreAuthorize("@ss.hasPermi('system:role:remove')")
//    @Log(title = "角色管理", businessType = BusinessType.DELETE)
//    @DeleteMapping("/{roleId}")
//    public AjaxResult remove(@PathVariable Long roleId)
//    {
//        roleService.checkRoleAllowed(new SysRole(roleId));
//        return toAjax(roleService.deleteRoleById(roleId));
//    }
}
