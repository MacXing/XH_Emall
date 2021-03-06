package com.other.util;
//接口类型：互亿无线触发短信接口，支持发送验证码短信、订单通知短信等。
// 账户注册：请通过该地址开通账户http://sms.ihuyi.com/register.html
// 注意事项：
//（1）调试期间，请用默认的模板进行测试，默认模板详见接口文档；
//（2）请使用APIID（查看APIID请登录用户中心->验证码短信->产品总览->APIID）及 APIkey来调用接口；
//（3）该代码仅供接入互亿无线短信接口参考使用，客户可根据实际需要自行编写；

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import com.xh.back.bean.Message;
import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

import com.other.util.StringUtil;

public class sendsms {
	
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	/*private static String Url = "http://www.ihuyi.com/demo/sms/java.html";*/
	private	HttpClient client = new HttpClient();
	private PostMethod method = new PostMethod(Url);	
		 
	public Message sendMsg(String phone){
		
		client.getParams().setContentCharset("GBK");
		Message message = new Message();
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");
		int mobile_code = (int)((Math.random()*9+1)*100000);
		
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

	    NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "C11965327"), 
			    new NameValuePair("password", "8d0fded6d8d7a9e2a74113656fc5268e "),
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile",phone), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			//流水号
			String smsid = root.elementText("smsid");

			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			message.setCode(code);
			message.setMobile_code(mobile_code);
			 if("2".equals(code)){
				System.out.println("手机发送成功");
			}

		} catch (HttpException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (DocumentException e) {
			
			e.printStackTrace();
		}	
		return message;
	}
		
	}
			