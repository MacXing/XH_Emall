package com.xh.front.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getImage.FileUtil;
import com.other.msg.Msg;
import com.xh.front.bean.Navbar;
import com.xh.front.serviceImpl.NavbarServiceImpl;

@Controller
@RequestMapping("navbar")
public class NavbarController {
	@Autowired
	@Qualifier("navbarService")
	private NavbarServiceImpl navbarService;
	
	@RequestMapping("queryAllNavbar.action")	
	public String queryAllNavbar(Model model){
		List<Navbar> navbars = navbarService.queryAllNavbar();
		model.addAttribute("navbars", navbars);
		return "/jsp/front/navbar/queryAllNavbar.jsp";
	}
	
	@RequestMapping("insertNavbar.action")
	@ResponseBody
	public Msg insertNavbar(Navbar navbar,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String url = "";
		if(navbar==null){
			return Msg.fail();
		}
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail().add("msg", "请上传图片");	
			}
			String savePath = request.getServletContext().getRealPath("/upload/navbar");
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			url="/upload/navbar/"+file_name;
			
		}
		navbar.setUrl(url);
		navbar.setbDate(new Date());
		System.out.println(navbar);
		navbarService.insertNavbar(navbar);
		return Msg.success();
	}
	
	@RequestMapping("deleteNavbar.action")
	@ResponseBody
	
	public Msg deleteNavbar(int id,HttpServletRequest request) throws Exception{
		String url="";
		if(id>0){
			url =navbarService.queryNavbarById(id).getUrl();
		}
		if(!url.equals("")){
			String urlpath = request.getServletContext().getRealPath(url);
			FileUtil.deleteFile(urlpath);
			navbarService.deleteNavbar(id);
			return Msg.success();
		}		
		return Msg.fail();
	}
	
	@RequestMapping("updateNavbar.action")
	@ResponseBody
	
	public Msg updateNavbar(Navbar navbar){
		if(navbar!=null){
			if(navbar.getIsshow()==1){
				navbar.setIsshow(0);
				navbarService.updateNavbarById(navbar);
			}else {
				navbar.setIsshow(1);
				navbarService.updateNavbarById(navbar);
			}
			
			return Msg.success();
		}	
		return Msg.fail();
	}
	
}
