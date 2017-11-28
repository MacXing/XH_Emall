package com.xh.back.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.sun.mail.iap.Response;
import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.back.bean.dataAnalysis.Count;
import com.xh.back.service.CountService;
import com.xh.back.service.RepertoryService;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

@Controller
@RequestMapping("count")
public class CountController {
	@Autowired
	@Qualifier("countService")
	private CountService countService;
	
	@RequestMapping("incomeCount.action")
	@ResponseBody
	public Count incomeCount(){		
		int income = countService.incomeCount();
		int incomeday = countService.incomeCountDay();
		int orderCountNum = countService.orderCountNum();

		java.text.DecimalFormat df = new java.text.DecimalFormat("###.00"); 
		String incomePercent = df.format((income/200000.00)*100);
		
		Count count = new Count();
		count.setIncomeCount(income);
		count.setIncomeCountDay(incomeday);
		count.setIncomePercent(incomePercent);
		count.setOrderCountNum(orderCountNum);
				
		return count;
	}
	
	@RequestMapping("orderCount.action")
	@ResponseBody
	public List<Count> orderCount(){
		return countService.orderCount();
	}
	
}
