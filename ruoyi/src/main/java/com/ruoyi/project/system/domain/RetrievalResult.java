package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.Date;
import java.util.Map;

/**
 * 获取某个水体某种水质指标的统计性结果
 *
 */
public class RetrievalResult extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 水体ID */
    private Long waterId;

    /** 水体名称 */

    private String waterName;
    private String province;
    private String city;
    private String type;
    private String dataType;

    private Float ndwiParam;
    private Float closeParam;
    private Float openParam;

    private Float min;
    private Float max;
    private Float mean;

    private String retrievalParams;


    public RetrievalResult()
    {
    }

    public RetrievalResult(Long waterId)
    {
        this.waterId = waterId;
    }

    public Long getWaterId()
    {
        return waterId;
    }

    public void setWaterId(Long waterId)
    {
        this.waterId = waterId;
    }

//    public Date getUpdateTime()
//    {
//        return updateTime;
//    }
//
//    public void setUpdateTime(Date updateTime)
//    {
//        this.updateTime = updateTime;
//    }

    public String getWaterName()
    {
        return waterName;
    }

    public void setWaterName(String waterName)
    {
        this.waterName= waterName;
    }

    public String getProvince() {return province; }
    public void setProvince(String province)
    {
        this.province= province;
    }

    public String getCity() {return city; }
    public void setCity(String city)
    {
        this.city = city;
    }

    public String getType() {return type; }
    public void setType(String type)
    {
        this.type= type;
    }

    public String getDataType() {return dataType; }
    public void setDataType(String dataType)
    {
        this.dataType= dataType;
    }

    public Float getNdwiParam() {return ndwiParam;}

    public void setNdwiParam(Float ndwiParam) {this.ndwiParam = ndwiParam;}

    public Float getCloseParam() {return closeParam;}

    public void setCloseParam(Float closeParam) {this.closeParam = closeParam;}

    public Float getOpenParam() {return openParam;}

    public void setOpenParam(Float openParam) {this.openParam = openParam;}

    public Float getMin() {return min;}

    public void setMin(Float min) {this.min = min;}

    public Float getMax() {return max;}

    public void setMax(Float max) {this.max = max;}

    public Float getMean() {return mean;}

    public void setMean(Float mean) {this.mean = mean;}

    public String getRetrievalParams()
    {
        return retrievalParams;
    }

    public void setRetrievalParams(String retrievalParams)
    {
        this.retrievalParams = retrievalParams;
    }
}
