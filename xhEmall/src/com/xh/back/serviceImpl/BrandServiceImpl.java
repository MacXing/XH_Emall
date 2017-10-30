package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.xh.back.bean.Xhbrand;
import com.xh.back.mapper.BrandMapper;
import com.xh.back.service.BrandService;
/**
 * 
 * 
 * */
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	@Qualifier("brandMapper")
	private BrandMapper brandMapper;

	@Override
	public List<Xhbrand> queryAllBrands() {
		
		return brandMapper.queryAllBrands();
	}

	@Override
	public Xhbrand queryBrand(int id) {
		
		return brandMapper.queryBrandById(id);
	}

}
