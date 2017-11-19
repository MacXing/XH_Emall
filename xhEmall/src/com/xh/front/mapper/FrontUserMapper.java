package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface FrontUserMapper {
	/**
	 *用户：会员
	 *操作：查看、更新
	 *属性： userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
           useraddress,userhomephone,userphoto,usermoney
	 **/
	public Xhusers queryUserByPrimaryKey(int id);
	public void updateByPrimaryKeySelective(XhusersBean user);
	
	//用户留言
	public List<Xhmessage> querymsgByPrimaryKey(int id);
	public void cleanMessageByPrimaryKey(int id);
	public void updateMessageByPrimaryKey(Xhmessage message);
	public Xhmessage queryMsgByPrimarykeyForUpdate(int id);
	public void addMessage(Xhmessage message);
	public void deleteMessageByPrimaryKey(int id);
}
