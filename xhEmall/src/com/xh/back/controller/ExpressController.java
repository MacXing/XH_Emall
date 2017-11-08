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
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.Xhshopping;
import com.xh.back.service.ExpressService;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("exp")
public class ExpressController {
	@Autowired
	@Qualifier("expressService")
	private ExpressService expressService;
	
	@RequestMapping("queryAllExpress.action")
	public String queryAllExpress(Model model){
        List<Xhshopping> expresslist = expressService.queryAllExpress();
		
		model.addAttribute("expresslist", expresslist);
		//返回到查询JSP
		return "/jsp/back/order/queryAllExpress.jsp";
	}
	
	@RequestMapping("addExpress.action")
	public String addExpress(Xhshopping express,HttpServletRequest request,HttpSession session){
		expressService.addExpress(express);
		return "/exp/queryAllExpress.action";
	}
	
	@ResponseBody
	@RequestMapping("insertExpressAndFile.action")
	public Msg insertExpressAndFile(Xhshopping express,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/shoppingphoto");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			express.setShoppingimg(file_name);
		}		
		expressService.addExpress(express);		
		return Msg.success();
	}
	
	@RequestMapping("deleteExpress.action")
	public String deleteExpress(int id){
		//获取用户ID
		expressService.deleteByPrimaryKey(id);
		return "/exp/queryAllExpress.action";
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
			String savePath = request.getServletContext().getRealPath("/shoppingphoto");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			return Msg.success().add("filename",file_name);
		}	
		return Msg.fail();
	}
	
	@RequestMapping("queryExpressById")
	public String queryExpressById(int id,Model model){
		Xhshopping express =expressService.queryExpByPrimarykey(id);
		model.addAttribute("express", express);
		return "/jsp/back/user/updateUser.jsp";
	}
	
	@ResponseBody
	@RequestMapping("updateExpress.action")
	public Msg updateExpress(Xhshopping express,HttpServletRequest request,MultipartFile file,HttpSession session)throws IllegalStateException, IOException{				
		if(express!=null){
			if(file!=null){
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					Msg.fail();
				}
				String savePath = request.getServletContext().getRealPath("/shoppingphoto");			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				express.setShoppingimg(file_name);
			}
			int enable=Integer.parseInt(request.getParameter("enable"));
			express.setEnable(enable);
			expressService.updateExpressByPrimaryKey(express);
			return Msg.success();
		}		
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("queryExpByIdForDetail")
	public Xhshopping queryExpByIdForDetail(int id){
	    Xhshopping express = expressService.queryExpByPrimarykey(id);
	    if (express!=null){
	    	return express;
	    } else {
	    	return null;
	    }
	}
}
