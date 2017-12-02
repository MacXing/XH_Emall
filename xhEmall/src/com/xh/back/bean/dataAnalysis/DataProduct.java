package com.xh.back.bean.dataAnalysis;

import java.util.Date;


public class DataProduct {
	private Integer pid;
	private String pname;
	private String salecount;
	private Date ordertime;
	private String pimg;
	
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSalecount() {
		return salecount;
	}
	public void setSalecount(String salecount) {
		this.salecount = salecount;
	}
	@Override
	public String toString() {
		return "DataProduct [pid=" + pid + ", pname=" + pname + ", salecount="
				+ salecount + ", ordertime=" + ordertime + ", pimg=" + pimg
				+ "]"+"\n";
	}
}
