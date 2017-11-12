package com.xh.back.bean;

import java.util.Date;

public class Xhoutput {
    private Integer outputid;

    private Integer repid;
    
    private Integer repid2;

    private Integer pid;

    private String outputtime;

    private String outputshop;

    private Integer outputnumber;

    private String outputaddress;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    private String attribute5;
    
    private Xhrepertory xhrepertory;
    
    private Xhrepertory xhrepertory2;      
    
    private Xhproduct xhproduct;

    public Integer getOutputid() {
        return outputid;
    }

    public void setOutputid(Integer outputid) {
        this.outputid = outputid;
    }

    public Integer getRepid() {
        return repid;
    }

    public void setRepid(Integer repid) {
        this.repid = repid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }   

    public Integer getRepid2() {
		return repid2;
	}

	public void setRepid2(Integer repid2) {
		this.repid2 = repid2;
	}

	public String getOutputtime() {
		return outputtime;
	}

	public void setOutputtime(String outputtime) {
		this.outputtime = outputtime;
	}

	public String getOutputshop() {
		return outputshop;
	}

	public void setOutputshop(String outputshop) {
		this.outputshop = outputshop;
	}	

    public Integer getOutputnumber() {
		return outputnumber;
	}

	public void setOutputnumber(Integer outputnumber) {
		this.outputnumber = outputnumber;
	}

	public String getOutputaddress() {
        return outputaddress;
    }

    public void setOutputaddress(String outputaddress) {
        this.outputaddress = outputaddress == null ? null : outputaddress.trim();
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

	public Xhrepertory getXhrepertory2() {
		return xhrepertory2;
	}

	public void setXhrepertory2(Xhrepertory xhrepertory2) {
		this.xhrepertory2 = xhrepertory2;
	}

	public Xhproduct getXhproduct() {
		return xhproduct;
	}

	public void setXhproduct(Xhproduct xhproduct) {
		this.xhproduct = xhproduct;
	}

	@Override
	public String toString() {
		return "Xhoutput [outputid=" + outputid + ", repid=" + repid
				+ ", repid2=" + repid2 + ", pid=" + pid + ", outputtime="
				+ outputtime + ", outputshop=" + outputshop + ", outputnumber="
				+ outputnumber + ", outputaddress=" + outputaddress
				+ ", attribute1=" + attribute1 + ", attribute2=" + attribute2
				+ ", attribute3=" + attribute3 + ", attribute4=" + attribute4
				+ ", attribute5=" + attribute5 + ", xhrepertory=" + xhrepertory
				+ ", xhrepertory2=" + xhrepertory2 + ", xhproduct=" + xhproduct
				+ "]";
	}
		
        
}