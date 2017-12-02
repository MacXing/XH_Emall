package com.xh.back.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xh.back.bean.dataAnalysis.Count;
import com.xh.back.service.CountService;

@Controller
@RequestMapping("indexCount")
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
		String incomePercent = df.format((income/2000000.00)*100);
		String orderPercent = df.format((orderCountNum/10000.00)*100);
		
		Count count = new Count();
		count.setIncomeCount(income);
		count.setIncomeCountDay(incomeday);
		count.setIncomePercent(incomePercent);
		count.setOrderCountNum(orderCountNum);
		count.setOrderPercent(orderPercent);
				
		return count;
	}
	
	@RequestMapping("orderCount.action")
	@ResponseBody
	public List<Count> orderCount(){
		return countService.orderCount();
	}
	
	@RequestMapping("orderCountForPie")
	@ResponseBody
	public List<Count> orderCountForPie(){
		return countService.orderCountForPie();
	}
	
}
