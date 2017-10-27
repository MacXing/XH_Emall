package com.xh.back.bean;

public class Xhrepertory {
    private Integer repid;

    private String repname;

    private String repaddress;

    private String repphone;

    private String repadmin;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    public Integer getRepid() {
        return repid;
    }

    public void setRepid(Integer repid) {
        this.repid = repid;
    }

    public String getRepname() {
        return repname;
    }

    public void setRepname(String repname) {
        this.repname = repname == null ? null : repname.trim();
    }

    public String getRepaddress() {
        return repaddress;
    }

    public void setRepaddress(String repaddress) {
        this.repaddress = repaddress == null ? null : repaddress.trim();
    }

    public String getRepphone() {
        return repphone;
    }

    public void setRepphone(String repphone) {
        this.repphone = repphone == null ? null : repphone.trim();
    }

    public String getRepadmin() {
        return repadmin;
    }

    public void setRepadmin(String repadmin) {
        this.repadmin = repadmin == null ? null : repadmin.trim();
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