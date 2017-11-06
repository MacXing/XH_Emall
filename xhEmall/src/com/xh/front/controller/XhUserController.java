package com.xh.front.controller;


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
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;
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
		//�û���¼ʱʵ��ʱ����Ϊ�û���¼ʱ��
		Date date = new Date();		
		//��ȡ�û���¼�������֤��
		String code1 = code;	
		//��ȡ�û���¼��ip
		String ip = getIp.getIpAddr(request);		
		System.out.println(code1);
		
		if(user.getUserphone()!=null){
			user.setUserlastip(ip);
			user.setUserlasttime(date);
			//��ѯ�û�������ֻ����������Ƿ���ȷ
			Xhusers users =xhUserService.selectUserByPhone(user);
			if(users != null){
				//��ȡ��֤���ϵ���Ϣ
				//String session_code = (String) request.getSession().getAttribute("session_code");
				if(!code1.equalsIgnoreCase("4At9")){
					return "/jsp/login.jsp";
				}
				//�����û���¼��ip����Ϣ
				xhUserService.updateUserIpAndTime(user);
				//��������ݷ��ظ�ҳ��
				model.addAttribute("users", users);
				return "/jsp/users.jsp";
			}			
		}
		return null;		
	}
	
	
	
}
