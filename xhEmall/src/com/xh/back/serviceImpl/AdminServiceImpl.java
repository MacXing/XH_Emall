package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhadmin;
import com.xh.back.mapper.AdminMapper;
import com.xh.back.service.AdminService;
/**
 * 通过Name查找admin信息
 * 
 * */
public class AdminServiceImpl implements AdminService{
	
	private static final Xhadmin admin = null;
	@Autowired
	@Qualifier("adminMapper")
	private AdminMapper adminMapper;

	public Xhadmin selectAdminByName(Xhadmin admin) {
		return adminMapper.selectAdminByName(admin);
	}

	@Override
	public void updateAdminIpAndTime(Xhadmin admin) {
		adminMapper.updateAdminIpAndTime(admin);
	}

	@Override
	public List<Xhadmin> queryAdminList() {
		try {
			return adminMapper.queryAdminList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int deleteAdminById(String id){
		try {
			return adminMapper.deleteAdminById(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int modifyAdmin(Xhadmin admin) {
		try {
			return adminMapper.modifyAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int addAdmin(Xhadmin admin) {
		try {
			return adminMapper.addAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
