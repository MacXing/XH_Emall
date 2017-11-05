package com.xh.back.bean;

import java.util.Date;

public class Xhproduct {
    private Integer pid;

    private Integer brandid;

    private String pname;

    private Integer pclick;

    private String pdesc;

    private Double pprice;

    private Double psale;

    private String pimg;

    private String pimgdetail;

    private Date paddtime;

    private Date pupdatetime;

    private String psize;

    private String punit;

    private Double pdiscount;

    private int pIntegral;

    private int pisdelete;

    private String attribute3;

    private String attribute4;

	public int getPisdelete() {
		return pisdelete;
	}

	public void setPisdelete(int pisdelete) {
		this.pisdelete = pisdelete;
	}

	private String attribute5;
    
    private Xhbrand brand;
    
    private Xhcategory category;

    public Xhcategory getCategory() {
		return category;
	}

	public void setCategory(Xhcategory category) {
		this.category = category;
	}

	public Xhbrand getBrand() {
		return brand;
	}

	public void setBrand(Xhbrand brand) {
		this.brand = brand;
	}

	public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getBrandid() {
        return brandid;
    }

    public void setBrandid(Integer brandid) {
        this.brandid = brandid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Integer getPclick() {
        return pclick;
    }

    public void setPclick(Integer pclick) {
        this.pclick = pclick;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public Double getPsale() {
        return psale;
    }

    public void setPsale(Double psale) {
        this.psale = psale;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg == null ? null : pimg.trim();
    }

    public String getPimgdetail() {
        return pimgdetail;
    }

    public void setPimgdetail(String pimgdetail) {
        this.pimgdetail = pimgdetail == null ? null : pimgdetail.trim();
    }

    public Date getPaddtime() {
        return paddtime;
    }

    public void setPaddtime(Date paddtime) {
        this.paddtime = paddtime;
    }

    public Date getPupdatetime() {
        return pupdatetime;
    }

    public void setPupdatetime(Date pupdatetime) {
        this.pupdatetime = pupdatetime;
    }

    public String getPsize() {
        return psize;
    }

    public void setPsize(String psize) {
        this.psize = psize == null ? null : psize.trim();
    }

    public String getPunit() {
        return punit;
    }

    public void setPunit(String punit) {
        this.punit = punit == null ? null : punit.trim();
    }

    public Double getPdiscount() {
        return pdiscount;
    }

    public void setPdiscount(Double pdiscount) {
        this.pdiscount = pdiscount;
    }



    public int getpIntegral() {
		return pIntegral;
	}

	public void setpIntegral(int pIntegral) {
		this.pIntegral = pIntegral;
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

	@Override
	public String toString() {
		return "Xhproduct [pid=" + pid + ", brandid=" + brandid + ", pname="
				+ pname + ", pclick=" + pclick + ", pdesc=" + pdesc
				+ ", pprice=" + pprice + ", psale=" + psale + ", pimg=" + pimg
				+ ", pimgdetail=" + pimgdetail + ", paddtime=" + paddtime
				+ ", pupdatetime=" + pupdatetime + ", psize=" + psize
				+ ", punit=" + punit + ", pdiscount=" + pdiscount
				+ ", pIntegral=" + pIntegral + ", pisdelete=" + pisdelete
				+ ", attribute3=" + attribute3 + ", attribute4=" + attribute4
				+ ", attribute5=" + attribute5 + ", brand=" + brand + "]";
	}
}