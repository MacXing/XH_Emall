package com.xh.front.service;

import java.util.List;

import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhproduct;

public interface PaySercice {
	Xhorderinfo queryOrderById(int orderid);
	
	void updatePayStatus(Xhorderinfo xhorderinfo);
}
