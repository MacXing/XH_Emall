package com.xh.back.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.other.getCode.ImageCode;

public class ImageCodeController {
	@RequestMapping("imageCode.action")
	public void ImageCodeController(HttpServletRequest request,HttpServletResponse response) throws IOException{
		ImageCode img = new ImageCode();
		
		BufferedImage bi = img.getImage();
		//将图片上的文本放到session
		request.getSession().setAttribute("session_code", img.getText());
		//将图片以字节流输出到浏览器
		img.output(bi, response.getOutputStream());		
	}
}
