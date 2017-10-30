package com.xh.back.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.other.getip.GetIp;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	@Qualifier("userService")
	private XhUserService userService;
	
	@RequestMapping("queryAllUsers.action")
	public String queryAllUsersController(Model model){
        List<Xhusers> allUser = userService.queryAllUsers();
		
		model.addAttribute("allUser", allUser);
		//返回到查询JSP
		return "/jsp/back/user/queryUsers.jsp";
	}
	
	@RequestMapping("addUser.action")
	public String addUser(Xhusers user)throws ParseException{
		user.setUserlogintime(new Date());
		user.setUserlasttime(new Date());
		userService.addUser(user);
		return "/jsp/back/index.jsp";
	}
	
	@RequestMapping("deleteUser.action")
	public String  deleteUser(int id){
		//获取用户ID
		userService.deleteUserById(id);
		return "/user/queryAllUsers.action";
	}
	
	@RequestMapping("queryUserById")
	public String queryUserById(int id,Model model){
		Xhusers user =userService.queryUserById(id);
		model.addAttribute("user", user);
		return "/jsp/back/user/updateUser.jsp";
	}
	
	@RequestMapping("updateUser.action")
	public String updateUser(XhusersBean user,HttpServletRequest request){
		int sex=Integer.parseInt(request.getParameter("usersex"));
		user.setUsersex(sex);
		userService.modifyUserById(user);
		
		return "/user/queryAllUsers.action";
	}
	
}
