package com.xh.back.bean.dataAnalysis;


public class DataOrder {
	private Integer doid;
	private Integer shoppingid;
	private String province;
	private String shoppingname;
	private Integer orderCount;
	private Integer expcount;
	
	
	public Integer getShoppingid() {
		return shoppingid;
	}
	public void setShoppingid(Integer shoppingid) {
		this.shoppingid = shoppingid;
	}
	public String getShoppingname() {
		return shoppingname;
	}
	public void setShoppingname(String shoppingname) {
		this.shoppingname = shoppingname;
	}
	public Integer getExpcount() {
		return expcount;
	}
	public void setExpcount(Integer expcount) {
		this.expcount = expcount;
	}
	public Integer getDoid() {
		return doid;
	}
	public void setDoid(Integer doid) {
		this.doid = doid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Integer getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
	@Override
	public String toString() {
		return "DataOrder [doid=" + doid + ", shoppingid=" + shoppingid
				+ ", province=" + province + ", shoppingname=" + shoppingname
				+ ", orderCount=" + orderCount + ", expcount=" + expcount + "]"+"\n";
	}
	
}
