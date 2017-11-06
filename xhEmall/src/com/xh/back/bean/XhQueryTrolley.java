package com.xh.back.bean;



import com.xh.front.bean.Xhusers;

public class XhQueryTrolley extends Xhtrolley {
      private Xhusers xhusers;
      private Xhproduct  xhproduct;
    
	public Xhusers getXhusers() {
		return xhusers;
	}
	public void setXhusers(Xhusers xhusers) {
		this.xhusers = xhusers;
	}
	public Xhproduct getXhproduct() {
		return xhproduct;
	}
	public void setXhproduct(Xhproduct xhproduct) {
		this.xhproduct = xhproduct;
	}       
}
