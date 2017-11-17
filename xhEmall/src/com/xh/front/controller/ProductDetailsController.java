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
	public String queryImagesByPid(Model model,int pid,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="3")Integer pageSize){
		List<ProductImage> productImages = productDetailsService.queryImagesByPid(pid);
		Xhproduct xhproduct = productService.selectProductById(pid);
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhcomment> xhcomments = productDetailsService.queryCommentByPid(pid);
		PageInfo pageInfo = new PageInfo(xhcomments,5);
		
		model.addAttribute("productImages", productImages);
		model.addAttribute("xhproduct", xhproduct);
		model.addAttribute("pageInfo", pageInfo);
		return "/front/product.jsp";			
	}
	
	/*@RequestMapping("queryCommentByPid.action")	
	@ResponseBody
	public List<Xhcomment> queryCommentByPid(int pid){
		List<Xhcomment> xhcomments = productDetailsService.queryCommentByPid(pid);		
		return xhcomments;			
	}*/
	
	
}
