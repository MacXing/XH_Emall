package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhgrade;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.service.UserGradeService;
import com.xh.front.bean.Xhusers;

public class UserGradeServiceImpl implements UserGradeService {

	@Autowired
	@Qualifier("userGradeMapper")
	private UserGradeMapper userGradeMapper;
	
	@Override
	public List<Xhusers> queryUserGrade() {
		// TODO Auto-generated method stub
		List<Xhusers> user=userGradeMapper.queryUserGrade();
		return user;
	}

	@Override
	public Xhusers queryUserGradeById(int id) {
		// TODO Auto-generated method stub
		return userGradeMapper.queryUserByPrimaryKey(id);
	}

	@Override
	public List<Xhgrade> queryAllGradelist() {
		// TODO Auto-generated method stub
		List<Xhgrade> allGrade=userGradeMapper.queryAllGrade();
		return allGrade;
	}

	@Override
	public void addGradeList(Xhgrade grade) {
		// TODO Auto-generated method stub
		userGradeMapper.addGrade(grade);
	
	}

	@Override
	public void deleteGradeListByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		userGradeMapper.deleteGradeByPrimaryKey(id);
	}

	@Override
	public void updateGradeListByPrimaryKey(Xhgrade grade) {
		// TODO Auto-generated method stub
		userGradeMapper.updateGradeByPrimaryKey(grade);
	}

	@Override
	public Xhgrade queryGradeListById(int id) {
		// TODO Auto-generated method stub
		Xhgrade grade=userGradeMapper.queryGradeByPrimarykey(id);
		return grade;
	}
}
