package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;

public interface UserMessageService {
	public List<Xhmessage> queryUserMessage();
	public Xhmessage queryUsermessageById(int id);
	public List<Xhmessage> queryAllMessagelist();
	public Xhmessage queryMessageListById(int id);
	public void addMessageList(Xhmessage message);
	public void deleteMessageListByPrimaryKey(int id);
	public void cleanMessageContext(int id);
	public void cleanMessage(int id);
	public void updateMessageByPrimaryKey(Xhmessage message);	
}
