package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.dataAnalysis.DataGrade;
import com.xh.back.bean.dataAnalysis.DataOrder;
import com.xh.front.bean.Xhusers;

public interface DataAnalysisMapper {
	/**
	 * 数据分析
	 * **/
	//会员统计
	public List<DataGrade> queryAllDataGrade();
	public List<DataGrade> queryGradeCount();
	public List<DataGrade> queryUserGradeCount();
	
	//全国订单分布
	public List<DataOrder> queryProvinceOrder();
	
	//各邮寄方式所占比
	public List<DataOrder> queryExpressDataStat();
 }
