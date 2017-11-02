package com.xh.front.service;


import java.util.List;

import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface XhUserService {
	/**
	 * 类型：接口
	 * 功能：增删改查的所有接口
	 * */
//	public void addUser(Xhusers user);
//	public void deleteUserById(int id);
//	public Xhusers queryUserById(int id);
//	public void modifyUserById(XhusersBean user);
//	public List<Xhusers> queryAllUsers();
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
}
