package com.xh.back.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.back.bean.dataAnalysis.Count;
import com.xh.back.mapper.CountMapper;
import com.xh.back.mapper.RepertoryMapper;
import com.xh.back.mapper.XhsalesMapper;
import com.xh.back.service.CountService;
import com.xh.back.service.RepertoryService;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

public class CountServiceImpl implements CountService {
	@Autowired
	@Qualifier("countMapper")
	private CountMapper countMapper;

	@Override
	public int incomeCount() {
		return countMapper.incomeCount();
	}

	@Override
	public int incomeCountDay() {
		return countMapper.incomeCountDay();
	}

	@Override
	public List<Count> orderCount() {
		return countMapper.orderCount();
	}

	@Override
	public int orderCountNum() {
		return countMapper.orderCountNum();
	}

}
