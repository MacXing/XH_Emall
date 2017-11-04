package com.xh.back.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		try {
			List<Xhadmin> temp = adminMapper.queryAdminList();
//			for (Xhadmin admin : temp) {
//				String dateTime = admin.getAdminlogintime().toString();
//				ParsePosition pos = new ParsePosition(0);
//				Date strtodate = df.parse(dateTime, pos);
//				admin.setAdminlogintime(strtodate);
//			}
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
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//			String dateTime = df.format(new Date());
//			admin.setAdminlogintime(new Date());
			return adminMapper.getAdmin(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
