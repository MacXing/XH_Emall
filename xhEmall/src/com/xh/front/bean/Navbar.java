package com.xh.front.bean;

import java.util.Date;

public class Navbar {
	private int bid;
	private String bname;
	private String url;
	private Date bDate;
	private int isshow;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getIsshow() {
		return isshow;
	}
	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}
	@Override
	public String toString() {
		return "Navbar [bid=" + bid + ", bname=" + bname + ", url=" + url
				+ ", bDate=" + bDate + ", isshow=" + isshow + "]";
	}
	
}
