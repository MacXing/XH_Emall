package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhbrand;

public interface BrandMapper {
	/**
	 * 商品品牌管理
	 * **/
	public List<Xhbrand> queryAllBrands();
	
	public Xhbrand queryBrandById(int id);
	
	public void insertBrand(Xhbrand brand);
	
	public void updateBrandById(Xhbrand brand);
	
	public void deleteBrandById(int id);

}
