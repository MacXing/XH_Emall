package com.xh.back.serviceImpl;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	public void updateCategoryById(int id) {
		categoryMapper.updateCategoryById(id);
	}
	
	
}
