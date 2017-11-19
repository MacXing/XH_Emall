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
import com.xh.front.bean.UserCollection;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;
import com.xh.front.service.FrontUserService;
import com.xh.front.service.UserCollectionService;
import com.xh.front.service.UserCommentService;
import com.xh.front.service.XhUserService;

@Controller
@RequestMapping("userCollect")
public class UserCollectController {
	@Autowired
	@Qualifier("userCollectService")
	private UserCollectionService userCollectService;
	
	@RequestMapping("queryAllCollect")
	public String queryAllCollect(int id,Model model,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="5")Integer pageSize){
		
		PageHelper.startPage(pageNum, pageSize);
		List<UserCollection> collect =userCollectService.queryAllCollect(id);
		PageInfo pageInfo = new PageInfo(collect,5);
		
		model.addAttribute("collect", collect);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(collect);
		return "/front/Member_CollectList.jsp";
	}
	
	@ResponseBody
	@RequestMapping("deleteCollect.action")
	public Msg deleteCollect(int id){
		if(id!=0){
			userCollectService.deleteCollectByPrimaryKey(id);
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	@ResponseBody
	@RequestMapping("addCollect.action")
	public Msg addCollect(UserCollection collected){
		if(collected!=null){
			collected.setCollecttime(new Date());
			userCollectService.addCollect(collected);
			return Msg.success();
		}else {
			return Msg.fail();
		}	
	}
}
