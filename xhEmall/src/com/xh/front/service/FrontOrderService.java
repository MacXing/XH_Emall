package com.xh.front.service;

import java.util.List;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.Xhtrolley;
import com.xh.front.bean.UserAddress;

public interface FrontOrderService {
	
	//根据用户ID查询用户订单信息
	public ServerResponse<List<OrderGoods>> queryOrderInfo(Integer userid);
	
	//根据用户ID查询用户收货地址
	public ServerResponse<List<UserAddress>> queryAddressById(int userid);
	
	//添加收货地址
	public ServerResponse<String> addAddress(UserAddress address);
	
	//删除收货地址
	public ServerResponse<String> deleteAddressById(int addID);
	
	//修改收货地址
	public ServerResponse<String> updateAddressById(UserAddress address);
	
	//修改默认地址
	public ServerResponse<String> updateDefaultById(int addID, int userID);
	
	//根据ID查询地址
	public ServerResponse<UserAddress> queryAddInfoById(int addID);
	
	//添加订单
	public ServerResponse<String> addOrder(int spid, UserAddress userAddress, List<Xhtrolley> items);
}
