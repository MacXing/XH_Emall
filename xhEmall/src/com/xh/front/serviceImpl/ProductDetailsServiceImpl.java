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
import com.xh.front.bean.Xhusers;
import com.xh.front.mapper.ProductDetailsMapper;
import com.xh.front.mapper.XhUserMapper;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.XhUserService;

public class ProductDetailsServiceImpl implements ProductDetailsService {
	@Autowired
	@Qualifier("productDetailsMapper")
	private ProductDetailsMapper productDetailsMapper;

	@Override
	public List<ProductImage> queryImagesByPid(Integer pid) {
		return productDetailsMapper.queryImagesByPid(pid);
	}

	@Override
	public List<Xhcomment> queryCommentByPid(Integer pid) {		
		return productDetailsMapper.queryCommentByPid(pid);
	}
	
	
}
