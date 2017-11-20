package com.xh.front.bean;

import java.util.Date;

import com.xh.back.bean.Xhproduct;

public class UserCollection {
	private Integer collectid;
	private Integer userid;
	private Integer pid;
	private Date collecttime;
	private Date deletetime;
	private Xhusers users;
	private Xhproduct product;
	
	
	public Xhusers getUsers() {
		return users;
	}
	public void setUsers(Xhusers users) {
		this.users = users;
	}
	public Xhproduct getProduct() {
		return product;
	}
	public void setProduct(Xhproduct product) {
		this.product = product;
	}
	public Integer getCollectid() {
		return collectid;
	}
	public void setCollectid(Integer collectid) {
		this.collectid = collectid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Date getCollecttime() {
		return collecttime;
	}
	public void setCollecttime(Date collecttime) {
		this.collecttime = collecttime;
	}
	public Date getDeletetime() {
		return deletetime;
	}
	public void setDeletetime(Date deletetime) {
		this.deletetime = deletetime;
	}
	@Override
	public String toString() {
		return "UserCollection [collectid=" + collectid + ", userid=" + userid
				+ ", pid=" + pid + ", collecttime=" + collecttime
				+ ", deletetime=" + deletetime + ", users=" + users
				+ ", product=" + product + "]"+"\n";
	}
	
}
