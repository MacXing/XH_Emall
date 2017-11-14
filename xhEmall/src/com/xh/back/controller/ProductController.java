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
import com.xh.back.bean.ProductImage;
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
		products=productService.selectAllProducts(0);
		model.addAttribute("products", products);
		return "/jsp/back/product/queryAllProducts.jsp";
	}
	
	@ResponseBody
	@RequestMapping("delectProduct.action")
	public Msg deleteProduct(int id){
		
		if(id>0){
			productService.deleteProductById(id);
			return Msg.success();
		}
		
		return Msg.fail();
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
	
	@RequestMapping("queryAllProductsForJson.action")
	@ResponseBody
	public Msg queryAllProudctsForJson(){
		List<Xhproduct> products = new ArrayList<Xhproduct>();
		products=productService.selectAllProducts(0);
		if(products!=null){
			return Msg.success().add("products", products);
		}
		return Msg.fail();
	}
	
	
	
	@ResponseBody
	@RequestMapping("checkForm.action")
	public Msg deleteImg(HttpServletRequest request,Xhproduct product,String file){
		if(request.getContentType().contains("multipart/form-data")){
			System.out.println(product.getPimg());
			System.out.println(file);
			
			return Msg.fail();
		}
		
		System.out.println(product.getPimg());
		
		return Msg.fail();
	}
	/*
	 * 将商品加入到商品回收站
	 */
	@RequestMapping("updateIsDelete.action")
	@ResponseBody
	public Msg updateIsDeleteById(int id){
		System.out.println(id);
		if(id>0){
			productService.updatePrductIsDeleteById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	/*
	 * 查询商品回收站的所有商品
	 */
	@RequestMapping("queryAllProductsDelete.action")
	public String queryAllProduct(Model model){
		List<Xhproduct> products =  productService.selectAllProducts(1);
		model.addAttribute("products", products);
		return "/jsp/back/productDelete/queryAllProductsDelete.jsp";
	}
	
	/*
	 * 恢复商品回收站的商品
	 */
	@RequestMapping("updateDelete.action")
	@ResponseBody
	public Msg updateDeleteById(int id){
		System.out.println(id);
		if(id>0){
			productService.updatePrductDeleteById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("insertImage.action")
	@ResponseBody
	public Msg insertImageById(ProductImage productImage,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String url = "";
		String pname="";
		String pathname="";
		if(productImage.getPid()>0){
			Xhproduct product = productService.selectProductById(productImage.getPid());
			int pid = product.getPid();
			pname=product.getPname();
			pathname =""+pid;
		}
		if(file!=null){
			System.out.println(productImage);
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				Msg.fail().add("msg", "请上传图片");	
			}
			String savePath = request.getServletContext().getRealPath("/product/"+pathname);
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			url="/product/"+pathname+"/"+file_name;
		}
		
		productImage.setUrl(url);
		productImage.setPname(pname);
		productService.insertImage(productImage);	
		return Msg.success();
	}
	
	@RequestMapping("queryAllImages.action")
	public String queryAllImages(Model model){
		
		List<ProductImage> productImages=productService.queryAllImages();
		model.addAttribute("productImages", productImages);
		
		return "/jsp/back/product/queryAllImages.jsp";
		
	}
	
	@RequestMapping("deleteImage.action")
	@ResponseBody
	
	public Msg deleteImage(int id,HttpServletRequest request) throws Exception{
		String url="";
		if(id>0){
			url = productService.queryImageById(id).getUrl();
		}
		if(!url.equals("")){
			String urlpath = request.getServletContext().getRealPath(url);
			FileUtil.deleteFile(urlpath);
			productService.deleteImageById(id);
			return Msg.success();
		}		
		return Msg.fail();
	}
	
}
