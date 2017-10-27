package com.xh.back.service;

import com.xh.back.bean.Xhadmin;

public interface AdminService {
	//通过Name查找Admin信息
	public Xhadmin selectAdminByName(String adminName);
	
}
