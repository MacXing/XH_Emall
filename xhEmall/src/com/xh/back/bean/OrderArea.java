package com.xh.back.bean;

public class OrderArea {
	private int id;
	private String areaid;
	private String area;
	private String cityid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAreaid() {
		return areaid;
	}
	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCityid() {
		return cityid;
	}
	public void setCityid(String cityid) {
		this.cityid = cityid;
	}
	@Override
	public String toString() {
		return "OrderArea [id=" + id + ", areaid=" + areaid + ", area=" + area
				+ ", cityid=" + cityid + "]"+"\n";
	}
	
}
