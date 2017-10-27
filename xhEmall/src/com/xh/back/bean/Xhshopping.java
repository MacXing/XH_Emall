package com.xh.back.bean;

public class Xhshopping {
    private Integer shoppingid;

    private String shoppingcode;

    private String shoppingname;

    private String shoppingdesc;

    private Integer enable;

    private String shoppingimg;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    public Integer getShoppingid() {
        return shoppingid;
    }

    public void setShoppingid(Integer shoppingid) {
        this.shoppingid = shoppingid;
    }

    public String getShoppingcode() {
        return shoppingcode;
    }

    public void setShoppingcode(String shoppingcode) {
        this.shoppingcode = shoppingcode == null ? null : shoppingcode.trim();
    }

    public String getShoppingname() {
        return shoppingname;
    }

    public void setShoppingname(String shoppingname) {
        this.shoppingname = shoppingname == null ? null : shoppingname.trim();
    }

    public String getShoppingdesc() {
        return shoppingdesc;
    }

    public void setShoppingdesc(String shoppingdesc) {
        this.shoppingdesc = shoppingdesc == null ? null : shoppingdesc.trim();
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public String getShoppingimg() {
        return shoppingimg;
    }

    public void setShoppingimg(String shoppingimg) {
        this.shoppingimg = shoppingimg == null ? null : shoppingimg.trim();
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