package com.xh.back.bean;

import java.util.Date;

public class Xhfocus {
    private Integer userid;

    private Integer pid;

    private Integer focid;

    private Date focstartdate;

    private Date focenddate;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getFocid() {
        return focid;
    }

    public void setFocid(Integer focid) {
        this.focid = focid;
    }

    public Date getFocstartdate() {
        return focstartdate;
    }

    public void setFocstartdate(Date focstartdate) {
        this.focstartdate = focstartdate;
    }

    public Date getFocenddate() {
        return focenddate;
    }

    public void setFocenddate(Date focenddate) {
        this.focenddate = focenddate;
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