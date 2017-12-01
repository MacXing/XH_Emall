package com.xh.back.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.other.msg.Msg;
import com.other.seclogin_test.BaiduTJUtil;


@Controller
@RequestMapping("report")
public class SiteReportController {
	private Date date=new Date();
	private Date yesterday = new Date(date.getTime() - 86400000L);
	
	@RequestMapping("overview.action")
	@ResponseBody
	public JSONObject overview(){
		
		/*System.out.println(new SimpleDateFormat("yyyyMMdd").format(date));*/
		
		/*System.out.println(new SimpleDateFormat("yyyyMMdd").format(yesterday));*/
		
		JSONObject json = BaiduTJUtil.getData("11452953", "overview/getTimeTrendRpt", new SimpleDateFormat("yyyyMMdd").format(yesterday),new SimpleDateFormat("yyyyMMdd").format(date), "pv_count,visitor_count,ip_count,avg_visit_time","hour");
		return json;
	}
	
	
	@RequestMapping("trend.action")
	@ResponseBody
	public Msg trend(){		
		JSONObject json = BaiduTJUtil.getData("11452953", "trend/time/a",new SimpleDateFormat("yyyyMMdd").format(date),new SimpleDateFormat("yyyyMMdd").format(date),"pv_count,visitor_count,visitorip_count,avg_visit_pages","hour");
		JSONObject json2 = BaiduTJUtil.getData("11452953", "trend/time/a",new SimpleDateFormat("yyyyMMdd").format(yesterday),new SimpleDateFormat("yyyyMMdd").format(yesterday),"pv_count,visitor_count,visitorip_count,avg_visit_pages","hour");
		List<JSONObject> jsons= new ArrayList<>();
		jsons.add(json);
		jsons.add(json2);
		return Msg.success().add("data", jsons);
	}
	
	@RequestMapping("area.action")
	@ResponseBody
	public JSONObject area(){		
		JSONObject json = BaiduTJUtil.getData("11452953", "overview/getDistrictRpt",new SimpleDateFormat("yyyyMMdd").format(date),new SimpleDateFormat("yyyyMMdd").format(date), "pv_count","");
		return json;
	}
	
	@RequestMapping("page.action")
	@ResponseBody
	public JSONObject page(){		
		JSONObject json = BaiduTJUtil.getData("11452953", "overview/getCommonTrackRpt ",new SimpleDateFormat("yyyyMMdd").format(date),new SimpleDateFormat("yyyyMMdd").format(date), "pv_count","");
		return json;
	}
	
	
	
}
