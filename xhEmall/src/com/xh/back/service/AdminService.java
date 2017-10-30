package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhadmin;

public interface AdminService {
	//通过Name查找Admin信息
	public Xhadmin selectAdminByName(Xhadmin admin);
	
	//给admin添加time和ip
	public void updateAdminIpAndTime(Xhadmin admin);
	
	//查找所有Admin信息
	public List<Xhadmin> queryAdminList();
	
}
