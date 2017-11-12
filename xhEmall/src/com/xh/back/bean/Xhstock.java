package com.xh.back.bean;

public class Xhstock {
    private Integer stoid;

    private Integer pid;

    private Integer repid;

    //private String pname;

    //private String pdesc;

    private Integer stonumber;
    
    private Xhproduct xhproduct;
    
   // private Xhrepertory xhrepertory;

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

	public Integer getStonumber() {
        return stonumber;
    }

    public void setStonumber(Integer stonumber) {
        this.stonumber = stonumber;
    }

	public Xhproduct getXhproduct() {
		return xhproduct;
	}

	public void setXhproduct(Xhproduct xhproduct) {
		this.xhproduct = xhproduct;
	}

	@Override
	public String toString() {
		return "Xhstock [stoid=" + stoid + ", pid=" + pid + ", repid=" + repid
				+ ", stonumber=" + stonumber + ", xhproduct=" + xhproduct + "]";
	}
	
    
    
}