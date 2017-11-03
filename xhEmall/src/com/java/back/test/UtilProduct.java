package com.java.back.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.Xhproduct;
import com.xh.back.mapper.ProductMapper;
import com.xh.back.serviceImpl.ProductServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilProduct {
	//查找admin信息测试
	@Autowired
	@Qualifier("productService")
	private ProductServiceImpl productService;
	
	@Test
	public void test(){
		Xhproduct product = new Xhproduct();
		product.setPname("电脑");
		product.setPdesc("Mac");
		product.setPprice(9998.0);
		product.setPsale(8999.9);
		product.setPimg("");
		product.setPimgdetail("");
		product.setPaddtime(new Date());
		product.setPsize("50");
		product.setPunit("g");
		product.setPdiscount(1.0);
		System.out.println("----------------------------------");
		System.out.println(product);
		//productService.insertProduct(product);
	}
	
	@Test
	public void test2(){
		Xhproduct product = new Xhproduct();
		product=productService.selectProductById(25);
		//product=productMapper.selectProductById(25);
		System.out.println(product);
		//System.out.println(productService.selectAllProducts());
	}
	
	@Test
	public void test3(){
		productService.deleteProductById(3);
	}
	
	@Test
	public void test4(){
		Xhproduct product = new Xhproduct();
		product=productService.selectProductByNameLike("手");
		System.out.println(product);
	}
	
	@Test
	public void test5(){
		
		List<Xhproduct> products = productService.selectAllProducts(0);
		System.out.println(products);
	}
	
}
