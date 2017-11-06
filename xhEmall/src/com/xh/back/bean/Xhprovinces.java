package com.xh.back.bean;

import java.util.List;

public class Xhprovinces {
	private int id;
	private int provinceid;
	private String province;
	
	private List<Xhcities> cities;
	
	
	public List<Xhcities> getCities() {
		return cities;
	}
	public void setCities(List<Xhcities> cities) {
		this.cities = cities;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(int provinceid) {
		this.provinceid = provinceid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	
}
