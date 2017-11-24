package com.xh.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.back.service.OrderGoodsService;

@Controller
@RequestMapping("admin")
public class OrderGoodsController {
	@Autowired
	@Qualifier("orderGoodsService")
	private OrderGoodsService orderGoodsService;
	
	@RequestMapping(value = "queryOrderGoodById.action")
	@ResponseBody
	public ServerResponse<OrderGoods> queryOrderGoodById(int ogid){
		return orderGoodsService.queryOrderGoodById(ogid);
	}
	
	@RequestMapping(value = "queryAllOrderGoods.action")
	public String queryAllOrderGoods(Model model){
		List<OrderGoods> OGList = orderGoodsService.queryAllOrderGoods().getData();
		model.addAttribute("OGList", OGList);
		return "forward:/jsp/back/orderGoods/queryOrderGood.jsp";
	}
	
	@RequestMapping(value = "queryOrderGoodByOGId.action")
	public String queryOrderGoodByOGId(int orderid, Model model){
		List<OrderGoods> ogdList = orderGoodsService.queryOrderGoodByOGId(orderid).getData();
		if(ogdList != null){
			model.addAttribute("ogdList", ogdList);
		}
		return "forward:/front/Member_Order_Detail.jsp";
	}
	
	@RequestMapping(value = "deleteOrderGoodById.action")
	@ResponseBody
	public ServerResponse<String> deleteOrderGoodById(int ogid){
		return orderGoodsService.deleteOrderGoodById(ogid);
	}
	
	@RequestMapping(value = "deleteOrderGoodBatch.action")
	@ResponseBody
	public ServerResponse<String> deleteOrderGoodBatch(List<String> ogids){
		return orderGoodsService.deleteOrderGoodBatch(ogids);
	}
	
	@RequestMapping(value = "checkOrderId.action")
	@ResponseBody
	public ServerResponse<String> checkOrderId(int orderid){
		return orderGoodsService.checkOrderId(orderid);
	}
	
	@RequestMapping(value = "checkProduceId.action")
	@ResponseBody
	public ServerResponse<String> checkProduceId(int pid){
		return orderGoodsService.checkProductId(pid);
	}
	
	@RequestMapping(value = "addOrderGoodInfo.action")
	@ResponseBody
	public ServerResponse<String> addOrderGoodInfo(int pid, int orderid){
		return orderGoodsService.addOrderGoodInfo(pid, orderid);
	}
	
	@RequestMapping(value = "updateOrderGoodInfo.action")
	@ResponseBody
	public ServerResponse<String> updateOrderGoodInfo(OrderGoods orderGoods){
		return orderGoodsService.updateOrderGoodInfo(orderGoods);
	}
	
}
