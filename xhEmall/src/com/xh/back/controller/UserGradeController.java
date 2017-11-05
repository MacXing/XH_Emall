package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getip.GetIp;
import com.xh.back.bean.Xhgrade;
import com.xh.back.service.UserGradeService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("grade")
public class UserGradeController {
	@Autowired
	@Qualifier("userGrade")
	private UserGradeService userGrade;
	
	//查询所有等级会员
	@RequestMapping("userGrade.action")
	public String queryUserGradeController(Model model){
        List<Xhusers> allUser=userGrade.queryUserGrade();
        model.addAttribute("allUser", allUser);
		return "/jsp/back/user/queryUsersGrade.jsp";
	}
	
	//通过会员ID查询所有等级会员并返回json数据
	@ResponseBody
	@RequestMapping("queryUserGradeByIdForDetail.action")
	public Xhusers queryUserByIdForDetail(int id){
		Xhusers user =userGrade.queryUserGradeById(id);
		System.out.println(user);
		return user;
	}
	
	//通过等级ID查询等级列表
	@RequestMapping("queryByIdForUpdate.action")
	public String queryByIdForUpdate(int id,Model model){
		Xhgrade grade =userGrade.queryGradeListById(id);
		model.addAttribute("grade",grade);
		return "/jsp/back/user/updateGrade.jsp";
	}
	
	//通过等级ID查询等级列表，并返回json数据
	@ResponseBody
	@RequestMapping("queryGradeById.action")
	public Xhgrade queryGradeById(int id,Model model){
		Xhgrade grade =userGrade.queryGradeListById(id);
		model.addAttribute("grade",grade);
		return grade;
	}
	
	//查询等级列表的所有信息
	@RequestMapping("queryallGrade.action")
	public String queryallGrade(Model model){
        List<Xhgrade> allGrade=userGrade.queryAllGradelist();
        model.addAttribute("allGrade", allGrade);
		return "/jsp/back/user/queryAllGrade.jsp";
	}
	
	//增加等级列表
	@RequestMapping("addGradeList.action")
	public String addGradeList(Xhgrade grade,HttpServletRequest request,Model model,HttpSession session){
		String gradename=request.getParameter("gradename");
		String gradecount=request.getParameter("gradecount");		
		
		List<Xhgrade> allGrade=userGrade.queryAllGradelist();
		if(gradename==""){
			for (Xhgrade xhgrade : allGrade) {
				if (gradename.equals(xhgrade.getGradename())&& gradecount.equals(xhgrade.getGradecount())) {
					return null;
				}	
			}
			userGrade.addGradeList(grade);
		}else{
			userGrade.addGradeList(grade);
		}
				
		return "/grade/queryallGrade.action";
	}
	
	//通过等级ID删除等级列表信息
	@RequestMapping("deleteGradeList.action")
	public String deleteGradeList(int id){
		userGrade.deleteGradeListByPrimaryKey(id);
		return "/grade/queryallGrade.action";
	}
	
	//更新等级列表信息
	@RequestMapping("modifyGradeList.action")
	public String modifyGradeList(Xhgrade grade){
		userGrade.updateGradeListByPrimaryKey(grade);
		return "/grade/queryallGrade.action";
	}
}
