package com.xh.front.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.getip.GetIp;
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhproduct;
import com.xh.back.service.ProductService;
import com.xh.front.bean.Xhusers;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("ProductDetails")
public class ProductDetailsController {
	@Autowired
	@Qualifier("productDetailsService")
	private ProductDetailsService productDetailsService;
	
	@Autowired
	@Qualifier("productService")
	private ProductService productService;
		
	@RequestMapping("queryImagesByPid.action")	
	public String queryImagesByPid(Model model,int pid){
		List<ProductImage> productImages = productDetailsService.queryImagesByPid(pid);
		Xhproduct xhproduct = productService.selectProductById(pid);
		
		model.addAttribute("productImages", productImages);
		model.addAttribute("xhproduct", xhproduct);
		return "/front/product.jsp";			
	}
	
	/*@RequestMapping("queryImagesByPid.action")	
	@ResponseBody
	public List<ProductImage> queryImagesByPid(int pid){
		List<ProductImage> productImages = productDetailsService.queryImagesByPid(pid);		
		return productImages;			
	}*/
	
	
}
