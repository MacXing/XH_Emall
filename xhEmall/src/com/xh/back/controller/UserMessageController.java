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
	
	//通过留言ID查询留言列表
	@ResponseBody
	@RequestMapping("queryUserMessageByIdForDetail.action")
	public Xhmessage queryUserMessageByIdForDetail(int id,Model model){
		Xhmessage message =userMessage.queryMessageListById(id);
		model.addAttribute("message",message);
		return message;
	}
		
	@ResponseBody
	@RequestMapping("queryUsermessageByIdForModify.action")
	public Xhmessage queryUsermessageByIdForModify(int id,Model model){
		Xhmessage message =userMessage.queryMessageListById(id);
		model.addAttribute("message",message);
		return message;
		
	}
	
	//增加留言列表
	@RequestMapping("addMessageList.action")
	public String addMessageList(Xhmessage message,HttpServletRequest request,Model model,HttpSession session){
		message.setMsginittime(new Date());
		userMessage.addMessageList(message);
		return "/message/queryAllMessage.action";
	}
	
	//通过留言ID删除留言列表信息
	@RequestMapping("deleteMessageList.action")
	public String deleteMessageList(int id){
		userMessage.deleteMessageListByPrimaryKey(id);;
		return "/message/queryAllMessage.action";
	}
	
	//通过留言ID清空留言内容
	@RequestMapping("cleanMessageContext.action")
	public String cleanMessageContext(int id){
		userMessage.cleanMessageContext(id);
		return "/message/queryAllMessage.action";
	}
	
	//通过留言ID清空留言内容
	@RequestMapping("cleanMessage.action")
	public String cleanMessage(int id){
		userMessage.cleanMessage(id);
		return "/message/queryAllMessage.action";
	}

	//通过留言ID更新留言内容
	@RequestMapping("updateMessage.action")
	public String updateMessage(Xhmessage message){
		message.setMsginittime(new Date());
		userMessage.updateMessageByPrimaryKey(message);
		return "/message/queryAllMessage.action";
	}
}
