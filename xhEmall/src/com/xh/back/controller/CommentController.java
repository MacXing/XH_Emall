package com.xh.back.controller;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getImage.FileUtil;
import com.other.msg.Msg;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhproduct;
import com.xh.back.serviceImpl.CommentServiceImpl;

@Controller
@RequestMapping("comment")
public class CommentController {
	@Autowired
	@Qualifier("commentService")
	private CommentServiceImpl commentService;
	
	@RequestMapping("queryAllComment.action")
	
	public String queryAllComment(Model model) {
		
		List<Xhcomment> comments =  commentService.queryAllComment();
		model.addAttribute("comments", comments);
		
		return "/jsp/back/comment/queryAllComments.jsp";	
	}
	
	@ResponseBody
	@RequestMapping("insertCommentAndFile.action")
	public Msg insertProductAndFileById(Xhcomment comment,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String url = "";
		String pathname="";
		if(comment.getPid()>0){
			pathname=comment.getPid()+"";
		}
		if(file!=null){
			String file_name = file.getOriginalFilename();
			//判读是不是图片
			String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
			String regex="(gif|jpg|jpeg|png|JPG|PNG)";
			if(!Pattern.matches(regex, extName)){
				return Msg.fail();
			}
			String savePath = request.getServletContext().getRealPath("/upload/comment/"+pathname);			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			url="/upload/comment/"+pathname+"/"+file_name;
		}
		comment.setCommenttime(new Date());
		comment.setCommentimg(url);
		commentService.insertComment(comment);
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("insertComment.action")
	public Msg insertProductById(Xhcomment comment){
		if(comment!=null){
			comment.setCommenttime(new Date());
			commentService.insertComment(comment);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("deleteComment.action")
	public Msg deleteComment(int id,HttpServletRequest request) throws Exception{
		String url="";
		if(id>0){
			url=commentService.queryCommentById(id).getCommentimg();
		}
		if(!url.equals("")){
			String urlpath = request.getServletContext().getRealPath(url);
			FileUtil.deleteFile(urlpath);
			commentService.deleteCommentById(id);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("queryCommentById.action")
	public Msg queryCommentById(int id){
		if(id>0){
			Xhcomment comment = commentService.queryCommentById(id);
			return Msg.success().add("comment", comment);
		}
		return Msg.fail();
	}
	
}
