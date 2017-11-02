package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getip.GetIp;
import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.back.service.UserGradeService;
import com.xh.back.service.UserMessageService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("message")
public class UserMessageController {
	@Autowired
	@Qualifier("userMessage")
	private UserMessageService userMessage;
	
	//查询所有等级会员
	@RequestMapping("queryUsermessageController.action")
	public String queryUsermessageController(Model model){
        List<Xhmessage> message=userMessage.queryUserMessage();
        model.addAttribute("message", message);
		return "/jsp/back/user/queryAllUserMessage.jsp";
	}
	
	//通过会员ID查询所有会员留言并返回json数据
	@ResponseBody
	@RequestMapping("queryUsermessageByIdForDetail.action")
	public Xhmessage queryUsermessageByIdForDetail(int id,Model model){
		Xhmessage message =userMessage.queryUsermessageById(id);
		model.addAttribute("message", message);
		System.out.println(message);
		return message;
	}
	
	//查询等级列表的所有信息
	@RequestMapping("queryAllMessage.action")
	public String queryAllMessage(Model model){
	    List<Xhmessage> messageList=userMessage.queryAllMessagelist();
	    model.addAttribute("messageList", messageList);
	    return "/jsp/back/user/queryAllMessage.jsp";
	}
	
	//通过等级ID查询等级列表
	@ResponseBody
	@RequestMapping("queryUserGradeByIdForDetail.action")
	public Xhmessage queryUserGradeByIdForDetail(int id,Model model){
		Xhmessage message =userMessage.queryMessageListById(id);
		model.addAttribute("message",message);
		return message;
	}
		
	
	/*//增加等级列表
	@RequestMapping("addGradeList.action")
	public String addGradeList(Xhgrade grade,HttpServletRequest request,Model model,HttpSession session){
		String gradename=request.getParameter("gradename");
		String gradecount=request.getParameter("gradecount");		
		
		List<Xhgrade> allGrade=userGrade.queryAllGradelist();
		if(gradename!=""){
			for (Xhgrade xhgrade : allGrade) {
				if (gradename.equals(xhgrade.getGradename())&& gradecount.equals(xhgrade.getGradecount())) {
					return null;
				}	
			}
		}else{
			userGrade.addGradeList(grade);
		}
				
		return "/grade/queryallGrade.action";
	}
	
	//通过等级ID删除等级列表信息
	@RequestMapping("deleteGradeList.action")
	public String deleteGradeList(int id){
		userGrade.deleteGradeListByPrimaryKey(id);
		return "/grade/queryallGrade.action";
	}
	
	//更新等级列表信息
	@RequestMapping("modifyGradeList.action")
	public String modifyGradeList(Xhgrade grade){
		userGrade.updateGradeListByPrimaryKey(grade);
		return "/grade/queryallGrade.action";
	}*/
}
