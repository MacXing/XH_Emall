package com.xh.front.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;
import com.xh.front.mapper.XhUserMapper;
import com.xh.front.service.XhUserService;

public class XhUserServiceImpl implements XhUserService {
	
	@Autowired
	@Qualifier("xhUserMapper")
	private XhUserMapper xhUserMapper;
	
	@Override
	public Xhusers selectUserByPhone(Xhusers user) {
		
		return xhUserMapper.selectUserByPhone(user);
		
	}

	@Override
	public void updateUserIpAndTime(Xhusers user) {
		
		xhUserMapper.updateUserIpAndTime(user);
		
	}
}
