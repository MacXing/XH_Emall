package com.xh.back.bean;

public class Xhbrand {

	private Integer brandid;

    private String brandname;

    private String branddesc;

    private String image;

    private String attribute2;

    private String attribute3;

    public Integer getBrandid() {
        return brandid;
    }

    public void setBrandid(Integer brandid) {
        this.brandid = brandid;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname == null ? null : brandname.trim();
    }

    public String getBranddesc() {
        return branddesc;
    }

    public void setBranddesc(String branddesc) {
        this.branddesc = branddesc == null ? null : branddesc.trim();
    }

    
    public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
		return "Xhbrand [brandid=" + brandid + ", brandname=" + brandname
				+ ", branddesc=" + branddesc + ", image=" + image
				+ ", attribute2=" + attribute2 + ", attribute3=" + attribute3
				+ "]";
	}
 
}