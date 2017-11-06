package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhprovinces;
import com.xh.back.mapper.ProvinceMapper;
import com.xh.back.service.ProvinceService;




public class ProvinceServiceImpl implements ProvinceService{
	@Autowired
	@Qualifier("provinceMapper")
	private ProvinceMapper provinceMapper;
	
	@Override
	public List<Xhprovinces> selectAllprovince(){
		List<Xhprovinces> province = provinceMapper.selectAllprovince();
		return province;		
	} 
	
}
