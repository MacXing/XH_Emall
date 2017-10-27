package com.xh.back.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.other.getip.GetIp;
import com.xh.back.bean.Xhadmin;
import com.xh.back.serviceImpl.AdminServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl adminService;

	@RequestMapping("checkAdmin.action")
	public String checkAdmin(HttpSession session,Xhadmin admin,HttpServletRequest request){
		GetIp ip = new GetIp();
		String ip_String = ip.getIpAddr(request);
		Date date = new Date();
		
		System.out.println(ip_String+""+date);
		
		if(admin.getAdminname()==null || admin.getAdminname()==""||admin.getAdminpassword()==null||admin.getAdminpassword()==""){
			return "";
		}
		Xhadmin admin1=adminService.selectAdminByName(admin);
		if(admin1.getAdminname().equals(admin.getAdminname())&&admin1.getAdminpassword().equals(admin.getAdminpassword())){
			admin1.setAdminlastip(ip_String);
			admin1.setAdminlasttime(new Date());
			adminService.updateAdminIpAndTime(admin1);
			return "../jsp/back/index.jsp";
		}
		return "";
	}
}
