package com.java.back.test;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.xh.back.bean.Xhbrand;
import com.xh.back.serviceImpl.BrandServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilBrand {
	//Brand信息测试
	@Autowired
	@Qualifier("brandService")
	private BrandServiceImpl brandService;
	
	@Test
	public void test(){
		List<Xhbrand> brands = new ArrayList<Xhbrand>();
		brands = brandService.queryAllBrands();
		System.out.println(brands);
		
	}
	
	@Test
	public void test1(){
		Xhbrand brand = new Xhbrand();
		brand.setBrandname("华为");
		brand.setBranddesc("中国公司");
		brandService.insertBrand(brand);
	}
}
