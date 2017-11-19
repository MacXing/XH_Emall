package com.xh.front.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xh.front.bean.UserAddress;

public interface FrontOrderMapper {
	
	//addID, userID, addName, addUserName, addCountry, addProvice, addCity,
	//addDistrict, addAddress, addCode, addPhone
	
	//添加收货地址
	public int addAddress(UserAddress address);
	
	//根据用户ID查询用户收货地址
	public List<UserAddress> queryAddressById(int userid);
	
	//根据地址ID删除收货地址
	public int deleteAddressById(int addID);
	
	//更新收货地址
	public int updateAddressById(UserAddress address);
	
	//修改原来默地址
	public int updateDefaultFormerById(@Param("addID")int addID, @Param("userID")int userID);
	
	//设置默认地址
	public int updateDefaultById(@Param("addID")int addID, @Param("userID")int userID);
	
	//根据ID查询地址
	public UserAddress queryAddInfoById(int addID);
	
}
