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
import com.xh.back.bean.Xhbrand;
import com.xh.back.serviceImpl.BrandServiceImpl;


@Controller
@RequestMapping("brand")
public class BrandController {
	
	@Autowired
	@Qualifier("brandService")
	private BrandServiceImpl brandService;
	
	@RequestMapping("queryAllBrands.action")
	public String queryAllBrands(Model model){
		List<Xhbrand> brands = brandService.queryAllBrands();
		model.addAttribute("brands", brands);
		return "/jsp/back/brand/queryAllBrands.jsp";
	}	
	
	@RequestMapping("insertBrand.action")
	@ResponseBody
	public Msg insertBrand(Xhbrand brand){
		if(brand.getBrandname()!=null && brand.getBranddesc()!=null){
			brandService.insertBrand(brand);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	
	@RequestMapping("updateBrand.action")
	@ResponseBody
	public Msg updateBrandById(Xhbrand brand){
		if(brand!=null){
			brandService.updateBrandById(brand);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("deleteBrand.action")
	@ResponseBody
	public Msg deleteBrandById(Integer id){
		if(id!=null && id>0){
			brandService.deleteBrandById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("queryBrandById.action")
	@ResponseBody
	public Msg queryBrandById(Integer id){
		if(id!=null && id>0){
			Xhbrand brand = brandService.queryBrand(id);
			return Msg.success().add("brand", brand);
		}
		return Msg.fail();
	}
	
	@RequestMapping("queryAllBrandsForJson.action")
	@ResponseBody
	public Msg queryAllBrandsForJson(){
		List<Xhbrand> brands = brandService.queryAllBrands();
		if(brands!=null){
			return Msg.success().add("brands", brands);
		}
		return Msg.fail();
	}	
}
