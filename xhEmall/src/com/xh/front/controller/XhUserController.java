package com.xh.front.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.currency.Const;
import com.other.currency.ResponseCode;
import com.other.currency.ServerResponse;
import com.other.getip.GetIp;
import com.other.msg.Msg;
import com.other.util.sendsms;
import com.xh.back.bean.Message;
import com.xh.front.bean.Xhusers;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("user")
public class XhUserController {
	
	private Log logger = LogFactory.getLog(this.getClass()); 
	
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
	public ServerResponse<Xhusers> login(String userphone, String userpassword, HttpSession session){
		
		ServerResponse<Xhusers> response = xhUserService.login(userphone, userpassword);
		//Subject subject = SecurityUtils.getSubject();
		if(response.isSuccess()){
			//subject.getSession().setAttribute(Const.CURRENT_USER, response.getData());
			session.setAttribute(Const.CURRENT_USER, response.getData());
			System.out.println(session.getAttribute(Const.CURRENT_USER));
		}
		return response;
	}
	
	// 退出登录
	@RequestMapping(value = "logout.action", method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<String> logout(HttpSession session){
		
        session.removeAttribute(Const.CURRENT_USER);
        return ServerResponse.createBySuccess();
    }
	
	// 检查参数
	@RequestMapping(value = "checkValid.action", method = RequestMethod.GET)
	@ResponseBody
	public ServerResponse<String> checkValid(String str, String Type){
		return xhUserService.checkValid(str, Type);
	}
	
	// 注册
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	@ResponseBody
	public ServerResponse<String> register(Xhusers user, Integer message, HttpSession session){
		
		int msg = (Integer)session.getAttribute("mobile_code");
		if(msg == message ){
			return xhUserService.register(user);
		}
		return ServerResponse.createByErrorMassage("注册失败");
	}
	
	// 获取登录用户信息
	@RequestMapping(value = "getUserInfo.action", method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<Xhusers> getUserInfo(HttpSession session){
		Xhusers user = (Xhusers) session.getAttribute(Const.CURRENT_USER);
		if(user != null){
			return ServerResponse.createBySuccess(user);
		}
		return ServerResponse.createByErrorMassage("用户未登录，无法获得当前信息");
	}
	
	// 获取问题
	@RequestMapping(value = "forgetGetQuestion.action", method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<String> forgetGetQuestion(String userphone){
        return xhUserService.selectGetQuestion(userphone);
    }
	
	// 校验问题和答案
	@RequestMapping(value = "forgetCheckAnswer.action", method = RequestMethod.POST)
    @ResponseBody
	public ServerResponse<String> forgetCheckAnswer(String userphone, String question, String answer){
        return xhUserService.checkAnswer(userphone, question, answer);
    }
	
	// 更改密码
	@RequestMapping(value = "forgetRestPassword.action", method = RequestMethod.POST)
    @ResponseBody
	public ServerResponse<String> forgetRestPassword(String userphone, String passwordNew, String forgetToken){
		return xhUserService.forgetRestPassword(userphone, passwordNew, forgetToken);
	}
	
	// 登录状态修改密码
	@RequestMapping(value = "restPassword.action", method = RequestMethod.POST)
    @ResponseBody
	public ServerResponse<String> restPassword(String passwordNew, String passwordOld, HttpSession session){
		Xhusers user = (Xhusers)session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return xhUserService.restPassword(passwordNew, passwordOld, user.getUserid());
	}
	
	// 登录状态修改手机号码
	@RequestMapping(value = "restPhone.action", method = RequestMethod.POST)
    @ResponseBody
	public ServerResponse<String> restPhone(String userphoneOld, String userphoneNew, HttpSession session){
		Xhusers user = (Xhusers)session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return xhUserService.restPhone(userphoneOld, userphoneNew, user.getUserid());
	}
	
	@RequestMapping("message.action")
	@ResponseBody
	public Msg modifyphone(String phone,HttpServletRequest request){
		sendsms sendsms = new sendsms();
		Message message = sendsms.sendMsg(phone);
		if("2".equals(message.getCode())){
			request.getSession().setAttribute("mobile_code", message.getMobile_code());
			return Msg.success();
		}
		return Msg.fail();
	}
}
