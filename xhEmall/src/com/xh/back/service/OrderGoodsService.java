package com.xh.back.service;

import java.util.List;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;

public interface OrderGoodsService {
	
	// 查询所有货物订单信息
	ServerResponse<List<OrderGoods>> queryAllOrderGoods();
	
	//根据ID查询货物订单
	ServerResponse<OrderGoods> queryOrderGoodById(int ogid);
	
	//根据货物订单ID删除
	ServerResponse<String> deleteOrderGoodById(int ogid);
	
	//批量删除货物订单
	ServerResponse<String> deleteOrderGoodBatch(List<String> ogids);
	
	//添加货物订单
	ServerResponse<String> addOrderGoodInfo(int pid, int orderid);
	
	//修改货物订单信息
	ServerResponse<String> updateOrderGoodInfo(OrderGoods orderGoods);
	
	//检查订单号是否存在
	ServerResponse<String> checkOrderId(int orderid);
	
	//检查商品号是否存在
	ServerResponse<String> checkProductId(int pid);
}
