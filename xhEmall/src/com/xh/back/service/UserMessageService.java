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
	/*public void addGradeList(Xhgrade grade);
	public void deleteGradeListByPrimaryKey(int id);
	public void updateGradeListByPrimaryKey(Xhgrade grade);
	*/
}
