package com.xh.back.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getImage.FileUtil;
import com.other.msg.Msg;
import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhproduct;
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
	public Msg insertBrand(Xhbrand brand,HttpServletRequest request){
		if(brand.getBrandname()!=null&&brand!=null){
			brandService.insertBrand(brand);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	
	@RequestMapping("updateBrand.action")
	@ResponseBody
	public Msg updateBrandById(Xhbrand brand,MultipartFile file,HttpServletRequest request) throws Exception{
		String url="";
		String pathname="";
		if(brand.getBrandid()>0){
			Xhbrand br=brandService.queryBrand(brand.getBrandid());
			if(br.getImage()!=null){
				url=br.getImage();
			}
			pathname =br.getBrandid()+"";
		}
		if(!url.equals("")){
			String urlpath = request.getServletContext().getRealPath(url);
			FileUtil.deleteFile(urlpath);				
		}
		if(brand!=null){
			if(file!=null){
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					Msg.fail();					
				}
				String savePath = request.getServletContext().getRealPath("/upload/brand/"+pathname);			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				url="/upload/brand/"+pathname+"/"+file_name;	
			}
			brand.setImage(url);
			brandService.updateBrandById(brand);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("deleteBrand.action")
	@ResponseBody
	public Msg deleteBrandById(int id,HttpServletRequest request) throws Exception{
		String url ="";
		if(id>0){
			url = brandService.queryBrand(id).getImage();
			if(!url.equals("")){
				String urlpath = request.getServletContext().getRealPath(url);
				FileUtil.deleteFile(urlpath);	
			}
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
