package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;
/**
 * 水体数据表
 *
 */
public class DataManage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 水体ID */
    private Long waterId;

    /** 水体名称 */
    private String waterName;

    /** 拍摄时间 */
    private Date photoTime;

    /** 数据源 */
    private String type;

    /** 文件路径 */
    private String filePath;

    /** 文件名称 */
//    private String fileName;

    private String country;
    private String province;
    private String city;
    private String bands;
    private String rgbPath;
    private String remark;

    public DataManage()
    {

    }

    public DataManage(Long waterId)
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

    public String getWaterName()
    {
        return waterName;
    }

    public void setWaterName(String waterName)
    {
        this.waterName = waterName;
    }

    public Date getPhotoTime()
    {
        return photoTime;
    }

    public void setPhotoTime(Date photoTime)
    {
        this.photoTime = photoTime;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
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

    public String getBands()
    {
        return bands;
    }

    public void setBands(String bands)
    {
        this.bands = bands;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getFilePath()
    {
        return filePath;
    }

    public void setFilePath(String filePath)
    {
        this.filePath = filePath;
    }

    public String getRgbPath()
    {
        return rgbPath;
    }

    public void setRgbPath(String rgbPath)
    {
        this.rgbPath = rgbPath;
    }

}
