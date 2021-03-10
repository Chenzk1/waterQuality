package com.ruoyi.project.system.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.security.LoginUser;
import com.ruoyi.framework.security.service.TokenService;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.service.IRemoteCallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.service.IDataManageService;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.crypto.Data;


/**
 * 角色信息
 *
 * @author Kayden
 */
@RestController
@RequestMapping("/data/list")
public class DataManageController extends BaseController{

    @Autowired
    private IDataManageService dataService;

    @Autowired
    private IRemoteCallService remoteCallService;

    @Autowired
    private TokenService tokenService;

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

    @PutMapping(value = "/retrieval")
    public TableDataInfo retrievalByDictCode(RetrievalResult dataQuery)
    {
//        需要通过参数反演结果 以及利用参数改变表内容 然后返回新结果
        List<RetrievalResult> retrievalResults = dataService.selectResultByDictCode(dataQuery);
        return getDataTable(retrievalResults);
    }

    /**
     * 修改水体数据
     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
//    @Log(title = "数据管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult editWater(@RequestParam(value = "body") String dataManageString,
                           @RequestParam(value = "bandWavelengthFile", required = false) MultipartFile bandWavelengthFile,
                           @RequestParam(value = "remoteTableFile", required = false) MultipartFile remoteTableFile) throws IOException
    {
        DataManage dataManage = JSON.parseObject(dataManageString, DataManage.class);
        dataManage.setUpdateBy(SecurityUtils.getUsername());
        setFiles(bandWavelengthFile, remoteTableFile, dataManage);
        // todo: 图像文件加上rgb，rgb_path
        AjaxResult ajaxResult = toAjax(dataService.updateWater(dataManage));
        return ajaxResult;
    }

    /**
     * 新增
     */
//    @Log(title = "数据管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult addWater(@RequestParam(value = "body") String dataManageString,
                                @RequestParam(value = "bandWavelengthFile", required = false) MultipartFile bandWavelengthFile,
                                @RequestParam(value = "remoteTableFile", required = false) MultipartFile remoteTableFile) throws IOException
    {
        DataManage dataManage = JSON.parseObject(dataManageString, DataManage.class);
        dataManage.setCreateBy(SecurityUtils.getUsername());
        // todo: 图像文件加上rgb，rgb_path
        setFiles(bandWavelengthFile, remoteTableFile, dataManage);
        return toAjax(dataService.insertWater(dataManage));
    }

    private void setFiles(@RequestParam(value = "bandWavelengthFile", required = false) MultipartFile bandWavelengthFile, @RequestParam(value = "remoteTableFile", required = false) MultipartFile remoteTableFile, DataManage dataManage) throws IOException {
        if (dataManage.getType().equals("自定义") && !bandWavelengthFile.isEmpty()) {
            int waterId;
            if(dataManage.getWaterId() == null) {
                waterId = dataService.selectMaxWaterId()+1;
            } else {
                waterId = Math.toIntExact(dataManage.getWaterId())+1;
            }
            String fileName = "custom_" + waterId + ".txt";
            String bandWavelength = FileUploadUtils.uploadAbsolutePath(RuoYiConfig.getProfile()+"/bandWavelengthFile",
                    bandWavelengthFile, fileName);
            long linesNum = Files.lines(Paths.get(RuoYiConfig.getProfile()+"/bandWavelengthFile/"+fileName)).count();
            dataManage.setBands(Math.toIntExact(linesNum));
            dataManage.setType(fileName);
            dataManage.setBandWavelengthFilePath(bandWavelength);
            // TODO: 设置bands
        }
        if (remoteTableFile!=null && !remoteTableFile.isEmpty()) {
            String remoteTable = FileUploadUtils.uploadAbsolutePath(RuoYiConfig.getProfile()+"/remoteTableFile",
                    remoteTableFile);
        }
        if(dataManage.getDataType() == 0)
        {
            String filePath=dataManage.getFilePath();
            String bandWavelengthPath=dataManage.getBandWavelengthFilePath();
            String rgbPathPrefix = "/rgbFile";
            String params="{\"filePath\":\"" + filePath +
                    "\",\"bandWavelengthPath\":\"" + bandWavelengthPath +
                    "\",\"rgbPathPrefix\":\"" + rgbPathPrefix+
                    "\",\"profilePath\":\"" + RuoYiConfig.getProfile() +"\"}";
            System.out.println("params: " + params);
            JSONObject ans = remoteCallService.remoteCall("getRgbFile", params);
            String rgbPath = ans.getString("rgbPath");
            System.out.println("ans: " + rgbPath);
            dataManage.setRgbPath(rgbPath);
        }
    }

    @PreAuthorize("@ss.hasPermi('system:user:remove')")
    @Log(title = "水体管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{waterId}")
    public AjaxResult remove(@PathVariable Long waterId)
    {
        //dataService.checkUserAllowed(new DataManage(waterId));
        return toAjax(dataService.deleteWaterById(waterId));
    }

    @GetMapping(value = "/listResult")
    public TableDataInfo listResult(RetrievalResult dataQuery)
    {
        startPage();
        List<ListResult> list = dataService.selectListResult(dataQuery);
        return getDataTable(list);
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
