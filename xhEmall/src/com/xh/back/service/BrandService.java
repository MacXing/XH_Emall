package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhbrand;


public interface BrandService {
	/**
	 * 品牌信息的管理
	 * 
	 * */
	public List<Xhbrand> queryAllBrands();
	
	public Xhbrand queryBrand(int id);
	
	public void insertBrand(Xhbrand brand);

	public void updateBrandById(Xhbrand brand);
	
	public void deleteBrandById(int id);
	
}
