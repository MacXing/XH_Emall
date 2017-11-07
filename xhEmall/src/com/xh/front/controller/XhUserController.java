package com.xh.front.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.currency.Const;
import com.other.currency.ServiceResponse;
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
	// 登录
	@RequestMapping(value = "login.action", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<Xhusers> login(String username, String userpassword, HttpSession session){
		ServiceResponse<Xhusers> response = xhUserService.login(username, userpassword);
		if(response.isSuccess()){
			session.setAttribute(Const.CURRENT_USER, response.getData());
		}
		return response;
	}
	
	// 退出登录
	@RequestMapping(value = "logout.action", method = RequestMethod.GET)
    @ResponseBody
    public ServiceResponse<String> logout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return ServiceResponse.createBySuccess();
    }
	
	// 检查参数
	@RequestMapping(value = "checkValid.action", method = RequestMethod.GET)
	@ResponseBody
	public ServiceResponse<String> checkValid(String str, String Type){
		return xhUserService.checkValid(str, Type);
	}
	
	// 注册
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> register(Xhusers user){
		return xhUserService.register(user);
	}
	
	// 获取登录用户信息
	@RequestMapping(value = "getUserInfo.action", method = RequestMethod.GET)
    @ResponseBody
    public ServiceResponse<Xhusers> getUserInfo(HttpSession session){
		Xhusers user = (Xhusers) session.getAttribute(Const.CURRENT_USER);
		if(user != null){
			return ServiceResponse.createBySuccess(user);
		}
		return ServiceResponse.createByErrorMassage("用户未登录，无法获得当前信息");
	}
	
	// 获取问题
	@RequestMapping(value = "forgetGetQuestion.action", method = RequestMethod.GET)
    @ResponseBody
    public ServiceResponse<String> forgetGetQuestion(String username){
        return xhUserService.selectGetQuestion(username);
    }
	
	// 校验问题和答案
	@RequestMapping(value = "forgetCheckAnswer.action", method = RequestMethod.POST)
    @ResponseBody
	public ServiceResponse<String> forgetCheckAnswer(String username, String question, String answer){
        return xhUserService.checkAnswer(username, question, answer);
    }
	
	// 更改密码
	@RequestMapping(value = "forgetRestPassword.action", method = RequestMethod.POST)
    @ResponseBody
	public ServiceResponse<String> forgetRestPassword(String username, String passwordNew, String forgetToken){
		return xhUserService.forgetRestPassword(username, passwordNew, forgetToken);
	}
}
