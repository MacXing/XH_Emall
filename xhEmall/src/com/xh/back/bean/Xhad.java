package com.xh.back.bean;

import java.util.Date;

public class Xhad {
    private Integer adid;

    private String adname;

    private Integer positionid;

    private String adtxt;

    private String adlink;

    private Date adtime;
    
    private String adimg;
    
    private Date adstarttime;
    
    private Date adendtime;
    
    private String adclick;
    
    private  Integer adsort;
    
    private int adstatue;

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

    

    public Integer getPositionid() {
		return positionid;
	}

	public void setPositionid(Integer positionid) {
		this.positionid = positionid;
	}
	
	public int getAdstatue() {
		return adstatue;
	}

	public void setAdstatue(int adstatue) {
		this.adstatue = adstatue;
	}

	public String getAdimg() {
		return adimg;
	}

	public void setAdimg(String adimg) {
		this.adimg = adimg;
	}

	public Date getAdstarttime() {
		return adstarttime;
	}

	public void setAdstarttime(Date adstarttime) {
		this.adstarttime = adstarttime;
	}

	public Date getAdendtime() {
		return adendtime;
	}

	public void setAdendtime(Date adendtime) {
		this.adendtime = adendtime;
	}

	public String getAdclick() {
		return adclick;
	}

	public void setAdclick(String adclick) {
		this.adclick = adclick;
	}

	public Integer getAdsort() {
		return adsort;
	}

	public void setAdsort(Integer adsort) {
		this.adsort = adsort;
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

	@Override
	public String toString() {
		return "Xhad [adid=" + adid + ", adname=" + adname + ", positionid="
				+ positionid + ", adtxt=" + adtxt + ", adlink=" + adlink
				+ ", adtime=" + adtime + ", adimg=" + adimg + ", adstarttime="
				+ adstarttime + ", adendtime=" + adendtime + ", adclick="
				+ adclick + ", adsort=" + adsort + ", adstatue=" + adstatue
				+ ", attribute1=" + attribute1 + ", attribute2=" + attribute2
				+ ", attribute3=" + attribute3 + "]";
	}


}