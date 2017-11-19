package com.xh.front.controller;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.tags.EscapeBodyTag;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.other.getImage.FileUtil;
import com.other.msg.Msg;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.CommentServiceImpl;
import com.xh.front.bean.Xhusers;
import com.xh.front.serviceImpl.UserCommentServiceImpl;

@Controller
@RequestMapping("userComment")
public class UserCommentController {
	@Autowired
	@Qualifier("userCommentService")
	private UserCommentServiceImpl userCommentService;
	
	
	@ResponseBody
	@RequestMapping("insertCommentAndFile.action")
	public Msg insertCommentAndFile(Xhcomment comment,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String resultProductId=request.getParameter("pid");
		Msg result=new Msg();
		
		result=checkProduct(Integer.parseInt(resultProductId));
		
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/commentImg");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			comment.setCommentimg(file_name);
		}
		if(result.getCode()==100){
			comment.setCommenttime(new Date());
			userCommentService.insertComment(comment);
		}else {
			return Msg.fail();
		}
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("insertComment.action")
	public Msg insertComment(Xhcomment comment,HttpServletRequest request){
		String resultProductId=request.getParameter("pid");
		Msg result=new Msg();
		
		result=checkProduct(Integer.parseInt(resultProductId));
		if(result.getCode()==100){
			comment.setCommenttime(new Date());
			userCommentService.insertComment(comment);
		}else{
			return Msg.fail();
		}
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("deleteComment.action")
	public Msg deleteComment(int id){
		if(id>0){
			userCommentService.deleteCommentById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("queryCommentById.action")
	public String queryCommentById(int id,Model model,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="3")Integer pageSize){
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhcomment> comment = userCommentService.queryCommentById(id);
		PageInfo pageInfo = new PageInfo(comment,3);
		model.addAttribute("comment", comment);
		model.addAttribute("pageInfo", pageInfo);
		return "/front/Member_CmtList.jsp";
	}
	
	@ResponseBody
	@RequestMapping("updateComment.action")
	public Msg updateComment(Xhcomment comment,HttpServletRequest request){
		if(comment!=null){
			comment.setCommenttime(new Date());
			userCommentService.updateCommentByPrimaryKey(comment);
		}else {
			return Msg.fail();
		}
		return Msg.success();
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
			String savePath = request.getServletContext().getRealPath("/commentImg");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			return Msg.success().add("filename",file_name);
		}	
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("updateCommentAndFile.action")
	public Msg updateCommentAndFile(Xhcomment comment,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/commentImg");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			comment.setCommentimg(file_name);
		}
		
		comment.setCommenttime(new Date());
		userCommentService.updateCommentByPrimaryKey(comment);
			
		return Msg.success();
	}
	
	@RequestMapping("queryCmtByIdForUpdate")
	public String queryCmtByIdForUpdate(int id,Model model,HttpSession session){
		Xhcomment comment =userCommentService.queryCommentByIdForUpdate(id);
		model.addAttribute("comment",comment);
		System.out.println(comment);
		return "/front/Member_CmtUpdate.jsp";
	}
	
	@ResponseBody
	@RequestMapping("cleanComment.action")
	public Msg cleanComment(int id){
		if(id!=0){
			userCommentService.cleanCommentByPrimaryKey(id);
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	//检查商品是否存在
	 @RequestMapping("checkProduct.action")
	    @ResponseBody
		public Msg checkProduct(int id){
	    	int result=userCommentService.checkProductId(id);
	    	if(result>0){
	    		return Msg.success();
	    	}
			return Msg.fail1();
		} 
}
