package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhproduct;
/**
 * 商品信息的管理
 * 
 * */
public interface ProductMapper {
	
	public List<Xhproduct> selectAllProducts();

	public void insertProduct(Xhproduct product);
	
	public Xhproduct selectProductById(int id);
	
	public Xhproduct selectProductByName(String name);
	
	public void updateProductById(Xhproduct product);
	
	public void deleteProductById(int id);
	
	public Xhproduct selectProductByNameLike(String name);
	
}
