package com.other.Filter;

import java.io.IOException;

import javax.enterprise.inject.New;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;  
import org.apache.log4j.MDC;  

import com.other.currency.Const;
import com.other.getip.GetIp;
import com.xh.back.bean.Log;
import com.xh.front.bean.Xhusers;

public class ResFilter implements Filter{
	
	private final static double DEFAULT_USERID= Math.random()*100000.0;    
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session= req.getSession();

        if (session==null){  
            MDC.put("userid",DEFAULT_USERID);
            MDC.put("ip",new GetIp().getIpAddr(req));  
        }  
        else{  
            Xhusers user=(Xhusers)session.getAttribute(Const.CURRENT_USER);
            
            if (user==null){
            	
                MDC.put("userid",DEFAULT_USERID);
                MDC.put("ip",new GetIp().getIpAddr(req));  
                
            }  
            else  
            {  
                MDC.put("userid",user.getUserid());  
                MDC.put("ip",new GetIp().getIpAddr(req));  
            }  
        }  
  
       chain.doFilter(request, response);  
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

	
}
