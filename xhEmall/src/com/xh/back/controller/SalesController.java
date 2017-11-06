package com.xh.back.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.mail.iap.Response;
import com.xh.back.bean.Xhproduct;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

@Controller
@RequestMapping("sales")
public class SalesController {
	@Autowired
	@Qualifier("salesService")
	private SalesService salesService;
	
	//查询非积分商品
	@RequestMapping("queryAllNotIntegralProduct.action")
	public String queryAllNotIntegralProduct(Model model){
		int flag = 0;
		List<Xhproduct> xhproducts = salesService.queryIntegralProduct(flag);
		model.addAttribute("xhproducts", xhproducts);
		return "/jsp/back/sales/salesquery.jsp";		
	}
	
	//查询积分商品
	@RequestMapping("queryAllIntegralProduct.action")
	public String queryAllIntegralProduct(Model model){
		int flag = 1;
		List<Xhproduct> xhproducts = salesService.queryIntegralProduct(flag);
		model.addAttribute("xhproducts", xhproducts);
		return "/jsp/back/sales/salesquery2.jsp";
	}
	
	//查询积分商品（修改）
	@RequestMapping("queryAllIntegralProductUpdate.action")
	public String queryAllIntegralProductUpdate(Model model){
		int flag = 1;
		List<Xhproduct> xhproducts = salesService.queryIntegralProduct(flag);
		model.addAttribute("xhproducts", xhproducts);
		return "/jsp/back/sales/salesqueryupdate.jsp";
	}
			
	//添加积分商品
	@RequestMapping("updateNotIntegralProduct.action")
	public String updateNotIntegralProduct(Integer[] pids){
		
		//String[] pids = request.getParameterValues("integral");
		salesService.updateNotIntegralProduct(pids);
		return "forward:/sales/queryAllNotIntegralProduct.action";
		
	}
	
	//移除积分商品
	@RequestMapping("updateIntegralProduct.action")
	public String updateIntegralProduct(Integer[] pids){
		
		//String[] pids = request.getParameterValues("integral");
		salesService.updateIntegralProduct(pids);
		return "forward:/sales/queryAllIntegralProduct.action";
	}
	
	
	//查询用户积分
	@RequestMapping("queryUsersIntegral.action")
	public String queryUsersIntegral(Model model){	
		List<Xhusers> xhusers = salesService.queryUsersIntegral();
		model.addAttribute("xhusers", xhusers);
		return "/jsp/back/sales/userintegral.jsp";
	}
	
	//修改积分并返回到查询页
	//requestbody用于标注是一个请求的json数据
	@RequestMapping("updateIntegral.action")
	public String updateIntegral(Xhusers user){
		System.out.println("--------------------------------------------------");
		System.out.println(user);
		salesService.updateIntegral(user);
		return "forward:/sales/queryUsersIntegral.action";
	}
	
	//增加积分并返回到查询页
	@RequestMapping("addUserIntegral.action")
	public String addUserIntegral(Xhusers user){
		salesService.addUserIntegral(user);
		return "forward:/sales/queryUsersIntegral.action";
	}
	
	//减少积分并返回到查询页
	@RequestMapping("cutUserIntegral.action")
	public String cutUserIntegral(Xhusers user){
		salesService.cutUserIntegral(user);
		return "forward:/sales/queryUsersIntegral.action";
	}
	
	//根据id查询用户信息（用于模态框）
	@RequestMapping("queryUserById.action")
	@ResponseBody
	public Xhusers queryUserById(int userid){		
		return salesService.queryUserById(userid);
	}
	
	//根据id查询商品信息（用于模态框）
	@RequestMapping("queryProductById.action")
	@ResponseBody
	public Xhproduct queryProductById(int pid){
		return salesService.queryProductById(pid);
	}	
	
}
