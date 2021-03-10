package com.ruoyi.project.system.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.security.LoginUser;
import com.ruoyi.framework.security.service.TokenService;
import com.ruoyi.project.system.domain.Mail;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.service.IMailService;
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
import com.ruoyi.project.system.domain.DeviceManage;
import com.ruoyi.project.system.service.IDeviceManageService;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.crypto.Data;


/**
 * 角色信息
 *
 * @author Kayden
 */
@RestController
@RequestMapping("data/device")
public class DeviceManageController extends BaseController{

    @Autowired
    private IDeviceManageService deviceService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private IMailService mailService;

    //    @PreAuthorize("@ss.hasPermi('system:role:list')")
    @GetMapping(value = "/list")
    public TableDataInfo list(DeviceManage dataQuery)
    {
        startPage();
        List<DeviceManage> list = deviceService.selectDataList(dataQuery);
        return getDataTable(list);
    }

    /**
     * 修改水体数据
     */
//    @PreAuthorize("@ss.hasPermi('system:role:edit')")
    @Log(title = "数据管理", businessType = BusinessType.UPDATE)
    @PutMapping(value = "/list")
    public AjaxResult editDevice(@RequestParam(value = "body") String deviceManageString)
    {
        DeviceManage deviceManage = JSON.parseObject(deviceManageString, DeviceManage.class);
        sendMail(deviceManage);
        return toAjax(deviceService.updateDevice(deviceManage));
    }

    private void sendMail(DeviceManage deviceManage) {
        double lowerLimit = deviceManage.getLowerLimit();
        double upperLimit = deviceManage.getUpperLimit();
        double currentValue = deviceManage.getCurrentValue();
        if(lowerLimit > currentValue) {
            Mail mail = new Mail();
            mail.setTo("1226269691@qq.com");
            mail.setSubject("水务设备报警test");
            mail.setContent("设备值："+String.valueOf(currentValue)+"，低于最低限:"+String.valueOf(lowerLimit));
            mailService.sendMail(mail);
        }
        if(upperLimit < currentValue) {            Mail mail = new Mail();
            mail.setTo("1226269691@qq.com");
            mail.setSubject("水务设备报警test");
            mail.setContent("设备值："+String.valueOf(currentValue)+"，高于最高限:"+String.valueOf(upperLimit));
            mailService.sendMail(mail);
        }
    }

    /**
     * 新增
     */
    @Log(title = "数据管理", businessType = BusinessType.INSERT)
    @PostMapping(value = "/list")
    public AjaxResult addDevice(@RequestParam(value = "body") String deviceManageString)
    {
        DeviceManage deviceManage = JSON.parseObject(deviceManageString, DeviceManage.class);
        long deviceId;
        if(deviceManage.getDeviceId() == null) {
            deviceId = deviceService.selectMaxDeviceId()+1;
        } else {
            deviceId = Math.toIntExact(deviceManage.getDeviceId())+1;
        }
        deviceManage.setDeviceId(deviceId);
        sendMail(deviceManage);
        return toAjax(deviceService.insertDevice(deviceManage));
    }

    @GetMapping(value = "/history")
    public TableDataInfo historyList(DeviceManage dataQuery)
    {
        startPage();
        List<DeviceManage> list = deviceService.selectHistoryList(dataQuery);
        return getDataTable(list);
    }

    /**
     * 根据dictCode查询unique nunique
     */
    @GetMapping(value = "/unique/{dictCode}")
    public AjaxResult getUniqueByDictCode(@PathVariable String dictCode)
    {
        return AjaxResult.success(deviceService.selectUniqueByDictCode(dictCode));
    }

    @GetMapping(value = "/nunique/{dictCode}")
    public AjaxResult getNUniqueByDictCode(@PathVariable String dictCode)
    {
        return AjaxResult.success(deviceService.selectNUniqueByDictCode(dictCode));
    }

    @PreAuthorize("@ss.hasPermi('system:user:remove')")
    @Log(title = "设备管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceId}")
    public AjaxResult remove(@PathVariable Long deviceId)
    {
        return toAjax(deviceService.deleteDeviceById(deviceId));
    }
}
