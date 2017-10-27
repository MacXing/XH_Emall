package com.xh.back.bean;

import java.util.Date;

public class Xhmessage {
    private Integer msgid;

    private Integer userid;

    private String msgtxt;

    private Date msginittime;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getMsgtxt() {
        return msgtxt;
    }

    public void setMsgtxt(String msgtxt) {
        this.msgtxt = msgtxt == null ? null : msgtxt.trim();
    }

    public Date getMsginittime() {
        return msginittime;
    }

    public void setMsginittime(Date msginittime) {
        this.msginittime = msginittime;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1 == null ? null : attribute1.trim();
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2 == null ? null : attribute2.trim();
    }

    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3 == null ? null : attribute3.trim();
    }

    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4 == null ? null : attribute4.trim();
    }
}