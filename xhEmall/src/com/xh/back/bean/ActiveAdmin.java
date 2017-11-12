package com.xh.back.bean;

public class ActiveAdmin implements java.io.Serializable{
	private int id;
	private String adminname;
	private String adminpassword;
	private String adminphoto;
	private String rolename;
	
	
	public String getAdminphoto() {
		return adminphoto;
	}

	public void setAdminphoto(String adminphoto) {
		this.adminphoto = adminphoto;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	@Override
	public String toString() {
		return "ActiveAdmin [id=" + id + ", adminname=" + adminname
				+ ", adminpassword=" + adminpassword + ", adminphoto="
				+ adminphoto + ", rolename=" + rolename + "]";
	}
	
}
