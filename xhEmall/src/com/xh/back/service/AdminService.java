package com.xh.back.service;

import com.xh.back.bean.Xhadmin;

public interface AdminService {
	//通过Name查找Admin信息
	public Xhadmin selectAdminByName(Xhadmin admin);
	
	//给admin添加time和ip
	public void updateAdminIpAndTime(Xhadmin admin);
	
}
