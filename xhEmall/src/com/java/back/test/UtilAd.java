package com.java.back.test;

import java.util.ArrayList;
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
		Xhad ad=adService.queryadById(2);
		System.out.print(ad);
		
	}
	

	
	
	@Test
	public void demo8(){
		
		adService.deleteAd(10);
		
		
	}
	
	
}
