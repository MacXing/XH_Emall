package com.xh.back.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.back.bean.Xhshopping;
import com.xh.back.bean.Xhtrolley;
import com.xh.back.service.ExpressService;
import com.xh.back.serviceImpl.XhTrolleyServiceImpl;
import com.xh.front.bean.UserAddress;
import com.xh.front.bean.Xhusers;
import com.xh.front.serviceImpl.UserAddressServiceImpl;

@Controller
@RequestMapping("trolley")
public class XhTrolleyController {
	@Autowired
	@Qualifier("xhTrolleyService")
	private XhTrolleyServiceImpl xhTrolleyService;
	@Autowired
    @Qualifier("userAddressService")
    private UserAddressServiceImpl userAddressService;
	@Autowired
	@Qualifier("expressService")
	private ExpressService expressService;
	
	//查询购物车信息 
	@RequestMapping(value="myTrolley",method={RequestMethod.POST,RequestMethod.GET})
     public String myTrolley(Model model){
    	 List<Xhtrolley> allTrolleyItem=xhTrolleyService.TrolleyItem();
    	 model.addAttribute("allTrolleyItem", allTrolleyItem);
    	 System.out.println(allTrolleyItem);
    	 return "/jsp/back/trolley/trolley.jsp";                                                                                                                                                                                                                                                                     
     }
	
	//查询通过用户
	@RequestMapping("findByUser.action")
	  public String findByUser(Model model){
		 /*// 1. 得到uid
	         Xhusers user = (Xhusers)req.getSession().getAttribute("sessionUser");
		         Integer uid = user.getUserid();*/
		
		  List<Xhtrolley> trolleyItem=xhTrolleyService.queryTrolleyByUser(1);
		  model.addAttribute("trolleyItem", trolleyItem);
		  return "forward:/front/BuyCar.jsp";		
	  }
	  //查询通过用户
		/*@RequestMapping("findByUser1.action")
		  public String findByUser1(Model model){
			List<Xhtrolley> userT=xhTrolleyService.queryTrolleyByUser(1);
				  System.out.println(userT);
			  model.addAttribute("userT", userT);
			  return "/front/BuyCar.jsp";
		     }
	*/
	//添加购物车
	@RequestMapping(value="addTrolley")
	public String  addTrolley(Xhtrolley xhtrolley){
		xhTrolleyService.addTrolley(xhtrolley);
		return "/jsp/back/trolley/addtrolley.jsp";
	}
	
	
	//删除购物车
	@RequestMapping("deleteTrolley.action")
	public String deleteTrolley(int id){
		xhTrolleyService.deleteTrolleyById(id);
		return "forward:/trolley/myTrolley.action";
	}
	
	//删除用户购物车中的商品
	@RequestMapping("deleteById.action")
	@ResponseBody
	public Msg deleteById(int id){
		if(id!=0){
		xhTrolleyService.deleteById(id);
		return Msg.success();
		}
		return Msg.fail();
	}
	
	//批量删除购物车
	@RequestMapping("deleteTrolleyByIds")
	public String deleteTrolleyByIds(HttpServletRequest req){
		String ids=req.getParameter("ids");
		xhTrolleyService.deleteTrolleyByIds(ids);
		return "/jsp/back/trolley/trolley.jsp";
	}
	
	//前端
	
	//添加购物车条目
	@RequestMapping("addTroItem.action")
	@ResponseBody
	public Msg addTroItem(int pid,int pnum){
	 
			System.out.println(pid+""+pnum);
			Xhtrolley tro=new Xhtrolley();
			
			if(pid>0&&pnum>0){	
			System.out.println(pid);	
			tro.setPid(pid);
			tro.setUserid(1);
			tro.setTronum(pnum);
			xhTrolleyService.addTroItem(tro);
			
			return Msg.success().add("msg", "添加购物车成功！");
		}
			
		return Msg.fail().add("msg", "添加失败，请联系管理员！");
	}
	
	//修改购物车商品的数量
	@RequestMapping("modifyTrolley.action")
	@ResponseBody
	 public Msg uptateProductById(int id,int num){
		 if(id>0&&num>0){
			 Xhtrolley trolley = new Xhtrolley();
			 trolley.setTroid(id);
			 trolley.setTronum(num);
			xhTrolleyService.updateProductById(trolley);
			return Msg.success();
		 }
		 return Msg.fail();
	}
	
	@RequestMapping("deleteTrolleyForFront.action")
	@ResponseBody
	public Msg deleteTrolleyForFront(int id){
		if(id>0){
			xhTrolleyService.deleteTrolleyById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	//加载前端数据
	@RequestMapping("loadItemsFront.action")
	public String loadItemsFront(Model model,String id,String total){
		//String ids=req.getParameter("itemids");
		//Double total1=Double.parseDouble(req.getParameter("total"));
		
	     List<Xhtrolley> items=xhTrolleyService.loadItemsFront(id);
		System.out.println(items);
		model.addAttribute("items", items);
		model.addAttribute("total", Double.parseDouble(total));
		UserAddress ua= userAddressService.queryAllUserAddressByUser(1);
    	model.addAttribute("ua",ua);
    	List<Xhshopping> expresslist = expressService.queryAllExpress();
 		model.addAttribute("expresslist", expresslist);
		return "/front/BuyCar_Two.jsp";
	}
}
