package com.xh.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.front.bean.UserAddress;
import com.xh.front.serviceImpl.UserAddressServiceImpl;

@Controller
@RequestMapping("userAddress")
public class UserAddressController {
    @Autowired
    @Qualifier("userAddressService")
    private UserAddressServiceImpl userAddressService;
    
    @RequestMapping("queryAllUserAddress.action")
    public String  queryAllUserAddressByUser(Model model){
    	UserAddress ua= userAddressService.queryAllUserAddressByUser(1);
    	System.out.println("---------->"+ua);
    	model.addAttribute("ua", ua);
    	return "/front/BuyCar_Two.jsp";
    }
}
