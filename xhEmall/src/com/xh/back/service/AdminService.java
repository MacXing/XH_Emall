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
	
	//通过id查找Admin信息
	public Xhadmin getAdmin(String id);
	
	//删除单个管理员信息
	public int deleteAdminById(String id);
	
	//修改单个管理员信息
	public int modifyAdmin(Xhadmin admin);
	
	//添加单个管理员信息
	public int addAdmin(Xhadmin admin);
	
	public Xhadmin queryAdminByName(String name);
	
}
