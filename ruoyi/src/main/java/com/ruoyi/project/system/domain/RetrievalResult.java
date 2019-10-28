package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;
import java.util.Map;

public class RetrievalResult extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 水体ID */
    private Long waterId;

    /** 水体名称 */
    private Date updateTime;

    private String rgbPath;

    private Float para1;
    private Float para2;
    private Float para3;

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

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }

    public String getRgbPath()
    {
        return rgbPath;
    }

    public void setRgbPath(String rgbPath)
    {
        this.rgbPath = rgbPath;
    }

    public Float getPara1() {return para1;}

    public void setPara1(Float para1) {this.para1 = para1;}

    public Float getPara2() {return para2;}

    public void setPara2(Float para2) {this.para2 = para2;}

    public Float getPara3() {return para3;}

    public void setPara3(Float para3) {this.para3 = para3;}

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
