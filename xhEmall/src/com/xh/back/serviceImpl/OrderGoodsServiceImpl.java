package com.xh.back.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.back.mapper.OrderGoodsMapper;
import com.xh.back.service.OrderGoodsService;

public class OrderGoodsServiceImpl implements OrderGoodsService {

	@Autowired
	@Qualifier("orderGoodsMapper")
	private OrderGoodsMapper orderGoodsMapper;
	
	@Override
	public ServerResponse<List<OrderGoods>> queryAllOrderGoods() {
		List<OrderGoods> OGList = orderGoodsMapper.queryAllOrderGoods();
		if(OGList == null){
			return ServerResponse.createByErrorMassage("没有相关数据");
		}
		return ServerResponse.createBySuccess("操作成功", OGList);
	}

	@Override
	public ServerResponse<OrderGoods> queryOrderGoodById(int ogid) {
		OrderGoods orderGoods = orderGoodsMapper.queryOrderGoodById(ogid);
		if(orderGoods == null){
			return ServerResponse.createByErrorMassage("查询ID不存在");
		}
		return ServerResponse.createBySuccess("查询成功", orderGoods);
	}

	@Override
	public ServerResponse<String> deleteOrderGoodById(int ogid) {
		int resultCount = orderGoodsMapper.deleteOrderGoodById(ogid);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("删除成功");
		}
		return ServerResponse.createByErrorMassage("删除失败");
	}

	@Override
	public ServerResponse<String> deleteOrderGoodBatch(List<String> ogids) {
		if(ogids == null){
			return ServerResponse.createByErrorMassage("参数错误");
		}
		List<Integer> ogidsInt = new ArrayList<>();
		for(String str : ogids){
			ogidsInt.add(Integer.parseInt(str));
		}
		int resultCount = orderGoodsMapper.deleteOrderGoodBatch(ogidsInt);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("删除成功");
		}
		return ServerResponse.createByErrorMassage("删除失败");
	}

	@Override
	public ServerResponse<String> addOrderGoodInfo(int pid, int orderid) {
		
		int resultCount =  orderGoodsMapper.checkOrderId(orderid);
		if(resultCount <= 0){
			return ServerResponse.createByErrorMassage("订单号错误");
		}
		
		resultCount = orderGoodsMapper.checkProductId(pid);
		if(resultCount <= 0){
			return ServerResponse.createByErrorMassage("商品号错误");
		}
		
		resultCount = orderGoodsMapper.addOrderGoodInfo(pid, orderid);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("添加成功");
		}
		return ServerResponse.createByErrorMassage("添加失败");
	}

	@Override
	public ServerResponse<String> updateOrderGoodInfo(OrderGoods orderGoods) {
		
		if(orderGoods == null){
			return ServerResponse.createByErrorMassage("参数错误");
		}
		
		int resultCount =  orderGoodsMapper.checkOrderId(orderGoods.getOrderID());
		if(resultCount <= 0){
			return ServerResponse.createByErrorMassage("订单号错误");
		}
		
		resultCount = orderGoodsMapper.checkProductId(orderGoods.getpID());
		if(resultCount <= 0){
			return ServerResponse.createByErrorMassage("商品号错误");
		}
		
		
		resultCount = orderGoodsMapper.updateOrderGoodInfo(orderGoods);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("修改成功");
		}
		return ServerResponse.createByErrorMassage("修改失败");
	}

	@Override
	public ServerResponse<String> checkOrderId(int orderid) {
		if(orderid == 0){
			return ServerResponse.createByErrorMassage("参数错误");
		}
		int resultCount = orderGoodsMapper.checkOrderId(orderid);
		if(resultCount > 0){
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByErrorMassage("订单号不存在");
	}

	@Override
	public ServerResponse<String> checkProductId(int pid) {
		if(pid == 0){
			return ServerResponse.createByErrorMassage("参数错误");
		}
		int resultCount = orderGoodsMapper.checkProductId(pid);
		if(resultCount > 0){
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByErrorMassage("商品号不存在");
	}

	@Override
	public ServerResponse<List<OrderGoods>> queryOrderGoodByOGId(int orderid) {
		List<OrderGoods> ogdList = orderGoodsMapper.queryOrderGoodByOGId(orderid);
		if(ogdList != null){
			return ServerResponse.createBySuccess(ogdList);
		}
		return ServerResponse.createByErrorMassage("查询结果为空");
	}
	
}
