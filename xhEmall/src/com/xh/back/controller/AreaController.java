package com.xh.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.back.bean.Xhareas;
import com.xh.back.service.AreaService;


@Controller
@RequestMapping("area")
public class AreaController {
	
	@Autowired
	@Qualifier("areaService")
	private AreaService areaService;
	
	@RequestMapping("selectAllarea")
	public String seleteAll(Model model){
		System.out.println("area1");
		List<Xhareas> area = areaService.selectAllarea();
		
		model.addAttribute("area",area);
		System.out.println("area2");
		return "/jsp/back/area/area.jsp";
		
	} 
}
