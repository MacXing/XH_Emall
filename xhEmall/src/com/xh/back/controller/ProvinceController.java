package com.xh.back.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.back.bean.Xhcities;
import com.xh.back.bean.Xhprovinces;
import com.xh.back.service.ProvinceService;

@Controller
@RequestMapping("province")
public class ProvinceController {
	@Autowired
	@Qualifier("provinceService")
	private ProvinceService provinceServince;
	
	@RequestMapping("selectAllprovince")
	public String selectAllprovince(Model model){
		System.out.println("province");
		List<Xhprovinces> province = provinceServince.selectAllprovince();
		model.addAttribute("province", province);
		System.out.println(province);
		return "/jsp/back/area/area.jsp";
	}
	@RequestMapping("querycity")
	public String querycity(Model model,HttpServletResponse response ,HttpServletRequest request) throws IOException{
		List<Xhprovinces> province = provinceServince.selectAllprovince();
		List<Xhcities> xhcities=new ArrayList<>();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String city=request.getParameter("city");
		city = new String(city.getBytes("ISO8859-1"),"UTF-8");
		for(Xhprovinces p:province){
			if(p.getProvince().equals(city)){
				for(Xhcities c:p.getCities()){
					xhcities.add(c);
				}
		}
			}
		ObjectMapper objectMapper=new ObjectMapper();
		String reslut=objectMapper.writeValueAsString(xhcities);
		response.setCharacterEncoding("utf-8");
		response.setContentType("/Javascript,charse=UTF-8");
		response.getWriter().print(reslut);
		System.out.println(reslut);
		return null;
	}
	

}
