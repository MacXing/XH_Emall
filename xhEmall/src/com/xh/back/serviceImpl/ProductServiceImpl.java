package com.xh.back.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhproduct;
import com.xh.back.mapper.ProductMapper;
import com.xh.back.service.ProductService;

public class ProductServiceImpl implements ProductService{
	
	@Autowired
	@Qualifier("productMapper")
	private ProductMapper productMapper;
	
	@Override
	public void insertProduct(Xhproduct product) {
		
		productMapper.insertProduct(product);
	}

	@Override
	public Xhproduct selectProductById(int id) {
		
		return productMapper.selectProductById(id);
	}

	@Override
	public Xhproduct selectProductByName(String name) {
		
		return productMapper.selectProductByName(name);
	}

	@Override
	public void updateProductById(Xhproduct product) {
		
		productMapper.updateProductById(product);
	}

	@Override
	public void deleteProductById(int id) {
		
		productMapper.deleteProductById(id);
		
	}

	@Override
	public Xhproduct selectProductByNameLike(String name) {
		
		return productMapper.selectProductByNameLike(name);
	}

	@Override
	public List<Xhproduct> selectAllProducts(int is) {
		
		return productMapper.selectAllProducts(is);
	}

	@Override
	public void updatePrductIsDeleteById(int id) {
		
		productMapper.updatePrductIsDeleteById(id);	
	}

	@Override
	public void updatePrductDeleteById(int id) {
		productMapper.updatePrductDeleteById(id);
	}

	@Override
	public void insertImage(ProductImage productImage) {
		productMapper.insertImage(productImage);
	}

}
