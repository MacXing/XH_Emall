package com.xh.front.service;


import com.xh.front.bean.Xhusers;

public interface XhUserService {
	
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
}
