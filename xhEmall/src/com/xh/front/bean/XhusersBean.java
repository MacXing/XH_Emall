package com.xh.front.bean;

/***
 * 日期格式的转换
 * */
public class XhusersBean extends Xhusers{
	private String formatDateString; //yyyy-MM-dd

	public String getFormatDateString() {
		return formatDateString;
	}

	public void setFormatDateString(String formatDateString) {
		this.formatDateString = formatDateString;
	}

	@Override
	public String toString() {
		return "XhusersBean [formatDateString=" + formatDateString
				+ ", getUserid()=" + getUserid() + ", getGradeid()="
				+ getGradeid() + ", getUsername()=" + getUsername()
				+ ", getUserpassword()=" + getUserpassword()
				+ ", getUsersex()=" + getUsersex() + ", getUserbirthday()="
				+ getUserbirthday() + ", getUserphone()=" + getUserphone()
				+ ", getUseremail()=" + getUseremail() + ", getUseraddress()="
				+ getUseraddress() + ", getUserlogintime()="
				+ getUserlogintime() + ", getUserlasttime()="
				+ getUserlasttime() + ", getUserlastip()=" + getUserlastip()
				+ ", getUservisitcount()=" + getUservisitcount()
				+ ", getUserhomephone()=" + getUserhomephone()
				+ ", getUserphoto()=" + getUserphoto() + ", getUsermoney()="
				+ getUsermoney() + ", getAttribute1()=" + getAttribute1()
				+ ", getAttribute2()=" + getAttribute2() + ", getAttribute3()="
				+ getAttribute3() + ", getAttribute4()=" + getAttribute4()
				+ ", getAttribute5()=" + getAttribute5() + ", getAttribute6()="
				+ getAttribute6() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
	
	
	
}
