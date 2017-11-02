package com.xh.back.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhgrade;
import com.xh.back.bean.Xhmessage;
import com.xh.back.mapper.UserGradeMapper;
import com.xh.back.mapper.UserMessageMapper;
import com.xh.back.service.UserGradeService;
import com.xh.back.service.UserMessageService;
import com.xh.front.bean.Xhusers;

public class UserMessageServiceImpl implements UserMessageService {

	@Autowired
	@Qualifier("userMessageMapper")
	private UserMessageMapper userMessageMapper;
	
	@Override
	public List<Xhmessage> queryUserMessage() {
		// TODO Auto-generated method stub
		List<Xhmessage> message=userMessageMapper.queryUserMessage();
		return message;
	}

	@Override
	public Xhmessage queryUsermessageById(int id) {
		// TODO Auto-generated method stub
		return userMessageMapper.querymsgByPrimaryKey(id);
	}

	@Override
	public List<Xhmessage> queryAllMessagelist() {
		// TODO Auto-generated method stub
		List<Xhmessage> message=userMessageMapper.queryAllMessage();
		return message;
	}

	@Override
	public Xhmessage queryMessageListById(int id) {
		// TODO Auto-generated method stub
		return userMessageMapper.querymsgByPrimaryKey(id);
	}

	/*@Override
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
	}*/
}
