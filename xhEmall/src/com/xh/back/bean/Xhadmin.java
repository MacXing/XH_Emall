package com.xh.back.bean;

import java.util.Date;
import java.util.List;

public class Xhadmin {
    private Integer adminid;

    private String adminname;

    private String adminpassword;

    private String adminphone;

    private String adminemail;

    private Date adminlogintime;

    private Date adminlasttime;

    private String adminlastip;
    
    private String adminphoto;
    
    private String admindescribe;

    private String salt;
    
    private Role role;
    
    private List<Role> roles;

    public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getAdminphoto() {
		return adminphoto;
	}

	public void setAdminphoto(String adminphoto) {
		this.adminphoto = adminphoto;
	}

    @Override
	public String toString() {
		return "Xhadmin [adminid=" + adminid + ", adminname=" + adminname
				+ ", adminpassword=" + adminpassword + ", adminphone="
				+ adminphone + ", adminemail=" + adminemail
				+ ", adminlogintime=" + adminlogintime + ", adminlasttime="
				+ adminlasttime + ", adminlastip=" + adminlastip + "]";
	}

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword == null ? null : adminpassword.trim();
    }

    public String getAdminphone() {
        return adminphone;
    }

    public void setAdminphone(String adminphone) {
        this.adminphone = adminphone == null ? null : adminphone.trim();
    }

    public String getAdminemail() {
        return adminemail;
    }

    public void setAdminemail(String adminemail) {
        this.adminemail = adminemail;
    }

    public Date getAdminlogintime() {
        return adminlogintime;
    }

    public void setAdminlogintime(Date adminlogintime) {
        this.adminlogintime = adminlogintime;
    }

    public Date getAdminlasttime() {
        return adminlasttime;
    }

    public void setAdminlasttime(Date adminlasttime) {
        this.adminlasttime = adminlasttime;
    }

    public String getAdminlastip() {
        return adminlastip;
    }

    public void setAdminlastip(String adminlastip) {
        this.adminlastip = adminlastip;
    }

    public String getAdmindescribe() {
        return admindescribe;
    }

    public void setAdmindescribe(String admindescribe) {
        this.admindescribe = admindescribe;
    }

  
}