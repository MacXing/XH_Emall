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
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhproduct;
import com.xh.front.bean.Xhusers;
import com.xh.front.mapper.ProductDetailsMapper;
import com.xh.front.mapper.ProductListMapper;
import com.xh.front.mapper.XhUserMapper;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.ProductListService;
import com.xh.front.service.XhUserService;

public class ProductListServiceImpl implements ProductListService {
	@Autowired
	@Qualifier("productListMapper")
	private ProductListMapper productListMapper;

	@Override
	public List<Xhproduct> queryAllProductByFind(String pname) {
		return productListMapper.queryAllProductByFind(pname);
	}

	@Override
	public int queryCount(String pname) {		
		return productListMapper.queryCount(pname);
	}

	@Override
	public List<Xhproduct> queryProductOrderByPsaleDesc(String pname) {		
		return productListMapper.queryProductOrderByPsaleDesc(pname);
	}

	
	
}
