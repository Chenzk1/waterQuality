package com.ruoyi.project.system.domain;
import com.ruoyi.framework.web.domain.BaseEntity;

public class Mail extends BaseEntity{
    // 发送给谁
    private String to;

    // 发送主题
    private String subject;

    // 发送内容
    private String content;

    // 附件地址
    private String filePath;

    public String getTo() { return this.to; }
    public void setTo(String to) { this.to=to; }

    public String getSubject() { return this.subject; }
    public void setSubject(String subject) { this.subject=subject; }

    public String getContent() { return this.content; }
    public void setContent(String content) {this.content=content; }
}
