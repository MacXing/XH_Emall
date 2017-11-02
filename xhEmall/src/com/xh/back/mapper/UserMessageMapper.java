package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;

public interface UserMessageMapper {
	/**
	 * 对象：留言会员、留言列表
	 * 操作：留言会员的留言查询，留言列表的留言清空
	 * **/
	public List<Xhmessage> queryUserMessage();
	public Xhmessage querymsgByPrimaryKey(int id);	
	public List<Xhmessage> queryAllMessage();
	public Xhmessage queryMsgByPrimarykey(int id);
	/*public void addGrade(Xhgrade grade);
	public void deleteGradeByPrimaryKey(int id);
	public void updateGradeByPrimaryKey(Xhgrade grade);*/
	
}
