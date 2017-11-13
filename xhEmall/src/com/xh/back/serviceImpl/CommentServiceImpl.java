package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhcomment;
import com.xh.back.mapper.BrandMapper;
import com.xh.back.mapper.CommentMapper;
import com.xh.back.service.BrandService;
import com.xh.back.service.CommentService;
/**
 * 
 * 
 * */
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	@Qualifier("commentMapper")
	private CommentMapper commentMapper;

	@Override
	public List<Xhcomment> queryAllComment() {
		
		return commentMapper.queryAllComment();
	}

	@Override
	public void insertComment(Xhcomment comment) {
		commentMapper.insertComment(comment);
	}

	@Override
	public void deleteCommentById(int id) {
		commentMapper.deleteCommentById(id);
		
	}

	@Override
	public Xhcomment queryCommentById(int id) {
		
		return commentMapper.queryCommentById(id);
	}



}
