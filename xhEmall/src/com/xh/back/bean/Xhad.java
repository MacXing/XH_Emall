package com.xh.back.bean;

import java.util.Date;

public class Xhad {
    private Integer adid;

    private String adname;

    private Integer adposition;

    private String adtxt;

    private String adlink;

    private Date adtime;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    public Integer getAdid() {
        return adid;
    }

    public void setAdid(Integer adid) {
        this.adid = adid;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname == null ? null : adname.trim();
    }

    public Integer getAdposition() {
        return adposition;
    }

    public void setAdposition(Integer adposition) {
        this.adposition = adposition;
    }

    public String getAdtxt() {
        return adtxt;
    }

    public void setAdtxt(String adtxt) {
        this.adtxt = adtxt == null ? null : adtxt.trim();
    }

    public String getAdlink() {
        return adlink;
    }

    public void setAdlink(String adlink) {
        this.adlink = adlink == null ? null : adlink.trim();
    }

    public Date getAdtime() {
        return adtime;
    }

    public void setAdtime(Date adtime) {
        this.adtime = adtime;
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
}