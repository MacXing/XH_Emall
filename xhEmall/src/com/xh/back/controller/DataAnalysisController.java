package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getip.GetIp;
import com.other.msg.Msg;
import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.dataAnalysis.DataGrade;
import com.xh.back.bean.dataAnalysis.DataOrder;
import com.xh.back.bean.dataAnalysis.DataProduct;
import com.xh.back.service.DataAnalysisService;
import com.xh.back.service.UserGradeService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("analysis")
public class DataAnalysisController {
	@Autowired
	@Qualifier("gradeCountService")
	private DataAnalysisService gradeCountService;
	
	//统计所有等级会员
	@RequestMapping("gradeCount")
	@ResponseBody
	public List<DataGrade> gradeCount(HttpSession session){
		List<DataGrade> gradeCounts=gradeCountService.queryGradeCount();
		return gradeCounts;
	}
	
	//统计所有订单分布
	@RequestMapping("orderCount")
	@ResponseBody
	public List<DataOrder> orderCount(HttpSession session){
		List<DataOrder> orderCounts=gradeCountService.queryProvinceOrder();
		return orderCounts;
	}
	
	//统计所有快递分布
	@RequestMapping("expressCount")
	@ResponseBody
	public List<DataOrder> expressCount(HttpSession session){
		List<DataOrder> expCounts=gradeCountService.queryExpressDataStat();
		return expCounts;
	}
	
	//统计所有订单分布
	@RequestMapping("userCount")
	@ResponseBody
	public List<DataGrade> userCount(HttpSession session){
		List<DataGrade> userCounts=gradeCountService.queryUserGradeCount();
		return userCounts;
	}
	
	//前一周商品销量排行
	@RequestMapping("saleCount")
	@ResponseBody
	public List<DataProduct> saleCount(HttpSession session){
		List<DataProduct> saleCounts=gradeCountService.queryPsaleDataStat();
		return saleCounts;
	}
}
