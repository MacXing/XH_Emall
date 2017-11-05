package com.xh.back.bean;

import java.util.Date;

import org.apache.log4j.helpers.DateTimeDateFormat;

import com.xh.front.bean.Xhusers;

public class Xhmessage {
    private Integer msgid;

    private Integer userid;

    private String msgtxt;
    
    private Xhusers users;

    public Xhusers getUsers() {
		return users;
	}

	public void setUsers(Xhusers users) {
		this.users = users;
	}

	private Date msginittime;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    private String attribute4;

    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getMsgtxt() {
        return msgtxt;
    }

    public void setMsgtxt(String msgtxt) {
        this.msgtxt = msgtxt == null ? null : msgtxt.trim();
    }

    public Date getMsginittime() {
        return msginittime;
    }

    public void setMsginittime(Date dateTimeDateFormat) {
        this.msginittime = dateTimeDateFormat;
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

    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4 == null ? null : attribute4.trim();
    }

	@Override
	public String toString() {
		return "Xhmessage [msgid=" + msgid + ", userid=" + userid + ", msgtxt="
				+ msgtxt  + ", msginittime=" + msginittime+ ", users=" + users
				+ ", attribute1=" + attribute1 + ", attribute2=" + attribute2
				+ ", attribute3=" + attribute3 + ", attribute4=" + attribute4
				+ "]"+"\n";
	}
    
    
}