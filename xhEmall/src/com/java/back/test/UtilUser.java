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
import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.service.XhUserService;
import com.xh.back.serviceImpl.AdminServiceImpl;
import com.xh.back.serviceImpl.UserGradeServiceImpl;
import com.xh.back.serviceImpl.UserMessageServiceImpl;
import com.xh.back.serviceImpl.XhUserServiceImpl;
import com.xh.front.bean.Xhusers;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilUser {
	@Autowired
	@Qualifier("userService")
	private XhUserService userService;
	
	@Autowired
	@Qualifier("userMessage")
	private UserMessageServiceImpl userMessage;
	
	@Autowired
	@Qualifier("userGrade")
	private UserGradeServiceImpl userGrade;
	
	@Test
	public void test(){//查询等级会员
		List<Xhusers> user=userGrade.queryUserGrade();
		System.out.println(user);
	}

	@Test
	public void test1(){//查询留言会员
		List<Xhmessage> message=userMessage.queryUserMessage();
		System.out.println(message);
	}
	
	@Test
	public void test2(){//根据留言ID查询留言
		Xhmessage message=userMessage.queryUsermessageById(102);
		System.out.println(message);
	}
	
	@Test
	public void test3(){//查询所有留言列表
		List<Xhmessage> message=userMessage.queryAllMessagelist();
		System.out.println(message);
	}
	
	@Test
	public void test4(){//根据留言ID删除留言
		userMessage.deleteMessageListByPrimaryKey(1);
	}
	
	@Test
	public void test5(){//根据留言ID清空留言内容
		userMessage.cleanMessageContext(2);
	}
	
	@Test
	public void test6(){//根据留言ID清空留言
		userMessage.cleanMessage(3);
	}
	
	@Test
	public void test7(){//根据等级ID查询等级
		Xhgrade grade=userGrade.queryGradeListById(2);
		System.out.println(grade);
	}
	
	@Test
	public void test8(){//检查等级存在与否
		int result=userService.checkGrade(2);
		System.out.println(result);
	}
}
