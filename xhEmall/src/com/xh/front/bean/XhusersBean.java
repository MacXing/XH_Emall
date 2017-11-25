package com.xh.front.bean;

/***
 *日期格式转换
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
				+ getUsermoney() + "]";
	}
	
	
	
}
