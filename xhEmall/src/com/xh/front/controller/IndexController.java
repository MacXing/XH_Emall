package com.xh.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xh.back.bean.Category_Product;
import com.xh.back.bean.Xhcategory;
import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.CategoryServiceImpl;
import com.xh.front.bean.Navbar;
import com.xh.front.serviceImpl.NavbarServiceImpl;

@Controller
@RequestMapping("home")

public class IndexController {
	@Autowired
	@Qualifier("navbarService")
	private NavbarServiceImpl navbarService;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryServiceImpl categoryService;
	
	@RequestMapping("home.action")
	public String home(Model model){
		List<Navbar> navbars = navbarService.queryAllNavbarIsshow();
		List<Xhcategory> categorys = categoryService.categoryList();
		List<Category_Product> CP = categoryService.queryAllCPForHome();
		model.addAttribute("navbars", navbars);
		model.addAttribute("categoryList", categorys);
		model.addAttribute("CP", CP);
		
		return "/front/index.jsp";
	}
	
	@RequestMapping("queryproductsByCategory.action")
	public String queryAll(int catid){
		List<Xhproduct> products = categoryService.queryAllProductByCategory(catid);
		System.out.println(products);
		return "";
	}
	
	@RequestMapping("queryAllProductsByCatid.action")
	public String queryAllProductsByCatid(int catid){
		List<Xhproduct> products = categoryService.queryAllProductsByCatid(catid);
		System.out.println(products);
		return "";
	}
}
