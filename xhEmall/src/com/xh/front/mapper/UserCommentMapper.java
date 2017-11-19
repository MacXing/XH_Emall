package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhmessage;

public interface UserCommentMapper {
	/**
	 * 用户评论管理:增删改查，清空
	 * **/
	public List<Xhcomment> queryAllComment();
	public void insertComment(Xhcomment comment);
	public void deleteCommentById(int id);
	public List<Xhcomment> queryCommentById(int id);
	public void cleanCommentByPrimaryKey(int id);
	public void updateCommentByPrimaryKey(Xhcomment comment);
	public Xhcomment queryCommentByIdForUpdate(int id);
	
	//检查商品ID
	public int checkProductId(int pid);

}
