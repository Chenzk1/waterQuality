package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;

public class WaterLandData extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long waterId;
    private Float ndwiParam;
    private Float openParam;
    private Float closeParam;
    private String waterLandPath;

    public WaterLandData()
    {
    }

    public WaterLandData(Long waterId)
    {
        this.waterId = waterId;
    }

    public Long getWaterId() {
        return waterId;
    }

    public void setWaterId(Long waterId)
    {
        this.waterId = waterId;
    }

    public Float getNdwiParam() {
        return ndwiParam;
    }

    public void setNdwiParam(Float ndwiParam) { this.ndwiParam = ndwiParam; }

    public Float getOpenParam() {
        return openParam;
    }

    public void setOpenParam(Float openParam) { this.openParam = openParam; }

    public Float getCloseParam() {
        return closeParam;
    }

    public void setCloseParam(Float closeParam) { this.closeParam = closeParam; }

    public String getWaterLandPath() { return waterLandPath; }

    public void setWaterLandPath(String waterLandPath) { this.waterLandPath = waterLandPath; }
}
