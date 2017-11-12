package com.xh.back.service;


import java.util.List;

import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface XhUserService {
	/**
	 * 接口
	 * 定义所有增删改查的所有操作
	 * */
	public void addUser(Xhusers user);
	public void deleteUserById(int id);
	public Xhusers queryUserById(int id);
	public void modifyUserById(XhusersBean user);
	public List<Xhusers> queryAllUsers();
	
	public int checkGrade(int id);
}
