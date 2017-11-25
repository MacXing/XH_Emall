package com.xh.front.service;


import java.util.List;

import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface FrontUserService {
	
	public Xhusers queryUserById(int id);
	public void modifyUserById(XhusersBean user);
	//用户留言
	public List<Xhmessage> querymsgByPrimaryKey(int id);
	public void cleanMessageByPrimaryKey(int id);
	public void updateMessageByPrimaryKey(Xhmessage message);
	public Xhmessage queryMsgByPrimarykey(int id);
	public void addMessage(Xhmessage message);
	public void deleteMessageByPrimaryKey(int id);
	
	public String getProvinceName(String id);
}
