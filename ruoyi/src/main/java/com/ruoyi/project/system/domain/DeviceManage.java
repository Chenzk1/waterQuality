package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.Date;

public class DeviceManage extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 水体ID */
    private Long deviceId;

    /** 水体名称 */
    private String deviceName;

    /** 拍摄时间 */
    private Date generateTime;
    private String indexType;
    private String timeOffset;
    private String currentStatus;

    private double lowerLimit;
    private double upperLimit;
    private double currentValue;

    private String province;
    private String city;
    private String location;
    private String department;
    private String contact;
    private String phonenumber;
    private String emailAddress;

    public DeviceManage()
    {
    }

    public DeviceManage(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId()
    {
        return deviceId;
    }

    public void setDeviceId(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public String getDeviceName()
    {
        return deviceName;
    }
    public void setDeviceName(String deviceName)
    {
        this.deviceName=deviceName;
    }

    public String getIndexType() { return indexType; }
    public void setIndexType(String indexType) { this.indexType=indexType; }

    public String getTimeOffset() { return timeOffset; }
    public void setTimeOffset(String timeOffset) { this.timeOffset = timeOffset; }

    public String getCurrentStatus() { return currentStatus; }
    public void setCurrentStatus(String currentStatus) { this.currentStatus = currentStatus; }

    public double getLowerLimit() { return lowerLimit; }
    public void setLowerLimit(double lowerLimit) { this.lowerLimit=lowerLimit; }

    public double getUpperLimit() { return upperLimit; }
    public void setUpperLimit(double upperLimit) { this.upperLimit=upperLimit; }

    public double getCurrentValue() { return currentValue; }
    public void setCurrentValue(double currentValue) { this.currentValue=currentValue; }
    public Date getGenerateTime()
    {
        return generateTime;
    }

    public void setGenerateTime(Date generateTime)
    {
        this.generateTime = generateTime;
    }


    public String getEmailAddress() {return emailAddress;}
    public void setEmailAddress(String emailAddress) { this.emailAddress = emailAddress;}

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
}
