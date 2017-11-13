package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhcomment;


public interface CommentService {
	/**
	 * 评论的管理
	 * 
	 * */
	public List<Xhcomment> queryAllComment();
	
	public void insertComment(Xhcomment comment);
	
	public void deleteCommentById(int id);
	
	public Xhcomment queryCommentById(int id);
	
}
