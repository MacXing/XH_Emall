package com.java.back.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.Xhadmin;
import com.xh.back.bean.Xhmessage;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.serviceImpl.AdminServiceImpl;
import com.xh.back.serviceImpl.UserGradeServiceImpl;
import com.xh.back.serviceImpl.UserMessageServiceImpl;
import com.xh.back.serviceImpl.XhUserServiceImpl;
import com.xh.front.bean.Xhusers;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilUser {
	@Autowired
	@Qualifier("userMessage")
	private UserMessageServiceImpl userMessage;
	
	@Autowired
	@Qualifier("userGrade")
	private UserGradeServiceImpl userGrade;
	
	@Test
	public void test(){
		List<Xhusers> user=userGrade.queryUserGrade();
		System.out.println(user);
	}

	@Test
	public void test1(){
		List<Xhmessage> message=userMessage.queryUserMessage();
		System.out.println(message);
	}
	
	@Test
	public void test2(){
		Xhmessage message=userMessage.queryUsermessageById(102);
		System.out.println(message);
	}
	
	@Test
	public void test3(){
		List<Xhmessage> message=userMessage.queryAllMessagelist();
		System.out.println(message);
	}
}
