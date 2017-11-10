package com.xh.back.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xh.back.bean.OrderGoods;

public interface OrderGoodsMapper {
	
	//查询所有货物订单
	public List<OrderGoods> queryAllOrderGoods();
	
	//根据ID查询货物订单
	public OrderGoods queryOrderGoodById(int ogid);
	
	//根据货物订单ID删除
	public int deleteOrderGoodById(int ogid);
	
	//批量删除货物订单
	public int deleteOrderGoodBatch(List<Integer> ogids);
	
	//添加货物订单
	public int addOrderGoodInfo(@Param("pid")int pid, @Param("orderid")int orderid);
	
	//修改货物订单信息
	public int updateOrderGoodInfo(OrderGoods orderGoods);
	
	//检查订单号是否存在
	public int checkOrderId(int orderid);
	
	//检查商品号是否存在
	public int checkProductId(int pid);
}
