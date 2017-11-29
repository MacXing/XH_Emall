package com.xh.back.bean.dataAnalysis;

public class DataGrade {
	private Integer guid;
	private String gradename;
	private String province;
	private Integer gradecount;
	private Integer usercount;
	
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Integer getUsercount() {
		return usercount;
	}
	public void setUsercount(Integer usercount) {
		this.usercount = usercount;
	}
	public Integer getGuid() {
		return guid;
	}
	public void setGuid(Integer guid) {
		this.guid = guid;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public Integer getGradecount() {
		return gradecount;
	}
	public void setGradecount(Integer gradecount) {
		this.gradecount = gradecount;
	}
	@Override
	public String toString() {
		return "DataGrade [guid=" + guid + ", gradename=" + gradename
				+ ", province=" + province + ", gradecount=" + gradecount
				+ ", usercount=" + usercount + "]"+"\n";
	}
}
