package com.xh.front.serviceImpl;


import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.currency.TokenCache;
import com.other.tools.MD5Util;
import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhproduct;
import com.xh.front.bean.Xhusers;
import com.xh.front.mapper.PayMapper;
import com.xh.front.mapper.ProductDetailsMapper;
import com.xh.front.mapper.ProductListMapper;
import com.xh.front.mapper.XhUserMapper;
import com.xh.front.service.PaySercice;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.ProductListService;
import com.xh.front.service.XhUserService;

public class PayServiceImpl implements PaySercice {
	@Autowired
	@Qualifier("payMapper")
	private PayMapper payMapper;

	@Override
	public Xhorderinfo queryOrderById(int orderid) {
		return payMapper.queryOrderById(orderid);
	}


	
	
}
