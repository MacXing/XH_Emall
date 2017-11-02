package com.xh.front.mapper;


import java.util.List;

import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface XhUserMapper {
	/**
	 * 用户：会员
	 * 功能：增删改查
	 * 属性：userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
     useraddress,userhomephone,userphoto,usermoney
	 * */
//	public void addUser(Xhusers user);
//	public void deleteByPrimaryKey(int id);
//	public Xhusers queryUserByPrimaryKey(int id);
//	public void updateByPrimaryKeySelective(XhusersBean user);
//	public List<Xhusers> queryAllUsers();
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	
	
}
