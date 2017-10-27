package com.xh.back.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.back.bean.Xhadmin;
import com.xh.back.serviceImpl.AdminServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl adminService;
	
	@RequestMapping("checkAdmin.action")
	public String checkAdmin(HttpSession session,String adminName,String password){
		System.out.println(adminName+""+password);
		if(adminName==null || adminName==""||password==null||password==""){
			return "";
		}
		Xhadmin admin=adminService.selectAdminByName(adminName);
		if(admin.getAdminname().equals(adminName)&&admin.getAdminpassword().equals(password)){
			return "/index.jsp";
		}
		return null;
	}
}
