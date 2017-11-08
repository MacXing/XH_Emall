package com.xh.back.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.mapper.OrderMapper;
import com.xh.back.mapper.UserMapper;
import com.xh.back.service.OrderService;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;


public class OrderServiceImpl implements OrderService {
	
	@Autowired
	@Qualifier("orderMapper")
	private OrderMapper orderMapper;
	
	@Override
	public List<Xhorderinfo> queryAllUsersOreder() {
		
		List<Xhorderinfo> userorder=orderMapper.queryOrderInfor();
		return userorder;
		
	}

	@Override
	public Xhorderinfo queryOrderById(int id) {
		// TODO Auto-generated method stub
		return orderMapper.queryOrderByPrimaryKey(id);
	}
	
	@Override
	public void addOrder(Xhorderinfo order) {
		// TODO Auto-generated method stub
		orderMapper.addOrder(order);		
	}

	@Override
	public void deleteOrderById(int id) {
		// TODO Auto-generated method stub
		orderMapper.deleteOrderByPrimaryKey(id);
	}

	@Override
	public void modifyOrderById(Xhorderinfo order) {
		// TODO Auto-generated method stub
		orderMapper.updateOrderByPrimaryKey(order);
	}

	@Override
	public List<OrderProvince> getAllProvince() {
		// TODO Auto-generated method stub
		List<OrderProvince> province=orderMapper.getProvince();
		return province;
	}

	@Override
	public List<OrderCity> getCityByProvinceId(String id) {
		// TODO Auto-generated method stub
		return orderMapper.getCityByProvinceId(id);
	}

	@Override
	public List<OrderArea> getAreaByCityId(String id) {
		// TODO Auto-generated method stub
		return orderMapper.getAreaByCityId(id);
	}
	
	/*@Override
	public void deleteUserById(int id) {		
		userMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public void modifyUserById(XhusersBean user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public Xhusers queryUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.queryUserByPrimaryKey(id);
	}

	@Override
	public void addUser(Xhusers user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
		//System.out.println(user.getUserbirthday());
	}*/

}
