package com.xh.back.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.back.bean.Xhcategory;
import com.xh.back.serviceImpl.CategoryServiceImpl;

@Controller
@RequestMapping("category")
public class CategoryController {

	@Autowired
	@Qualifier("categoryService")
	private CategoryServiceImpl categoryService;
	
	@RequestMapping("queryAllCategory.action")
	public String queryAllCategory(Model model){
		List<List<Xhcategory>> categorys = categoryService.queryAllCategory();
		
		model.addAttribute("categoryList", categorys);
		
		return "/jsp/back/category/queryAllCategory.jsp";
	}
	
	@RequestMapping("queryAllCategoryForJson.action")
	@ResponseBody
	public Msg queryAllCategoryForJson(){
		
		List<List<Xhcategory>> categoryList = categoryService.queryAllCategory();
		if(categoryList!=null){
			
			return Msg.success().add("categoryList", categoryList);
			
		}
			return Msg.fail();	
	}
	
	@RequestMapping("queryCategoryById.action")
	@ResponseBody
	public Msg queryAllCategoryByGrade(int id){
		Xhcategory category = categoryService.queryCategoryById(id);
		if(category!=null){
			return Msg.success().add("category", category);
		}
		return Msg.fail();
		
	}
	
	@RequestMapping("insertCategory.action")
	@ResponseBody
	public Msg insertCatepory(Xhcategory category){
		System.out.println(category);
		if(category.getCatname()!=null&&(!category.getCatname().equals(""))){
			categoryService.insertCategory(category);
			return Msg.success();
		}	
		return Msg.fail();
	}
	
	
	@RequestMapping("deleteCategory.action")
	@ResponseBody
	public Msg deleteCategoryById(int id){
		if(id>1){
			categoryService.deleteCategoryById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("updateCategory.action")
	@ResponseBody
	public Msg updateCategoryById(int id){
		if(id>1){
			categoryService.updateCategoryById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
}
