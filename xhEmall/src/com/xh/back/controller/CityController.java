package com.xh.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.back.bean.Xhcities;
import com.xh.back.service.CityService;

@Controller
@RequestMapping("city")
public class CityController {
	
	@Autowired
	@Qualifier("cityService")
	private CityService cityService;
	
	@RequestMapping("selectAllcity")
	public String selectAllcity(Model model){
		System.out.println("city1");
		List<Xhcities> city = cityService.selectAllcity();
		model.addAttribute("city", city);
		return "/jsp/back/area/area.jsp";
		
	}

}
