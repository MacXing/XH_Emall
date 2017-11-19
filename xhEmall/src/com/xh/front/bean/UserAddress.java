package com.xh.front.bean;

public class UserAddress {
	
	private int addID;
	
	private int userID;
	
	private String addName;
	
	private String addUserName;
	
	private String addCountry;
	
	private String addProvice;
	
	private String addCity;
	
	private String addDistrict;
	
	private String addAddress;
	
	private String addCode;
	
	private String addPhone;
	
	private int isDefault;
	

	public String getAddCity() {
		return addCity;
	}

	public void setAddCity(String addCity) {
		this.addCity = addCity;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}

	public int getAddID() {
		return addID;
	}

	public void setAddID(int addID) {
		this.addID = addID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	public String getAddUserName() {
		return addUserName;
	}

	public void setAddUserName(String addUserName) {
		this.addUserName = addUserName;
	}

	public String getAddCountry() {
		return addCountry;
	}

	public void setAddCountry(String addCountry) {
		this.addCountry = addCountry;
	}

	public String getAddProvice() {
		return addProvice;
	}

	public void setAddProvice(String addProvice) {
		this.addProvice = addProvice;
	}

	public String getAddDistrict() {
		return addDistrict;
	}

	public void setAddDistrict(String addDistrict) {
		this.addDistrict = addDistrict;
	}

	public String getAddAddress() {
		return addAddress;
	}

	public void setAddAddress(String addAddress) {
		this.addAddress = addAddress;
	}

	public String getAddCode() {
		return addCode;
	}

	public void setAddCode(String addCode) {
		this.addCode = addCode;
	}

	public String getAddPhone() {
		return addPhone;
	}

	public void setAddPhone(String addPhone) {
		this.addPhone = addPhone;
	}

	@Override
	public String toString() {
		return "UserAddress [addID=" + addID + ", userID=" + userID
				+ ", addName=" + addName + ", addUserName=" + addUserName
				+ ", addCountry=" + addCountry + ", addProvice=" + addProvice
				+ ", addCity=" + addCity + ", addDistrict=" + addDistrict
				+ ", addAddress=" + addAddress + ", addCode=" + addCode
				+ ", addPhone=" + addPhone + ", isDefault=" + isDefault + "]";
	}

	
}
