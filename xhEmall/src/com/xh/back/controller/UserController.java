package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.security.Provider.Service;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

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

import com.other.getImage.FileUtil;
import com.other.getip.GetIp;
import com.other.msg.Msg;
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
	@ResponseBody
	public Msg addUser(Xhusers user,HttpServletRequest request,HttpSession session){
		String resultGradeId=request.getParameter("gradeid");
		String userbirthday=request.getParameter("userbirthday");
		System.out.println(resultGradeId);
		Msg result=new Msg();
		
		if(userbirthday.equals("")){
			user.setUserbirthday(new Date());
		}
		if(resultGradeId.equals("")){
			result=checkAddGrade(0);
		}else{
			result=checkAddGrade(Integer.parseInt(resultGradeId));
		}
		if(result.getCode()==100){
			user.setUserlogintime(new Date());
			user.setUserlasttime(new Date());
			userService.addUser(user);
		}		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("insertUserAndFile.action")
	public Msg insertUserAndFile(Xhusers user,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String resultGradeId=request.getParameter("gradeid");
		String userbirthday=request.getParameter("userbirthday");
		Msg result=new Msg();
		
		if(userbirthday.equals("")){
			user.setUserbirthday(new Date());
		}		
		if(resultGradeId.equals("")){
			result=checkAddGrade(0);
		}else{
			result=checkAddGrade(Integer.parseInt(resultGradeId));
		}
		
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/userphoto");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			user.setUserphoto(file_name);
		}
		if(result.getCode()==100){
			user.setUserlogintime(new Date());
			user.setUserlasttime(new Date());
			userService.addUser(user);				
		}	
		return Msg.success();
	}
	
	@RequestMapping("deleteUser.action")
	public String  deleteUser(int id){
		//获取用户ID
		userService.deleteUserById(id);
		return "/user/queryAllUsers.action";
	}
	
	@RequestMapping("uploadimg.action")
	public Msg uploadImg(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/userphoto");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			return Msg.success().add("filename",file_name);
		}	
		return Msg.fail();
	}
	
	@RequestMapping("queryUserById")
	public String queryUserById(int id,Model model){
		Xhusers user =userService.queryUserById(id);
		model.addAttribute("user", user);
		return "/jsp/back/user/updateUser.jsp";
	}
	
	@RequestMapping("updateUser.action")
	@ResponseBody
	public Msg updateUser(XhusersBean user,HttpServletRequest request){
		String resultGradeId=request.getParameter("gradeid");
		String userbirthday=request.getParameter("userbirthday");
		String userlogintime=request.getParameter("userlogintime");
		String userlasttime=request.getParameter("userlasttime");
		System.out.println(resultGradeId);
		Msg result=new Msg();
		
		if(userbirthday.equals("")){
			user.setUserbirthday(new Date());
		}
		if(userlogintime.equals("")){
			user.setUserbirthday(new Date());
		}
		if(userlasttime.equals("")){
			user.setUserbirthday(new Date());
		}
		if(resultGradeId.equals("")){
			result=checkAddGrade(0);
		}else{
			result=checkAddGrade(Integer.parseInt(resultGradeId));
		}
		if(result.getCode()==100){
			user.setUserlogintime(new Date());
			user.setUserlasttime(new Date());
			userService.modifyUserById(user);
		}		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("updateUserAndFile.action")
	public Msg updateUserAndFile(XhusersBean user,HttpServletRequest request,MultipartFile file,HttpSession session)throws IllegalStateException, IOException{				
		String resultGradeId=request.getParameter("gradeid");
		int sex=Integer.parseInt(request.getParameter("usersex"));
		String userbirthday=request.getParameter("userbirthday");
		String userlogintime=request.getParameter("userlogintime");
		String userlasttime=request.getParameter("userlasttime");
		Msg result=new Msg();
		
		if(userbirthday.equals("")){
			user.setUserbirthday(new Date());
		}
		if(userlogintime.equals("")){
			user.setUserlogintime(new Date());
		}
		if(userlasttime.equals("")){
			user.setUserlasttime(new Date());
		}
		if(resultGradeId.equals("")){
			result=checkAddGrade(0);
		}else{
			result=checkAddGrade(Integer.parseInt(resultGradeId));
		}
				
		if(user!=null){
			if(file!=null){				
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					Msg.fail();
				}
				String savePath = request.getServletContext().getRealPath("/userphoto");			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				user.setUserphoto(file_name);
			}
			if(result.getCode()==100){
				user.setUsersex(sex);
				userService.modifyUserById(user);
			}		
			return Msg.success();
		}		
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("queryUserByIdForDetail")
	public Xhusers queryUserByIdForDetail(int id){
		Xhusers user =userService.queryUserById(id);
		System.out.println(user);
		return user;
	}
	
	@RequestMapping("checkAddGrade.action")
    @ResponseBody
	public Msg checkAddGrade(int id){
    	int result=userService.checkGrade(id);
    	if(result>0){
    		return Msg.success();
    	}
		return Msg.fail1();
	} 
}
