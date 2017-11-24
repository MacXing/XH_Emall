package com.xh.front.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhtrolley;
import com.xh.back.service.OrderGoodsService;
import com.xh.back.serviceImpl.XhTrolleyServiceImpl;
import com.xh.front.bean.UserAddress;
import com.xh.front.service.FrontOrderService;

@Controller
@RequestMapping("frontOrder")
public class FrontOrderController {
	
	@Autowired
	@Qualifier("frontOrderService")
	private FrontOrderService frontOrderService;
	
	@Autowired
	@Qualifier("xhTrolleyService")
	private XhTrolleyServiceImpl xhTrolleyService;
	
	@Autowired
	@Qualifier("orderGoodsService")
	private OrderGoodsService orderGoodsService;
	
	@RequestMapping("queryOrderInfo.action")
	public String queryOrderInfo(int userid, Model model, @RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="8")Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<Xhorderinfo> oiList = frontOrderService.queryOrderInfo(userid).getData();
		PageInfo pageInfo = new PageInfo(oiList,4);
		model.addAttribute("oiList", oiList);
		model.addAttribute("pageInfo", pageInfo);
		return "/front/Member_Order.jsp";
	}
	
	@RequestMapping("addAddress.action")
	@ResponseBody
	public ServerResponse<String> addAddress(UserAddress address){
		return frontOrderService.addAddress(address);
	}
	
	@RequestMapping("deleteAddressById.action")
	@ResponseBody
	public ServerResponse<String> deleteAddressById(int addID){
		return frontOrderService.deleteAddressById(addID);
	}
	
	@RequestMapping("updateAddressById.action")
	@ResponseBody
	public ServerResponse<String> updateAddressById(UserAddress address){
		return frontOrderService.updateAddressById(address);
	}
	
	@RequestMapping("queryAddressById.action")
	public String queryAddressById(int userid, Model model){
		List<UserAddress> addList = frontOrderService.queryAddressById(userid).getData();
		model.addAttribute("addList", addList);
		return "/front/Member_Address.jsp";
	}
	
	@RequestMapping("updateDefaultById.action")
	@ResponseBody
	public ServerResponse<String> updateDefaultById(int addID, int userID){
		return frontOrderService.updateDefaultById(addID, userID);
	}
	
	@RequestMapping("queryAddInfoById.action")
	@ResponseBody
	public ServerResponse<UserAddress> queryAddInfoById(int addID){
		return frontOrderService.queryAddInfoById(addID);
	}
		
	@RequestMapping("addOrder.action")
	public String addOrder(int spids, UserAddress userAddress,String id, HttpServletRequest req){
		List<Xhtrolley> items = xhTrolleyService.loadItemsFront(id);
		ServerResponse sr = frontOrderService.addOrder(spids, userAddress, items);
		Xhorderinfo orderinfo = (Xhorderinfo)sr.getData();
		//model.addAttribute("orderinfo", orderinfo);
		ServletContext app = req.getServletContext();
		app.setAttribute("orderinfo", orderinfo);
		req.getSession().setAttribute("id", id);
		
		return "forward:/front/BuyCar_Three.jsp";
	}
	
	@RequestMapping("queryOrderDetail.action")
	public String queryOrderDetail(Integer orderid, Model model, @RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="6")Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<OrderGoods> ogList = orderGoodsService.queryOrderGoodByOGId(orderid).getData();
		PageInfo pageInfo = new PageInfo(ogList,4);
		model.addAttribute("orderid", orderid);
		model.addAttribute("ogList", ogList);
		model.addAttribute("pageInfo", pageInfo);
		return "/front/Member_Order_Detail.jsp";
	}
}

