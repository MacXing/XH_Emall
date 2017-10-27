package com.xh.back.bean;

import java.util.Date;

public class Xhadmin {
    private Integer adminid;

    private String adminname;

    private String adminpassword;

    private String adminphone;

    private String adminemail;

    private Date adminlogintime;

    private Date adminlasttime;

    private String adminlastip;

    @Override
	public String toString() {
		return "Xhadmin [adminid=" + adminid + ", adminname=" + adminname
				+ ", adminpassword=" + adminpassword + ", adminphone="
				+ adminphone + ", adminemail=" + adminemail
				+ ", adminlogintime=" + adminlogintime + ", adminlasttime="
				+ adminlasttime + ", adminlastip=" + adminlastip + "]";
	}

	private String attribute1;

    private String attribute2;

    private String attribute3;

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
        this.adminemail = adminemail == null ? null : adminemail.trim();
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
        this.adminlastip = adminlastip == null ? null : adminlastip.trim();
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1 == null ? null : attribute1.trim();
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
}