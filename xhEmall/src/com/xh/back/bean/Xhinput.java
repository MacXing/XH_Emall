package com.xh.back.bean;

import java.util.Date;

public class Xhinput {
    private Integer inputid;

    private Integer pid;

    private Integer repid;

    private String inputtime;

    private String inputfactory;

    private Integer inputnumber;

    private Double inputprice;

    private String inputaddress;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    private String attribute5;
    
    private Xhrepertory xhrepertory;
    
    private Xhproduct xhproduct;

    public Integer getInputid() {
        return inputid;
    }

    public void setInputid(Integer inputid) {
        this.inputid = inputid;
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

	public String getInputtime() {
		return inputtime;
	}

	public void setInputtime(String inputtime) {
		this.inputtime = inputtime;
	}

	public String getInputfactory() {
		return inputfactory;
	}

	public void setInputfactory(String inputfactory) {
		this.inputfactory = inputfactory;
	}	

    public Integer getInputnumber() {
		return inputnumber;
	}

	public void setInputnumber(Integer inputnumber) {
		this.inputnumber = inputnumber;
	}

	public Double getInputprice() {
        return inputprice;
    }

    public void setInputprice(Double inputprice) {
        this.inputprice = inputprice;
    }

    public String getInputaddress() {
        return inputaddress;
    }

    public void setInputaddress(String inputaddress) {
        this.inputaddress = inputaddress == null ? null : inputaddress.trim();
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

    public String getAttribute5() {
        return attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5 == null ? null : attribute5.trim();
    }    

	public Xhrepertory getXhrepertory() {
		return xhrepertory;
	}

	public void setXhrepertory(Xhrepertory xhrepertory) {
		this.xhrepertory = xhrepertory;
	}

	public Xhproduct getXhproduct() {
		return xhproduct;
	}

	public void setXhproduct(Xhproduct xhproduct) {
		this.xhproduct = xhproduct;
	}

	@Override
	public String toString() {
		return "Xhinput [inputid=" + inputid + ", pid=" + pid + ", repid="
				+ repid + ", inputtime=" + inputtime + ", inputfactory="
				+ inputfactory + ", inputnumber=" + inputnumber
				+ ", inputprice=" + inputprice + ", inputaddress="
				+ inputaddress + ", attribute1=" + attribute1 + ", attribute2="
				+ attribute2 + ", attribute3=" + attribute3 + ", attribute4="
				+ attribute4 + ", attribute5=" + attribute5 + ", xhrepertory="
				+ xhrepertory + ", xhproduct=" + xhproduct + "]";
	}

	
    
    
    
}