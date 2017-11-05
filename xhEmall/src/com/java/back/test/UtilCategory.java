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
import com.xh.back.bean.Xhcategory;
import com.xh.back.bean.Xhmessage;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.serviceImpl.AdminServiceImpl;
import com.xh.back.serviceImpl.CategoryServiceImpl;
import com.xh.back.serviceImpl.UserGradeServiceImpl;
import com.xh.back.serviceImpl.UserMessageServiceImpl;
import com.xh.back.serviceImpl.XhUserServiceImpl;
import com.xh.front.bean.Xhusers;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")

public class UtilCategory {
	@Autowired
	@Qualifier("categoryService")
	private CategoryServiceImpl categoryService;
	

	@Test
	public void test(){
		List<List<Xhcategory>> categorys  = categoryService.queryAllCategory();
		System.out.println(categorys);
	}	
}
