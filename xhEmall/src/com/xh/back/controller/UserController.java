package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String addUser(Xhusers user,HttpServletRequest request,MultipartFile userphotoload,HttpSession session)throws IllegalStateException, IOException{
		user.setUserlogintime(new Date());
		user.setUserlasttime(new Date());
				
		if(user.getUsername()!=""&&user.getUserpassword()!=""){
			if(userphotoload != null && userphotoload.getOriginalFilename()!=null){
				//在这里进行文件保存操作
				//传进去的是一个路径，返回的也是一个路径
				String path = session.getServletContext().getRealPath("/userphoto");

				String realName = userphotoload.getOriginalFilename();
				
				String realFilePath = path+File.separator+realName;//file.separator相当于斜杠
				
				File file = new File(realFilePath);
				
				userphotoload.transferTo(file);
				
				user.setUserphoto(realFilePath);				
			}else if (user.getUserphotoPath()=="") {
				request.setAttribute("message", "请重新选择路径！");
			}else if(user.getUserbirthday()==null){
				request.setAttribute("message", "出生年月输入格式错误！");
			}
		}else {
			request.setAttribute("message","请检查输入，姓名、密码不能为空！");
		}
		userService.addUser(user);
		return "/user/queryAllUsers.action";
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
	public String updateUser(XhusersBean user,HttpServletRequest request,MultipartFile userphotoupdate,HttpSession session)throws IllegalStateException, IOException{
		int sex=Integer.parseInt(request.getParameter("usersex"));
		user.setUsersex(sex);
		
		if(userphotoupdate != null && userphotoupdate.getOriginalFilename()!=null){
			//在这里进行文件保存操作
			//传进去的是一个路径，返回的也是一个路径
			String path = session.getServletContext().getRealPath("/userphoto");

			String realName = userphotoupdate.getOriginalFilename();
			
			String realFilePath = path+File.separator+realName;//file.separator相当于斜杠
			
			File file = new File(realFilePath);
			
			userphotoupdate.transferTo(file);
			
			user.setUserphoto(realFilePath);
			
		}else {
			request.setAttribute("message", "未选择图片！");
		}
		if (user.getUserphotoPath()=="") {
			request.setAttribute("message", "请重新选择路径！");
		}else {
			request.setAttribute("message", "路径存在！");
		}
		userService.modifyUserById(user);
		
		return "/user/queryAllUsers.action";
	}
	
	@ResponseBody
	@RequestMapping("queryUserByIdForDetail")
	public Xhusers queryUserByIdForDetail(int id){
		Xhusers user =userService.queryUserById(id);
		System.out.println(user);
		return user;
	}
}
