package com.java.back.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.Xhcomment;
import com.xh.back.serviceImpl.CommentServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")

public class UtilComment {
	@Autowired
	@Qualifier("commentService")
	private CommentServiceImpl commentService;
	
	@Test
	public void test(){
		List<Xhcomment> comments = commentService.queryAllComment();
		System.out.println(comments.toString());
	}
	
}
