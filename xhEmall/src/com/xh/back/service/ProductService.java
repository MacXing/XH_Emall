package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhproduct;

public interface ProductService {
	
	/**
	 * 商品信息的管理
	 * 
	 * */
	public List<Xhproduct> selectAllProducts();
	
	public void insertProduct(Xhproduct product);
	
	public Xhproduct selectProductById(int id);
	
	public Xhproduct selectProductByName(String name);
	
	public void updateProductById(Xhproduct product);
	
	public void deleteProductById(int id);
	//商品名字模糊查询
	public Xhproduct selectProductByNameLike(String name);
	
}
