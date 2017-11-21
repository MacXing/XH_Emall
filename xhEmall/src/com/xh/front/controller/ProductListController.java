package com.xh.front.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.getip.GetIp;
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhproduct;
import com.xh.back.service.ProductService;
import com.xh.front.bean.Xhusers;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.ProductListService;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("ProductList")
public class ProductListController {
	@Autowired
	@Qualifier("productListService")
	private ProductListService productListService;				
	
	@RequestMapping("queryAllProductByFind.action")
	public String queryAllProductByFind(Model model,String pname,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="16")Integer pageSize) throws UnsupportedEncodingException{
		
		pname = URLDecoder.decode(pname,"UTF-8");
		
		int count = productListService.queryCount(pname);
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhproduct> xhproducts = productListService.queryAllProductByFind(pname);
		PageInfo pageInfo = new PageInfo(xhproducts,5);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keyword", pname);

		model.addAttribute("count", count);
		return "/front/FindProductList.jsp";
	}
	
	@RequestMapping("queryProductOrderByPsaleDesc.action")
	public String queryProductOrderByPsaleDesc(Model model,String pname,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="12")Integer pageSize) throws UnsupportedEncodingException{
		
		pname = URLDecoder.decode(pname,"UTF-8");
		
		int count = productListService.queryCount(pname);
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhproduct> xhproducts = productListService.queryProductOrderByPsaleDesc(pname);
		PageInfo pageInfo = new PageInfo(xhproducts,5);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keyword", pname);
		model.addAttribute("count", count);
		return "/front/ProductPsaleDesc.jsp";

	}
	
	
}
