package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhorderinfo;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface OrderMapper {
	/**
	 *用户：订单信息
	 *操作：增删改查
	 *属性：/xhEmall/src/com/xh/back/bean/Xhorderinfo.java
	 * */
	public void updateOrderByPrimaryKey(Xhorderinfo order);
	public List<Xhorderinfo> queryOrderInfor();
	public Xhorderinfo queryOrderByPrimaryKey(int id);
	public void deleteOrderByPrimaryKey(int id);
	public void addOrder(Xhorderinfo order);
	
	//三级联动获取省份、城市、地区
	public List<OrderProvince> getProvince();
	public List<OrderCity> getCityByProvinceId(String id);
	public List<OrderArea> getAreaByCityId(String id);
	
	//通过所属id获取省份、城市、地区
	public String getProvinceName(String id);
	public String getCityName(String id);
	public String getAreaName(String id);
	
	//查询发货单
	public List<Xhorderinfo> getSendOrder(int status);
	
	//添加和修改时，判断用户和邮寄方式是否存在
	public int checkUser(int id);
	public int checkExpress(int id);
}
