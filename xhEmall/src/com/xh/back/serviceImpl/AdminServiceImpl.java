package com.xh.back.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.xh.back.bean.Xhadmin;
import com.xh.back.mapper.AdminMapper;
import com.xh.back.service.AdminService;
/**
 * 通过Name查找admin信息
 * 
 * */
@Service
public class AdminServiceImpl implements AdminService{

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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		try {
			List<Xhadmin> temp = adminMapper.queryAdminList();
			return temp;
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
		admin.setAdminlogintime(new Date());
		try {
			return adminMapper.addAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public Xhadmin getAdmin(String id) {
		try {
			return adminMapper.getAdmin(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public Xhadmin queryAdminByName(String name) {
		
		return adminMapper.queryAdminByName(name);
	}

}
