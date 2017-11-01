package com.xh.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.back.bean.Xhbrand;
import com.xh.back.serviceImpl.BrandServiceImpl;


@Controller
@RequestMapping("brand")
public class BrandController {
	
	@Autowired
	@Qualifier("brandService")
	private BrandServiceImpl brandService;
	
	@RequestMapping("queryAllBrands.action")
	@ResponseBody
	public Msg queryAllBrands(Model model){
		List<Xhbrand> brands = brandService.queryAllBrands();
		return Msg.success().add("brands", brands);
	}
}
