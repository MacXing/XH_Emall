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
	public void viewOrder(
			HttpServletResponse rep,
			Integer orderid)
					throws AlipayApiException, IOException{
		Xhorderinfo xhorderinfo = paySercice.queryOrderById(orderid);
		System.out.println(xhorderinfo);
		
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        
        String out_trade_no = xhorderinfo.getOrderid().toString();
        
        String total_amount = ""+xhorderinfo.getPayfee();
        
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
	
	@RequestMapping("notify_url.action")
    public String notifyUrl(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, IOException{
        //获取支付宝POST过来反馈信息
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,AlipayConfig.sign_type);
        if(signVerified) {
        	System.out.println("*********************************************");
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("trade_no", trade_no);
            request.setAttribute("total_amount", total_amount);

            /*log.info("订单处理：系统订单号" + out_trade_no + "支付宝交易号：" + trade_no);*/
            //系统处理根据支付宝回调更改订单状态或者其他关联表的数据
            Integer orderid = new Integer(out_trade_no);
            Xhorderinfo order = paySercice.queryOrderById(orderid);
            
            String price = Double.toString(order.getPayPrice());
            
            if(order == null){
            	response.getWriter().write("fail");
                return "/jsp/front/pay.jsp";
            }else{
                /*if(!price.equals(total_amount)){
                    signVerified = false;
                    request.setAttribute("signVerified", signVerified); 
                    request.setAttribute("reason", "付款金额不对");
                    return "notify_url";
                }*/
                if(order.getPaystatus() == 1){//判断当前订单是否已处理，避免重复处理
                    /*log.info("系统订单："+ out_trade_no + "无需重复处理。");*/
                	response.getWriter().write("repetition");
                    return "/jsp/front/pay.jsp";
                }else{
                    order.setPaystatus(1);//修改订单状态为已支付
                    System.out.println("-----------------------------------------------------------------------");
                    System.out.println(order);
                    paySercice.updatePayStatus(order);
                    
                    /*Date payedAt = new Date();*/
                    /*order.setTransactionId(trade_no);*/
                    /*order.setPayedAt(payedAt);*/
                    /*payService.payOrder(order);*/
                    /*log.info("系统订单："+ out_trade_no + "成功支付。");*/
                }
            }
        }else{
        	response.getWriter().write("fail");
            return "/jsp/front/pay.jsp";
        }       
        
        response.getWriter().write("success");
        return "/jsp/front/pay.jsp";
    }
	
	
	
}
