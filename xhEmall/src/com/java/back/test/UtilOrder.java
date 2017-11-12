package com.java.back.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhadmin;
import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.serviceImpl.AdminServiceImpl;
import com.xh.back.serviceImpl.OrderServiceImpl;
import com.xh.back.serviceImpl.UserGradeServiceImpl;
import com.xh.back.serviceImpl.UserMessageServiceImpl;
import com.xh.back.serviceImpl.XhUserServiceImpl;
import com.xh.front.bean.Xhusers;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilOrder {
	@Autowired
	@Qualifier("orderService")
	private OrderServiceImpl orderService;
	
	@Test
	public void test(){//查询省份对应的城市
		List<OrderCity> cityList=orderService.getCityByProvinceId("110000");
		System.out.println(cityList);
	}

	@Test
	public void test1(){//查询城市对应的地区
		List<OrderArea> areaList=orderService.getAreaByCityId("110100");
		System.out.println(areaList);
	}
	
	@Test
	public void test2(){//查询所有省份
		List<OrderProvince> provinceList=orderService.getAllProvince();
		System.out.println(provinceList);
	}
	
	@Test
	public void test3(){//查询省份所属id所对应的省名
		String provinceName=orderService.getProvinceName("210000");
		System.out.println(provinceName);
	}
	
	@Test
	public void test4(){//查询发货状态确定发货时间
		List<Xhorderinfo> sendList=orderService.getSendOrder(1);
		System.out.println(sendList);
	}
	
	@Test
	public void test5(){//查询发货状态确定发货时间
		int usersNumble=orderService.checkUser(120);
		System.out.println(usersNumble);
	}
}
