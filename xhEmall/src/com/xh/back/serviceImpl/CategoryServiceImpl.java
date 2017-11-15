package com.xh.back.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Category_Product;
import com.xh.back.bean.Xhcategory;
import com.xh.back.mapper.CategoryMapper;
import com.xh.back.service.CategoryService;
/**
 * 分类模块
 * 
 * */
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	@Qualifier("categoryMapper")
	private CategoryMapper categoryMapper;
	
	@Override
	public List<List<Xhcategory>> queryAllCategory() {
		// 查询所有的分类
		return categoryMapper.queryAllCategory();
	}

	@Override
	public List<Xhcategory> queryCategoryByGrade(int grade) {
		// 通过等级查询所有分类
		return categoryMapper.queryCategoryByGrade(grade);
	}

	@Override
	public Xhcategory queryCategoryById(int id) {
		// 通过id查询所有分类
		return categoryMapper.queryCategoryById(id);
	}

	@Override
	public void insertCategory(Xhcategory category) {
		categoryMapper.insertCategory(category);
		
	}

	@Override
	public void deleteCategoryById(int id) {
		categoryMapper.deleteCategoryById(id);
	}

	@Override
	public void updateCategoryById(Xhcategory category) {
		categoryMapper.updateCategoryById(category);
	}

	@Override
	public List<Xhcategory> categoryList() {
		
		return categoryMapper.categoryList();
	}

	@Override
	public List<Category_Product> queryAllCP() {
		
		return categoryMapper.queryAllCP();
	}

	@Override
	public List<Category_Product> queryALLCPById(int id) {
		
		return categoryMapper.queryALLCPById(id);
	}

	@Override
	public void insertCP(Category_Product cp) {
		
		categoryMapper.insertCP(cp);
	}
	
	public void deleteCP(int id) {
		
		categoryMapper.deleteCP(id);
	}
	
	
}
