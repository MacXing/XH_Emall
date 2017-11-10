package com.xh.back.mapper;

import java.util.List;

import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface UserMapper {
	/**
	 *用户：会员
	 *操作：增删改查
	 *属性：userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
     useraddress,userhomephone,userphoto,usermoney
	 * */
	public void addUser(Xhusers user);
	public void deleteByPrimaryKey(int id);
	public Xhusers queryUserByPrimaryKey(int id);
	public void updateByPrimaryKeySelective(XhusersBean user);
	public List<Xhusers> queryAllUsers();
	
	//检查等级是否存在
	public int checkGrade(int id);
}
