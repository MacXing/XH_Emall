package com.xh.back.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.ProductServiceImpl;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	@Qualifier("productService")
	private ProductServiceImpl productService;
	
	@RequestMapping("queryAllProducts.action")
	
	public String queryAllProudcts(Model model){
		List<Xhproduct> products = new ArrayList<Xhproduct>();
		products=productService.selectAllProducts();
		model.addAttribute("products", products);
		return "/jsp/back/product/queryAllProducts.jsp";
	}
	
	@RequestMapping("delectProduct.action")
	public String deleteProduct(Model model,int id){
		productService.deleteProductById(id);
		return "/product/queryAllProducts.action";
	}
	
	@ResponseBody
	@RequestMapping("queryProductById.action")
	public Xhproduct queryProductById(int id){
		Xhproduct product = productService.selectProductById(id);
		return product;
	}
}
