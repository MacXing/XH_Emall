package com.xh.back.bean;

public class Admin_Role {
	private int id;
	private int adminid;
	private int roleid;
	private Role role;
	private Xhadmin admin;
	
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Xhadmin getAdmin() {
		return admin;
	}
	public void setAdmin(Xhadmin admin) {
		this.admin = admin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	@Override
	public String toString() {
		return "Admin_Role [id=" + id + ", adminid=" + adminid + ", roleid="
				+ roleid + ", role=" + role + ", admin=" + admin + "]";
	}
	
}
