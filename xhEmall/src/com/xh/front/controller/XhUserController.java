package com.xh.front.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.other.getip.GetIp;
import com.xh.front.bean.Xhusers;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("user")
public class XhUserController {
	@Autowired
	@Qualifier("xhUserService")
	private XhUserService xhUserService;
	
	@RequestMapping("selectUserByPhone.action")	
	public String selectUserByPhone(Model model,Xhusers user,HttpServletRequest request,String code){
		GetIp getIp = new GetIp();		
		//用户登录时实例化时间作为用户登录时间
		Date date = new Date();		
		//获取用户登录输入的验证码
		String code1 = code;	
		//获取用户登录的ip
		String ip = getIp.getIpAddr(request);		
		System.out.println(code1);
		
		if(user.getUserphone()!=null){
			user.setUserlastip(ip);
			user.setUserlasttime(date);
			//查询用户输入的手机号码和密码是否正确
			Xhusers users =xhUserService.selectUserByPhone(user);
			if(users != null){
				//获取验证码上的信息
				//String session_code = (String) request.getSession().getAttribute("session_code");
				if(!code1.equalsIgnoreCase("4At9")){
					return "/jsp/login.jsp";
				}
				//更新用户登录的ip等信息
				xhUserService.updateUserIpAndTime(user);
				//将所需数据返回给页面
				model.addAttribute("users", users);
				return "/jsp/users.jsp";
			}			
		}
		return null;		
	}
	
}
