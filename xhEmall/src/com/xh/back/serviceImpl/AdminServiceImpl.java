package com.xh.back.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.xh.back.bean.Xhadmin;
import com.xh.back.mapper.XhadminMapper;
import com.xh.back.service.AdminService;
/**
 * 通过Name查找admin信息
 * 
 * */
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	@Qualifier("xhadminMapper")
	private XhadminMapper adminMapper;

	public Xhadmin selectAdminByName(Xhadmin admin) {
		return adminMapper.selectAdminByName(admin);
	}

	@Override
	public void updateAdminIpAndTime(Xhadmin admin) {
		adminMapper.updateAdminIpAndTime(admin);
	}

}
