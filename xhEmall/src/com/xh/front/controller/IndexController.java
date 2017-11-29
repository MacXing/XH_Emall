package com.xh.front.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xh.back.bean.Category_Product;
import com.xh.back.bean.Xhad;
import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhcategory;
import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.AdServiceImpl;
import com.xh.back.serviceImpl.BrandServiceImpl;
import com.xh.back.serviceImpl.CategoryServiceImpl;
import com.xh.back.serviceImpl.ProductServiceImpl;
import com.xh.front.bean.Navbar;
import com.xh.front.serviceImpl.NavbarServiceImpl;

@Controller
@RequestMapping("home")

public class IndexController {
	private Log logger = LogFactory.getLog(this.getClass()); 
	
	@Autowired
	@Qualifier("navbarService")
	private NavbarServiceImpl navbarService;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryServiceImpl categoryService;
	
	@Autowired
	@Qualifier("brandService")
	private BrandServiceImpl brandService;
	
	@Autowired
	@Qualifier("productService")
	private ProductServiceImpl productService;
	
	@Autowired
	@Qualifier("adService")
	private AdServiceImpl adService;
	
	@RequestMapping("home.action")
	public String home(Model model,HttpServletRequest request){
		
		List<Navbar> navbars = navbarService.queryAllNavbarIsshow();
		List<Xhcategory> categorys = categoryService.categoryList();
		List<Category_Product> CP = categoryService.queryAllCPForHome();
		List<Xhbrand> brands = brandService.queryAllBrands();
		List<Xhad> ads = adService.queryAllAdsList();
		ServletContext application=request.getServletContext();
		
		application.setAttribute("navbars", navbars);
		application.setAttribute("categoryList", categorys);
		application.setAttribute("CP", CP);
		application.setAttribute("brands", brands);
		application.setAttribute("ads", ads);
		application.setAttribute("init", 1);
		return "/front/index.jsp";
	}
	
	@RequestMapping("queryproductsByCategory.action")
	public String queryAll(int catid,Model model, 
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="16")Integer pageSize) throws UnsupportedEncodingException{
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhproduct> products = categoryService.queryAllProductByCategory(catid);
		PageInfo pageInfo = new PageInfo(products,5);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("catid", catid);
		return "/front/productlist.jsp";
	}
	
	@RequestMapping("queryAllProductsByCatid.action")
	public String queryAllProductsByCatid(int catid,Model model, 
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="16")Integer pageSize) throws UnsupportedEncodingException{
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhproduct> products = categoryService.queryAllProductsByCatid(catid);
		PageInfo pageInfo = new PageInfo(products,5);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("catid", catid);
		return "/front/productlistByCatid.jsp";
	}
	
	@RequestMapping("head.action")
	public String head(Model model){
		List<Navbar> navbars = navbarService.queryAllNavbarIsshow();
		List<Xhcategory> categorys = categoryService.categoryList();
		List<Category_Product> CP = categoryService.queryAllCPForHome();
		model.addAttribute("navbars", navbars);
		model.addAttribute("categoryList", categorys);
		model.addAttribute("CP", CP);
		
		return "/front/head.jsp";
	}
	
	@RequestMapping("queryProductsByBrand.action")
	public String queryProductsByBrand(Model model,int brandid, 
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="16")Integer pageSize) throws UnsupportedEncodingException{
		
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhproduct> products = productService.queryProductByBrandid(brandid);
		PageInfo pageInfo = new PageInfo(products,5);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("brandid", brandid);
		return "/front/productlistByBrandid.jsp";
		
	}
	
	
}
