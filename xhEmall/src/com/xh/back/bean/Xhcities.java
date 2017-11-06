package com.xh.back.bean;

import java.util.List;

public class Xhcities {
		private int id;
		private int cityid;
		private String city;
		private List<Xhareas> areass;
		
		public List<Xhareas> getAreass() {
			return areass;
		}
		public void setAreass(List<Xhareas> areass) {
			this.areass = areass;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getCityid() {
			return cityid;
		}
		public void setCityid(int cityid) {
			this.cityid = cityid;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		
}
