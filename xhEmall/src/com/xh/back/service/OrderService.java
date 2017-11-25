package com.xh.back.service;


import java.util.List;
import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhorderinfo;


public interface OrderService {
	/**
	 * 接口
	 * 定义所有增删改查的所有操作
	 * */
	public void modifyOrderById(Xhorderinfo order);
	public List<Xhorderinfo> queryAllUsersOreder();
	public Xhorderinfo queryOrderById(int id);
	public void addOrder(Xhorderinfo order);
	public void deleteOrderById(int id);
	
	public List<OrderProvince> getAllProvince();
    public List<OrderCity> getCityByProvinceId(String id);
	public List<OrderArea> getAreaByCityId(String id);
	
	public String getProvinceName(String id);
	public String getCityName(String id);
	public String getAreaName(String id);
	
	public List<Xhorderinfo> getSendOrder(int status);
	
	public int checkUser(int id);
	public int checkExpress(int id);
	
	public List<Xhorderinfo> queryAllOrderNotShop();
	
	public void updateOrderShop(int id);
}
