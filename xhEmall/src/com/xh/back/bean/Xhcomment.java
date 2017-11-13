package com.xh.back.bean;

import java.util.Date;

import com.xh.front.bean.Xhusers;

public class Xhcomment {
    private Integer commentid;

    private Integer userid;

    private Integer pid;

	private Date commenttime;

    private String commenttxt;

    private Integer commentservice;

    private Integer commentshopping;

    private Integer commentgoods;

    private String commentimg;
    
    private Xhusers users;
    
    private Xhproduct product;

    private String attribute1;

    private String attribute2;

    private String attribute3;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }
    
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

	public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getCommenttxt() {
        return commenttxt;
    }

    public void setCommenttxt(String commenttxt) {
        this.commenttxt = commenttxt == null ? null : commenttxt.trim();
    }

    public Integer getCommentservice() {
        return commentservice;
    }

    public void setCommentservice(Integer commentservice) {
        this.commentservice = commentservice;
    }

    public Integer getCommentshopping() {
        return commentshopping;
    }

    public void setCommentshopping(Integer commentshopping) {
        this.commentshopping = commentshopping;
    }

    public Integer getCommentgoods() {
		return commentgoods;
	}

	public void setCommentgoods(Integer commentgoods) {
		this.commentgoods = commentgoods;
	}

	public String getCommentimg() {
        return commentimg;
    }

    public void setCommentimg(String commentimg) {
        this.commentimg = commentimg == null ? null : commentimg.trim();
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
    
    public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Date getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(Date commenttime) {
		this.commenttime = commenttime;
	}

	
}