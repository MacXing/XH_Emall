package com.xh.back.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.back.bean.dataAnalysis.Count;
import com.xh.front.bean.Xhusers;

public interface CountMapper {
	
	public int incomeCount();
	
	public int incomeCountDay();
	
	public List<Count> orderCount();
	
	public int orderCountNum();
}
