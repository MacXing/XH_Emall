package com.other.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.xh.back.bean.Xhadmin;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
				//要获取请求的URL
				//登录的action是不能拦截的
				// /user/queryAllUser.action
				String uri = request.getRequestURI();
				if(uri.indexOf("checkAdmin.action") > 0 || uri.indexOf("imageCode.action")>0){
				//登录
					return true;
				}
				// 验证是否已经登录
				HttpSession session = request.getSession();
				Xhadmin admin = (Xhadmin) session.getAttribute("admin");
				if(admin != null){
					return true;
				}
				//肯定就不放行
				request.getRequestDispatcher("/jsp/back/loginbackstage.jsp").forward(request, response);
				return false;
	}

}
