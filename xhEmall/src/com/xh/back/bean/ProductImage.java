package com.xh.back.bean;

public class ProductImage {
	private int picid;
	private int pid;
	private String url;
	private String pname;
	private Xhproduct product;
	
	public int getPicid() {
		return picid;
	}
	public void setPicid(int picid) {
		this.picid = picid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public Xhproduct getProduct() {
		return product;
	}
	public void setProduct(Xhproduct product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "ProductImage [picid=" + picid + ", pid=" + pid + ", url=" + url
				+ ", pname=" + pname + ", product=" + product + "]";
	}
	
}
