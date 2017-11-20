package com.xh.front.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayRequest;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.getip.GetIp;
import com.other.pay.AlipayConfig;
import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhproduct;
import com.xh.back.service.ProductService;
import com.xh.front.bean.Xhusers;
import com.xh.front.service.PaySercice;
import com.xh.front.service.ProductDetailsService;
import com.xh.front.service.ProductListService;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("Pay")
public class PayController {
	@Autowired
	@Qualifier("paySercice")
	private PaySercice paySercice;				
	
	@RequestMapping("viewOrder.action")
	public void viewOrder(Model model,HttpServletRequest req,
			HttpServletResponse rep
			/*@RequestParam(value="1",required=true)Integer orderid*/)
					throws AlipayApiException, IOException{
		Xhorderinfo xhorderinfo = paySercice.queryOrderById(15);
		System.out.println(xhorderinfo);
		
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        
        String out_trade_no = xhorderinfo.getOrderid().toString();
        
        String total_amount = ""+xhorderinfo.getPayPrice();
        
        String subject = xhorderinfo.getAddusername()+"的订单";
        
        String body = "";
        
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
                + "\"total_amount\":\""+ total_amount +"\"," 
                + "\"subject\":\""+ subject +"\"," 
                + "\"body\":\""+ body +"\"," 
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        
        rep.setContentType("text/html;charset=" + AlipayConfig.charset);
        rep.getWriter().write(result);//直接将完整的表单html输出到页面
        rep.getWriter().flush();
        rep.getWriter().close();
	}
	
	
	
}
