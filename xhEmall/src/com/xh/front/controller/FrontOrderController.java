package com.xh.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.front.bean.UserAddress;
import com.xh.front.service.FrontOrderService;

@Controller
@RequestMapping("order")
public class FrontOrderController {
	
	@Autowired
	@Qualifier("frontOrderService")
	private FrontOrderService frontOrderService;
	
	@RequestMapping("queryOrderInfo.action")
	public String queryOrderInfo(int userid, Model model){
		List<OrderGoods> ogList = frontOrderService.queryOrderInfo(userid).getData();
		model.addAttribute("ogList", ogList);
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
}
