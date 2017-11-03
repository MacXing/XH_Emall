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

	@Override
	public void addMessageList(Xhmessage message) {
		// TODO Auto-generated method stub
		userMessageMapper.addMessage(message);
	}

	@Override
	public void deleteMessageListByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		userMessageMapper.deleteMessageByPrimaryKey(id);
	}

	@Override
	public void cleanMessageContext(int id) {
		// TODO Auto-generated method stub
		userMessageMapper.cleanMessageContextByPrimaryKey(id);
	}

	@Override
	public void cleanMessage(int id) {
		// TODO Auto-generated method stub
		userMessageMapper.cleanMessageByPrimaryKey(id);
	}

	@Override
	public void updateMessageByPrimaryKey(Xhmessage message) {
		// TODO Auto-generated method stub
		userMessageMapper.updateMessageByPrimaryKey(message);
	}

}
