package com.xh.back.serviceImpl;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.dataAnalysis.DataGrade;
import com.xh.back.bean.dataAnalysis.DataOrder;
import com.xh.back.bean.dataAnalysis.DataProduct;
import com.xh.back.mapper.DataAnalysisMapper;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.service.DataAnalysisService;
import com.xh.back.service.UserGradeService;
import com.xh.front.bean.Xhusers;

public class DataAnalysisServiceImpl implements DataAnalysisService {

	@Autowired
	@Qualifier("dataAnalysisMapper")
	private DataAnalysisMapper dataAnalysisMapper;

	@Override
	public List<DataGrade> queryAllDataGrade() {
		// TODO Auto-generated method stub
		List<DataGrade> gradeCount=dataAnalysisMapper.queryAllDataGrade();
		return gradeCount;
	}

	@Override
	public List<DataGrade> queryGradeCount() {
		// TODO Auto-generated method stub
		List<DataGrade> gradeCount=dataAnalysisMapper.queryGradeCount();
		return gradeCount;
	}

	@Override
	public List<DataOrder> queryProvinceOrder() {
		// TODO Auto-generated method stub
		List<DataOrder> provinceOrder=dataAnalysisMapper.queryProvinceOrder();
		return provinceOrder;
	}

	@Override
	public List<DataOrder> queryExpressDataStat() {
		// TODO Auto-generated method stub
		List<DataOrder> expStat=dataAnalysisMapper.queryExpressDataStat();
		return expStat;
	}

	@Override
	public List<DataGrade> queryUserGradeCount() {
		// TODO Auto-generated method stub
		List<DataGrade> userCount=dataAnalysisMapper.queryUserGradeCount();
		return userCount;
	}

	@Override
	public List<DataProduct> queryPsaleDataStat() {
		// TODO Auto-generated method stub
		List<DataProduct> saleCount=dataAnalysisMapper.queryPsaleDataStat();
		return saleCount;
	}

}
