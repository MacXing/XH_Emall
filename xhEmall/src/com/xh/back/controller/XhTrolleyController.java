package com.xh.back.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xh.back.bean.XhQueryTrolley;
import com.xh.back.bean.Xhtrolley;
import com.xh.back.serviceImpl.XhTrolleyServiceImpl;

@Controller
@RequestMapping("trolley")
public class XhTrolleyController {
	@Autowired
	@Qualifier("xhTrolleyService")
	private XhTrolleyServiceImpl xhTrolleyService;
	
	//查询购物车信息 
	@RequestMapping(value="myTrolley",method={RequestMethod.POST,RequestMethod.GET})
     public String myTrolley(Model model){
    	 List<XhQueryTrolley> allTrolleyItem=xhTrolleyService.TrolleyItem();
    	 model.addAttribute("allTrolleyItem", allTrolleyItem);
    	 System.out.println(allTrolleyItem);
    	 return "/jsp/back/trolley/trolley.jsp";                                                                                                                                                                                                                                                                     
     }
	
	//添加购物车
	@RequestMapping(value="addTrolley")
	public String  addTrolley(Xhtrolley xhtrolley){
		xhTrolleyService.addTrolley(xhtrolley);
		return "/jsp/back/trolley/addtrolley.jsp";
	}
	
	
	//删除购物车
	@RequestMapping("deleteTrolley")
	public String deleteTrolley(int id){
		xhTrolleyService.deleteTrolleyById(id);
		return "forward:/trolley/myTrolley.action";
	}
	
	//批量删除购物车
	@RequestMapping("deleteTrolleyByIds")
	public String deleteTrolleyByIds(HttpServletRequest req){
		String ids=req.getParameter("ids");
		xhTrolleyService.deleteTrolleyByIds(ids);
		return "/jsp/back/trolley/trolley.jsp";
	}
	
	//前端
   
	
}
