package com.ruoyi.project.system.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.security.service.TokenService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.ListResult;
import com.ruoyi.project.system.domain.RetrievalResult;
import com.ruoyi.project.system.domain.WaterLandData;
import com.ruoyi.project.system.service.IInverseService;
import com.ruoyi.project.system.service.IRemoteCallService;
import javafx.scene.control.Tab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.net.UnknownHostException;
import java.util.List;

@RestController
@RequestMapping("/data")
public class InverseController extends BaseController {
    private final IInverseService inverseService;

    @Autowired
    private IRemoteCallService remoteCallService;

    public InverseController(IInverseService inverseService, TokenService tokenService) {
        this.inverseService = inverseService;
    }

    // 获取某水体某个水质指标的结果。查询条件通过join water_info满足
    @GetMapping(value = "/waterQuality")
    public TableDataInfo getInverseResult(DataManage query)
    {
        startPage();
        List<ListResult> list = inverseService.selectInverseResult(query);
        return getDataTable(list);
    }

    // 获取水陆分割数据
    @GetMapping(value = "/waterLand")
    public TableDataInfo getWaterLandResult(DataManage query)
    {
        startPage();
        List<WaterLandData> list = inverseService.selectWaterLandResult(query);
        return getDataTable(list);
    }

    @PutMapping("/waterLand/segment")
    public AjaxResult segmentWaterLand(@RequestParam(value = "body") String waterLandString,
                                       @RequestParam(value = "save") String saveFlag,
                                       @RequestParam(value = "filePath") String filePath,
                                       @RequestParam(value = "bandWavelengthPath") String bandWavelengthPath) throws UnknownHostException {
        System.out.println("水陆分割ing");
        WaterLandData waterLandData = JSON.parseObject(waterLandString, WaterLandData.class);
        String segmentFilePrefix = "/waterLandFile";
        Float ndwiParam = waterLandData.getNdwiParam();
        Float closeParam = waterLandData.getCloseParam();
        Float openParam = waterLandData.getOpenParam();
        String params="{\"filePath\":\"" + filePath +
                "\",\"bandWavelengthPath\":\"" + bandWavelengthPath +
                "\",\"segmentFilePrefix\":\"" + segmentFilePrefix +
                "\",\"profilePath\":\"" + RuoYiConfig.getProfile() +
                "\",\"ndwiParam\":\"" + ndwiParam +
                "\",\"closeParam\":\"" + closeParam +
                "\",\"openParam\":\"" + openParam + "\"}";
        System.out.println("params: " + params);
        String waterLandPath;
        if (saveFlag.equals("true") || saveFlag.equals("True")) {
            // 判断waterLandData里面的waterLandPath是否存在且正常，若是，直接save，反之按照参数反演
            int lines = inverseService.updateWaterLandData(waterLandData);
            waterLandPath = waterLandData.getWaterLandPath();
        } else {
            JSONObject ans = remoteCallService.remoteCall("segmentWaterLand", params);
            waterLandPath = ans.getString("waterLandPath");
            System.out.println("ans: " + waterLandPath);
        }
        AjaxResult ajax = AjaxResult.success();
        ajax.put("imgUrl", waterLandPath);
        return ajax;
    }
//    @GetMapping(value = "/result")
//    public TableDataInfo getResultByDictCode(RetrievalResult dataQuery)
//    {
//        startPage();
//        List<RetrievalResult> retrievalResults = inverseService.selectResultByDictCode(dataQuery);
//        return getDataTable(retrievalResults);
//    }
//
//    @PutMapping(value = "/retrieval")
//    public TableDataInfo retrievalByDictCode(RetrievalResult dataQuery)
//    {
////        需要通过参数反演结果 以及利用参数改变表内容 然后返回新结果
//        List<RetrievalResult> retrievalResults = inverseService.selectResultByDictCode(dataQuery);
//        return getDataTable(retrievalResults);
//    }
}
