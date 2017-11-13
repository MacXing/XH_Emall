package com.xh.back.mapper;

import java.util.List;
import com.xh.back.bean.Xhcomment;

public interface CommentMapper {
	/**
	 * 商品评论管理
	 * **/
	public List<Xhcomment> queryAllComment();
	
	public void insertCommentAndFile(Xhcomment comment);

	public void insertComment(Xhcomment comment);
	
	public void deleteCommentById(int id);
	
	public Xhcomment queryCommentById(int id);

}
