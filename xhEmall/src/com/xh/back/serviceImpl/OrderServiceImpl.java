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

	@Override
	public String getProvinceName(String id) {
		// TODO Auto-generated method stub
		return orderMapper.getProvinceName(id);
	}

	@Override
	public String getCityName(String id) {
		// TODO Auto-generated method stub
		return orderMapper.getCityName(id);
	}

	@Override
	public String getAreaName(String id) {
		// TODO Auto-generated method stub
		return orderMapper.getAreaName(id);
	}

	@Override
	public List<Xhorderinfo> getSendOrder(int status) {
		// TODO Auto-generated method stub
		List<Xhorderinfo> sendOrder=orderMapper.getSendOrder(status);
		return sendOrder;
	}

	@Override
	public int checkUser(int id) {
		// TODO Auto-generated method stub
		return orderMapper.checkUser(id);
	}

	@Override
	public int checkExpress(int id) {
		// TODO Auto-generated method stub
		return orderMapper.checkExpress(id);
	}
	
}
