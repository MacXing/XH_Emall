package com.xh.back.bean;

public class Role {
	private int id;
	private String rolename;
	private String permission;
	
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", rolename=" + rolename + ", permission="
				+ permission + "]";
	}
	
}
