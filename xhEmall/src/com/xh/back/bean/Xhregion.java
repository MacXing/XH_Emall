package com.xh.back.bean;

public class Xhregion {
    private Integer regionid;

    private Integer xhrRegionid;

    private String regionname;

    private String regiontype;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    public Integer getRegionid() {
        return regionid;
    }

    public void setRegionid(Integer regionid) {
        this.regionid = regionid;
    }

    public Integer getXhrRegionid() {
        return xhrRegionid;
    }

    public void setXhrRegionid(Integer xhrRegionid) {
        this.xhrRegionid = xhrRegionid;
    }

    public String getRegionname() {
        return regionname;
    }

    public void setRegionname(String regionname) {
        this.regionname = regionname == null ? null : regionname.trim();
    }

    public String getRegiontype() {
        return regiontype;
    }

    public void setRegiontype(String regiontype) {
        this.regiontype = regiontype == null ? null : regiontype.trim();
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