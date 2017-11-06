package com.xh.back.bean;

public class Xhareas {
		private int id;
		private int areaid;
		private String area;
		private int cityid;
		private String attribute1;
	    private String attribute2;
	    private String attribute3;
	    
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getAreaid() {
			return areaid;
		}
		public void setAreaid(int areaid) {
			this.areaid = areaid;
		}
		public String getArea() {
			return area;
		}
		public void setArea(String area) {
			this.area = area ;
		}
		public int getCityid() {
			return cityid;
		}
		public void setCityid(int cityid) {
			this.cityid = cityid;
		}
		public String getAttribute1() {
			return attribute1;
		}
		public void setAttribute1(String attribute1) {
			this.attribute1 = attribute1 == null ? null : attribute1.trim();;
		}
		public String getAttribute2() {
			return attribute2;
		}
		public void setAttribute2(String attribute2) {
			this.attribute2 = attribute2== null ? null : attribute2.trim();;
		}
		public String getAttribute3() {
			return attribute3;
		}
		public void setAttribute3(String attribute3) {
			this.attribute3 = attribute3== null ? null : attribute3.trim();;
		}
	    
	    

}
