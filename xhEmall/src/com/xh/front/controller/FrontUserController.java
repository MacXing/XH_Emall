package com.xh.front.controller;


import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.getImage.FileUtil;
import com.other.getip.GetIp;
import com.other.msg.Msg;
import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;
import com.xh.front.service.FrontUserService;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("userCenter")
public class FrontUserController {
	@Autowired
	@Qualifier("frontUserService")
	private FrontUserService frontUserService;
	
	@RequestMapping("queryUserByIdForDetail")
	public String queryUserByIdForDetail(int id,Model model,HttpSession session){
		Xhusers user =frontUserService.queryUserById(id);
		model.addAttribute("user",user);
		System.out.println(user);
		return "/front/Member.jsp";
	}
	
	@RequestMapping("queryUserByIdForUpdate")
	public String queryUserByIdForUpdate(int id,Model model,HttpSession session){
		Xhusers user =frontUserService.queryUserById(id);
		model.addAttribute("user",user);
		System.out.println(user);
		return "/front/Member_update.jsp";
	}
	
	@RequestMapping("updateUser.action")
	@ResponseBody
	public Msg updateUser(XhusersBean user,HttpServletRequest request){	
		String userbirthday=request.getParameter("userbirthday");		
		int sex=Integer.parseInt(request.getParameter("usersex"));
		System.out.println(user);
		
		if(user!=null){
			if(userbirthday.equals("")){
				user.setUserbirthday(new Date());
			}
			user.setUsersex(sex);
			frontUserService.modifyUserById(user);
		}else{
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
			String savePath = request.getServletContext().getRealPath("/userphoto");			
			file_name = FileUtil.uploadFile(file, savePath, file_name);
			return Msg.success().add("filename",file_name);
		}	
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("updateUserAndFile.action")
	public Msg updateUserAndFile(XhusersBean user,HttpServletRequest request,MultipartFile file,HttpSession session)throws IllegalStateException, IOException{						
		int sex=Integer.parseInt(request.getParameter("usersex"));
		String userbirthday=request.getParameter("userbirthday");	
		
		if(userbirthday.equals("")){
			user.setUserbirthday(new Date());
		}
				
		if(user!=null){
			if(file!=null){				
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					Msg.fail();
				}
				String savePath = request.getServletContext().getRealPath("/userphoto");			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				user.setUserphoto(file_name);
			}
			user.setUsersex(sex);
			frontUserService.modifyUserById(user);			
			return Msg.success();
		}		
		return Msg.fail();
	}
	
	
	//用户留言：查询、清空、修改
	@RequestMapping("queryUsermessageById.action")
	public String queryUsermessageById(int id,Model model,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="3")Integer pageSize){
		
		PageHelper.startPage(pageNum, pageSize);
		List<Xhmessage> msgList =frontUserService.querymsgByPrimaryKey(id);
		PageInfo pageInfo = new PageInfo(msgList,3);
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(msgList);
		return "/front/Member_MsgList.jsp";
	}
	
	@RequestMapping("queryUsermessageByIdForUpdate.action")
	public String queryUsermessageByIdForUpdate(int id,Model model){
		Xhmessage msg =frontUserService.queryMsgByPrimarykey(id);
		model.addAttribute("msg", msg);
		return "/front/Member_Msg.jsp";
	}
	
	@ResponseBody
	@RequestMapping("cleanMessage.action")
	public Msg cleanMessage(int id){
		if(id!=0){
			frontUserService.cleanMessageByPrimaryKey(id);
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	@ResponseBody
	@RequestMapping("updateMessage.action")
	public Msg updateMessage(Xhmessage message){
		if(message!=null){
			if(message.getMsgtxt().equals("")){
				return Msg.fail();
			}else{
				message.setMsginittime(new Date());
				frontUserService.updateMessageByPrimaryKey(message);
				return Msg.success();
			}
		}else {
			return Msg.fail();
		}	
	}
	
	@ResponseBody
	@RequestMapping("addMessage.action")
	public Msg addMessage(Xhmessage message){
		if(message!=null){
			if(message.getMsgtxt().equals("")){
				return Msg.fail();
			}else{
				message.setMsginittime(new Date());
				frontUserService.addMessage(message);
				return Msg.success();
			}
		}else {
			return Msg.fail();
		}	
	}
	
	@ResponseBody
	@RequestMapping("deleteMessage.action")
	public Msg deleteMessage(int id){
		if(id!=0){
			frontUserService.deleteMessageByPrimaryKey(id);
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}

}
