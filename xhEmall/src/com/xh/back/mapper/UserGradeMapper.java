package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhgrade;
import com.xh.front.bean.Xhusers;

public interface UserGradeMapper {
	/**
	 * 对象：等级会员、等级列表
	 * 操作：等级会员的等级修改，等级列表的增删改查
	 * **/
	public List<Xhusers> queryUserGrade();
	public Xhusers queryUserByPrimaryKey(int id);
	public Xhgrade queryGradeByPrimarykey(int id);
	public List<Xhgrade> queryAllGrade();
	public void addGrade(Xhgrade grade);
	public void deleteGradeByPrimaryKey(int id);
	public void updateGradeByPrimaryKey(Xhgrade grade);
	
}
