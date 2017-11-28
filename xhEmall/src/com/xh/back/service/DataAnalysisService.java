package com.xh.back.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.dataAnalysis.DataGrade;
import com.xh.back.bean.dataAnalysis.DataOrder;
import com.xh.front.bean.Xhusers;

public interface DataAnalysisService {
	/**
	 * 数据分析接口
	 * **/
	public List<DataGrade> queryAllDataGrade();
	public List<DataGrade> queryGradeCount();
	public List<DataGrade> queryUserGradeCount();
	
	public List<DataOrder> queryProvinceOrder();
	
	public List<DataOrder> queryExpressDataStat();
}
