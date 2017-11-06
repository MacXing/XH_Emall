package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhareas;
import com.xh.back.mapper.AreaMapper;
import com.xh.back.service.AreaService;




public class AreaServiceImpl implements AreaService{
	@Autowired
	@Qualifier("areaMapper")
	private AreaMapper areaMapper;
	
	@Override
	public List<Xhareas> selectAllarea(){
		List<Xhareas> area = areaMapper.selectAllarea();
		return area;		
	} 
	
}
