package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhproduct;

public interface PayMapper {
	Xhorderinfo queryOrderById(int orderid);	
}
