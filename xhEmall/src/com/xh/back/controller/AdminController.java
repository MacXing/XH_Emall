package com.xh.back.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.error.CustomException;
import com.other.getImage.FileUtil;
import com.other.getip.GetIp;
import com.other.msg.Msg;
import com.other.shiro.CustomFormAuthenticationFilter;
import com.xh.back.bean.ActiveAdmin;
import com.xh.back.bean.Xhadmin;
import com.xh.back.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@RequestMapping("login.action")

	public String login(HttpServletRequest request,Xhadmin admin,String code) throws Exception{
		
		if(admin.getAdminname()==null||admin.getAdminname().equals("")||admin.getAdminpassword()==null
				||admin.getAdminpassword().equals("")||code==null||code.equals("")){
			
			throw new CustomException("用户名、密码、验证码不能为空 ");
			
		}
		CustomFormAuthenticationFilter filter = new CustomFormAuthenticationFilter();
		boolean falg = filter.modifyCode(code, request);
		
		if(falg==false){
			throw new CustomException("验证码错误 ");
		}
		
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(admin.getAdminname(),admin.getAdminpassword());
		subject.login(token);
		
		boolean is_true   =  subject.isAuthenticated();
		if(is_true==false){
			throw new CustomException("密码错误！");	
		}
		
		GetIp getip = new GetIp();
		String ip = getip.getIpAddr(request);
		admin.setAdminlastip(ip);
		admin.setAdminlasttime(new Date());
		adminService.updateAdminIpAndTime(admin);
		return "forward:/admin/home.action";
	}
	
	@RequestMapping("home.action")
	public String home (Model model){
		
		//从shiro的session中取activeUser
		Subject subject = SecurityUtils.getSubject();
				//取身份信息
		ActiveAdmin admin = (ActiveAdmin) subject.getPrincipal();
		System.out.println(admin.toString());
				//通过model传到页面
		model.addAttribute("admin", admin);
		
		return "/jsp/back/index.jsp";
	}
	

	@RequestMapping("checkAdmin.action")
	public String checkAdmin(HttpSession session,Xhadmin admin,HttpServletRequest request,String code){
	
		GetIp ip = new GetIp();
		String ip_String = ip.getIpAddr(request);
		String session_code = (String)session.getAttribute("session_code");
		
		if(admin.getAdminname()==null || admin.getAdminname()==""||admin.getAdminpassword()==null||admin.getAdminpassword()==""||code.equals("")||code==null){
			return "/jsp/back/loginbackstage.jsp";
		}
		Xhadmin admin1=adminService.selectAdminByName(admin);
		if(admin1.getAdminname().equals(admin.getAdminname())&&admin1.getAdminpassword().equals(admin.getAdminpassword())&&session_code.equalsIgnoreCase(code)){
			admin1.setAdminlastip(ip_String);
			admin1.setAdminlasttime(new Date());
			adminService.updateAdminIpAndTime(admin1);
			session.removeAttribute("session_code");
			session.setAttribute("admin", admin1);
			
			return "/jsp/back/index.jsp";
		}
		return "/jsp/back/loginbackstage.jsp";
	}
	
	@RequestMapping("queryAdminList.action")
	public String queryAdminList(Model model){	
		List<Xhadmin> adminList = adminService.queryAdminList();
		model.addAttribute("adminList", adminList);
		return "forward:/jsp/back/admin/queryAdmin.jsp";
	}
	
	@RequestMapping("deleteAdminById.action")
	public String deleteAdminById(String id){
		adminService.deleteAdminById(id);
		return "";
	}
	
	@ResponseBody
	@RequestMapping("addAdmin.action")
	public Integer addAdmin(@RequestBody Xhadmin admin){
		return adminService.addAdmin(admin);
	}
	
	@ResponseBody
	@RequestMapping("getAdmin.action")
	public Xhadmin getAdmin(String id){
		return adminService.getAdmin(id);
	}
	
	@ResponseBody
	@RequestMapping("modifyAdmin.action")
	public Integer modifyAdmin(@RequestBody Xhadmin admin){
		return adminService.modifyAdmin(admin);
	}
	
	@ResponseBody
	@RequestMapping("uploadfile.action")
	public Msg uploadfile(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/upload");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			 //return new Msg(file_name);
			return Msg.success().add("savePath", file_name);
		}
		return Msg.fail();
		//return new Msg("传入错误");
	}
}
