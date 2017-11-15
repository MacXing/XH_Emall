package com.xh.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.front.bean.Navbar;
import com.xh.front.service.NavbarService;
import com.xh.front.serviceImpl.NavbarServiceImpl;

@Controller
@RequestMapping("home")

public class IndexController {
	@Autowired
	@Qualifier("navbarService")
	private NavbarServiceImpl navbarService;
	
	@RequestMapping("home.action")
	@ResponseBody
	public Msg home(Model model){
		List<Navbar> navbars = navbarService.queryAllNavbar();
		if(navbars!=null){
			return Msg.success().add("navbars", navbars);
		}
		return Msg.fail();
	}
	
	
}
