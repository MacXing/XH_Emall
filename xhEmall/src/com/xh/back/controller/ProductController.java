package com.xh.back.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.other.getImage.FileUtil;
import com.other.msg.Msg;
import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.ProductServiceImpl;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	@Qualifier("productService")
	private ProductServiceImpl productService;
	
	@RequestMapping("queryAllProducts.action")	
	public String queryAllProudcts(Model model){
		List<Xhproduct> products = new ArrayList<Xhproduct>();
		products=productService.selectAllProducts();
		model.addAttribute("products", products);
		return "/jsp/back/product/queryAllProducts.jsp";
	}
	
	@RequestMapping("delectProduct.action")
	public String deleteProduct(Model model,int id){
		productService.deleteProductById(id);
		return "/product/queryAllProducts.action";
	}
	
	@ResponseBody
	@RequestMapping("queryProductById.action")
	public Xhproduct queryProductById(int id){
		Xhproduct product = productService.selectProductById(id);		
		return product;
	}
	
	@ResponseBody
	@RequestMapping("insertProductAndFile.action")
	public Msg insertProductAndFileById(Xhproduct product,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				Msg.fail();
				
			}
			String savePath = request.getServletContext().getRealPath("/upload");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			product.setPimg(file_name);
		}
		product.setPaddtime(new Date());
		
		productService.insertProduct(product);
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("insertProduct.action")
	public Msg insertProductById(Xhproduct product){
		if(product!=null){
			product.setPaddtime(new Date());
			productService.insertProduct(product);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	
	@ResponseBody
	@RequestMapping("updateProductAndFile.action")
	public Msg updateProductAndFile(Xhproduct product,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(product!=null){
			System.out.println(product);
			if(file!=null){
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					Msg.fail();					
				}
				String savePath = request.getServletContext().getRealPath("/upload");			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				product.setPimg(file_name);
			}
			product.setPupdatetime(new Date());
			productService.updateProductById(product);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("updateProduct.action")
	public Msg updateProduct(Xhproduct product) throws IllegalStateException, IOException{
		if(product!=null){
			product.setPupdatetime(new Date());
			productService.updateProductById(product);
			return Msg.success();
		}
		return Msg.fail();
	}
	

	@RequestMapping("uploadimg.action")
	public Msg uploadImg(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/upload");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			return Msg.success().add("filename",file_name);
		}	
		return Msg.fail();
	}	
	
	@ResponseBody
	@RequestMapping("checkForm.action")
	public Msg deleteImg(HttpServletRequest request,Xhproduct product,String file){
		if(request.getContentType().contains("multipart/form-data")){
			System.out.println(product.getPimg());
			System.out.println(file);
			/*return "forward:/product/insertProductAndFile.action";*/
			return Msg.fail();
		}
		
		System.out.println(product.getPimg());
		/*return "forward:/product/insertProduct.action";*/
		return Msg.fail();
	}
}
