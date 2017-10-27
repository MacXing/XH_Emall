package com.xh.back.bean;

public class Xhstock {
    private Integer stoid;

    private Integer pid;

    private Integer repid;

    private String pname;

    private String pdesc;

    private Integer stonumber;

    public Integer getStoid() {
        return stoid;
    }

    public void setStoid(Integer stoid) {
        this.stoid = stoid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getRepid() {
        return repid;
    }

    public void setRepid(Integer repid) {
        this.repid = repid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public Integer getStonumber() {
        return stonumber;
    }

    public void setStonumber(Integer stonumber) {
        this.stonumber = stonumber;
    }
}