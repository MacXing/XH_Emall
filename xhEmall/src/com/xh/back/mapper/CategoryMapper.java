package com.xh.back.mapper;

import java.util.List;
import com.xh.back.bean.Xhcategory;


public interface CategoryMapper {
	/**
	 * 查询所有的分类情况
	 * @return
	 */
	public List<Xhcategory> categoryList();
	/**
	 * 查询所有的分类
	 * @return
	 */
  public List<List<Xhcategory>> queryAllCategory();
  /**
   * 通过类型等级查询所有的类型
   * @return
   */
  public List<Xhcategory> queryCategoryByGrade(int grade);
  
  /**
   * 通过id查分类
   * @return
   */
  
  public Xhcategory queryCategoryById(int id);
  
  /**
   * 添加一个分类
   * @param category
   */
  public void insertCategory(Xhcategory category);
  /**
   * 根据id来删除分类
   * @param id
   */
  public void deleteCategoryById(int id);
  
  /**
   * 根据id来更新表格
   * @param id
   */
  public void updateCategoryById(int id);
  
}