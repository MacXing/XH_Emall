package com.other.shiro;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class CustomFormAuthenticationFilter{

	//原FormAuthenticationFilter的认证方法
	public boolean modifyCode(String code,HttpServletRequest request){
		//在这里进行验证码的校验
		//从session获取正确验证码
		
		HttpSession session =request.getSession();
		//取出session的验证码（正确的验证码）
		String validateCode = (String) session.getAttribute("validateCode");
		
		//取出页面的验证码
	 
		String randomcode = code;
	
		
		if(randomcode!=null && validateCode!=null && !randomcode.equals(validateCode)){
			//如果校验失败，放回false
			
			return false; 
		}
		return true;
	}

		
}
