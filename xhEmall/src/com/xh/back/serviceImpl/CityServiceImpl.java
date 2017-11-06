package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;





import com.xh.back.bean.Xhcities;

import com.xh.back.mapper.CityMapper;
import com.xh.back.service.CityService;



public class CityServiceImpl implements CityService{
	@Autowired
	@Qualifier("cityMapper")
	private CityMapper cityMapper;
	
	@Override
	public List<Xhcities> selectAllcity(){
		List<Xhcities> city = cityMapper.selectAllcity();
		return city;		
	} 
	
}
