package com.xh.back.bean;

import java.math.BigDecimal;

import com.xh.front.bean.Xhusers;

public class Xhtrolley {
	private Xhproduct xhproduct;
	
	private Xhusers xhusers;
	
    private Integer troid;

    private Integer pid;

    private Integer userid;

    private Integer tronum;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    private String attribute5;

    private String attribute6;
    
    public Double getSubTotal(){
    	BigDecimal b1=new BigDecimal(xhproduct.getPsale()+"");
    	BigDecimal b2=new BigDecimal(tronum); 
    	BigDecimal b3=b1.multiply(b2);
    	return b3.doubleValue();
    }

    public Xhproduct getXhproduct() {
		return xhproduct;
	}

	public void setXhproduct(Xhproduct xhproduct) {
		this.xhproduct = xhproduct;
	}

	public Xhusers getXhusers() {
		return xhusers;
	}

	public void setXhusers(Xhusers xhusers) {
		this.xhusers = xhusers;
	}

	public Integer getTroid() {
        return troid;
    }

    public void setTroid(Integer troid) {
        this.troid = troid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getTronum() {
        return tronum;
    }

    public void setTronum(Integer tronum) {
        this.tronum = tronum;
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

    public String getAttribute6() {
        return attribute6;
    }

    public void setAttribute6(String attribute6) {
        this.attribute6 = attribute6 == null ? null : attribute6.trim();
    }

	@Override
	public String toString() {
		return "Xhtrolley [xhproduct=" + xhproduct + ", xhusers=" + xhusers
				+ ", troid=" + troid + ", pid=" + pid + ", userid=" + userid
				+ ", tronum=" + tronum + ", attribute1=" + attribute1
				+ ", attribute2=" + attribute2 + ", attribute3=" + attribute3
				+ ", attribute4=" + attribute4 + ", attribute5=" + attribute5
				+ ", attribute6=" + attribute6 + "]";
	}
    
    
}