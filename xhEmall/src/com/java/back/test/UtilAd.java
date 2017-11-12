package com.java.back.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.Xhad;
import com.xh.back.bean.XhqueryAd;
import com.xh.back.serviceImpl.AdServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilAd {
	@Autowired
	@Qualifier("adService")
	private AdServiceImpl adService;
	
	@Test
	public void demo1(){
		List<XhqueryAd> ads=new ArrayList<XhqueryAd>();
		ads=adService.queryNotSattueAllAds();
		System.out.print(ads);
		
	}
	
	
	@Test
	public void demo5(){
		XhqueryAd xhqueryAd=new XhqueryAd();
		xhqueryAd=adService.queryadById(2);
		System.out.print(xhqueryAd);
		
	}
	

	
	
	@Test
	public void demo8(){
		
		adService.deleteAd(10);
		
		
	}
	
	
}
