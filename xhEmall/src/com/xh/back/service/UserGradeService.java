package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhgrade;
import com.xh.front.bean.Xhusers;

public interface UserGradeService {
	public List<Xhusers> queryUserGrade();
	public Xhusers queryUserGradeById(int id);
	public List<Xhgrade> queryAllGradelist();
	public void addGradeList(Xhgrade grade);
	public void deleteGradeListByPrimaryKey(int id);
	public void updateGradeListByPrimaryKey(Xhgrade grade);
	public Xhgrade queryGradeListById(int id);
}
