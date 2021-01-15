package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;
import java.util.Map;

public class ListResult extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 水体ID */
    private Long waterId;

    /** 水体名称 */
    private String province;
    private String city;
    private String location;
    private String type;
    private Integer dataType;

    private String rgbPath;
    private String waterName;

    private Float tpMin;
    private Float tpMax;
    private Float tpMean;
    private String tpResultPath;
    private String tpSaveMethod;

    private Float tnMin;
    private Float tnMax;
    private Float tnMean;
    private String tnResultPath;
    private String tnSaveMethod;

    private Float tssMin;
    private Float tssMax;
    private Float tssMean;
    private String tssResultPath;
    private String tssSaveMethod;

    private String chlaResultPath;
    private Float chlaMin;
    private Float chlaMax;
    private Float chlaMean;
    private String chlaSaveMethod;

    private Float nhMin;
    private Float nhMax;
    private Float nhMean;
    private String nhResultPath;
    private String nhSaveMethod;

    private Float codMin;
    private Float codMax;
    private Float codMean;
    private String codResultPath;
    private String codSaveMethod;

    private String retrievalParams;

    private Date photoTime;

    private String bands;
    private String department;
    private String contact;
    private String phonenumber;

    public String getBands()
    {
        return bands;
    }
    public void setBands(String bands)
    {
        this.bands = bands;
    }

    public void setDepartment(String department)
    {
        this.department = department;
    }
    public String getDepartment()
    {
        return department;
    }

    public void setContact(String contact)
    {
        this.contact = contact;
    }
    public String getContact()
    {
        return contact;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }
    public String getPhonenumber()
    {
        return phonenumber;
    }

    public Date getPhotoTime()
    {
        return photoTime;
    }
    public void setPhotoTime(Date photoTime)
    {
        this.photoTime = photoTime;
    }

    public ListResult()
    {
    }

    public ListResult(Long waterId)
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

    public String getRgbPath()
    {
        return rgbPath;
    }

    public void setRgbPath(String rgbPath)
    {
        this.rgbPath = rgbPath;
    }
    public String getProvince()
    {
        return province;
    }

    public void setProvince(String province)
    {
        this.province = province;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getLocation()
    {
        return location;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public Integer getDataType()
    {
        return dataType;
    }

    public void setDataType(Integer dataType)
    {
        this.dataType = dataType;
    }

    public String getWaterName()
    {
        return waterName;
    }

    public void setWaterName(String waterName)
    {
        this.waterName= waterName;
    }

    public Float getTpMin() {return tpMin;}
    public void setTpMin(Float tpMin) {this.tpMin = tpMin;}

    public Float getTpMax() {return tpMax;}
    public void setTpMax(Float tpMax) {this.tpMax = tpMax;}

    public Float getTpMean() {return tpMean;}
    public void setTpMean(Float tpMean) {this.tpMean = tpMean;}

    public Float getTnMin() {return tnMin;}
    public void setTnMin(Float tnMin) {this.tnMin = tnMin;}

    public Float getTnMax() {return tnMax;}
    public void setTnMax(Float tnMax) {this.tnMax = tnMax;}

    public Float getTnMean() {return tnMean;}
    public void setTnMean(Float tnMean) {this.tnMean = tnMean;}

    public Float getTssMin() {return tssMin;}
    public void setTssMin(Float tssMin) {this.tssMin = tssMin;}

    public Float getTssMax() {return tssMax;}
    public void setTssMax(Float tssMax) {this.tssMax = tssMax;}

    public Float getTssMean() {return tssMean;}
    public void setTssMean(Float tssMean) {this.tssMean = tssMean;}

    public Float getChlaMin() {return chlaMin;}
    public void setChlaMin(Float chlaMin) {this.chlaMin = chlaMin;}

    public Float getChlaMax() {return chlaMax;}
    public void setChlaMax(Float chlaMax) {this.chlaMax = chlaMax;}

    public Float getChlaMean() {return chlaMean;}
    public void setChlaMean(Float chlaMean) {this.chlaMean = chlaMean;}

    public Float getCodMin() {return codMin;}
    public void setCodMin(Float codMin) {this.codMin = codMin;}

    public Float getCodMax() {return codMax;}
    public void setCodMax(Float codMax) {this.codMax = codMax;}

    public Float getCodMean() {return codMean;}
    public void setCodMean(Float codMean) {this.codMean = codMean;}

    public Float getNhMin() {return nhMin;}
    public void setNhMin(Float nhMin) {this.nhMin = nhMin;}

    public Float getNhMax() {return nhMax;}
    public void setNhMax(Float nhMax) {this.nhMax = nhMax;}

    public Float getNhMean() {return nhMean;}
    public void setNhMean(Float nhMean) {this.nhMean = nhMean;}

    public String getRetrievalParams()
    {
        return retrievalParams;
    }

    public void setRetrievalParams(String retrievalParams)
    {
        this.retrievalParams = retrievalParams;
    }

    public String getTpResultPath()
    {
        return tpResultPath;
    }

    public void setTpResultPath(String tpResultPath)
    {
        this.tpResultPath = tpResultPath;
    }

    public String getTnResultPath()
    {
        return tnResultPath;
    }

    public void setTnResultPath(String tnResultPath)
    {
        this.tnResultPath = tnResultPath;
    }

    public String getTssResultPath()
    {
        return tssResultPath;
    }

    public void setTssResultPath(String tssResultPath)
    {
        this.tssResultPath = tssResultPath;
    }

    public String getChlaResultPath()
    {
        return chlaResultPath;
    }

    public void setChlaResultPath(String chlaResultPath)
    {
        this.chlaResultPath = chlaResultPath;
    }

    public String getCodResultPath()
    {
        return codResultPath;
    }

    public void setCodResultPath(String codResultPath)
    {
        this.codResultPath = codResultPath;
    }

    public String getNhResultPath()
    {
        return nhResultPath;
    }

    public void setNhResultPath(String nhResultPath)
    {
        this.nhResultPath = nhResultPath;
    }

    public String getTpSaveMethod()
    {
        return tpSaveMethod;
    }
    public void setTpSaveMethod(String tpSaveMethod)
    {
        this.tpSaveMethod = tpSaveMethod;
    }

    public String getTnSaveMethod()
    {
        return tnSaveMethod;
    }
    public void setTnSaveMethod(String tnSaveMethod)
    {
        this.tnSaveMethod = tnSaveMethod;
    }

    public String getTssSaveMethod()
    {
        return tssSaveMethod;
    }
    public void setTssSaveMethod(String tssSaveMethod)
    {
        this.tssSaveMethod = tssSaveMethod;
    }

    public String getCodSaveMethod()
    {
        return codSaveMethod;
    }
    public void setCodSaveMethod(String codSaveMethod)
    {
        this.codSaveMethod = codSaveMethod;
    }

    public String getNhSaveMethod()
    {
        return nhSaveMethod;
    }
    public void setNhSaveMethod(String nhSaveMethod)
    {
        this.nhSaveMethod = nhSaveMethod;
    }

    public String getChlaSaveMethod()
    {
        return chlaSaveMethod;
    }
    public void setChlaSaveMethod(String chlaSaveMethod)
    {
        this.chlaSaveMethod = chlaSaveMethod;
    }
}
