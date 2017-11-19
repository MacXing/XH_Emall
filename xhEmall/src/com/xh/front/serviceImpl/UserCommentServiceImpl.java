package com.xh.front.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhmessage;
import com.xh.back.mapper.BrandMapper;
import com.xh.back.mapper.CommentMapper;
import com.xh.back.service.BrandService;
import com.xh.back.service.CommentService;
import com.xh.front.mapper.UserCommentMapper;
import com.xh.front.service.UserCommentService;
/**
 * 
 * 
 * */
public class UserCommentServiceImpl implements UserCommentService{
	
	@Autowired
	@Qualifier("userCommentMapper")
	private UserCommentMapper userCommentMapper;

	@Override
	public List<Xhcomment> queryAllComment() {
		
		return userCommentMapper.queryAllComment();
	}

	@Override
	public void insertComment(Xhcomment comment) {
		userCommentMapper.insertComment(comment);
	}

	@Override
	public void deleteCommentById(int id) {
		userCommentMapper.deleteCommentById(id);
		
	}

	@Override
	public List<Xhcomment> queryCommentById(int id) {
		List<Xhcomment> comments=userCommentMapper.queryCommentById(id);
		return comments;
	}

	@Override
	public void cleanCommentByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		userCommentMapper.cleanCommentByPrimaryKey(id);
	}

	@Override
	public void updateCommentByPrimaryKey(Xhcomment comment) {
		// TODO Auto-generated method stub
		userCommentMapper.updateCommentByPrimaryKey(comment);
	}

	@Override
	public Xhcomment queryCommentByIdForUpdate(int id) {
		// TODO Auto-generated method stub
		Xhcomment comment=userCommentMapper.queryCommentByIdForUpdate(id);
		return comment;
	}

	@Override
	public int checkProductId(int id) {
		// TODO Auto-generated method stub
		return userCommentMapper.checkProductId(id);
	}


}
