package com.xh.front.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;
import com.xh.front.mapper.FrontUserMapper;
import com.xh.front.service.FrontUserService;

public class FrontUserServiceImpl implements FrontUserService {
	/**
	 * 会员中心：获取会员信息
	 */
	@Autowired
	@Qualifier("frontUserMapper")
	private FrontUserMapper frontUserMapper;

	@Override
	public Xhusers queryUserById(int id) {
		// TODO Auto-generated method stub
		return frontUserMapper.queryUserByPrimaryKey(id);
	}

	@Override
	public void modifyUserById(XhusersBean user) {
		// TODO Auto-generated method stub
		frontUserMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<Xhmessage> querymsgByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		List<Xhmessage> msgList=frontUserMapper.querymsgByPrimaryKey(id);
		return msgList;
	}

	@Override
	public void cleanMessageByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		frontUserMapper.cleanMessageByPrimaryKey(id);
	}

	@Override
	public void updateMessageByPrimaryKey(Xhmessage message) {
		// TODO Auto-generated method stub
		frontUserMapper.updateMessageByPrimaryKey(message);
	}

	@Override
	public Xhmessage queryMsgByPrimarykey(int id) {
		// TODO Auto-generated method stub
		return frontUserMapper.queryMsgByPrimarykeyForUpdate(id);
	}

	@Override
	public void addMessage(Xhmessage message) {
		// TODO Auto-generated method stub
		frontUserMapper.addMessage(message);
	}

	@Override
	public void deleteMessageByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		frontUserMapper.deleteMessageByPrimaryKey(id);
	}

	@Override
	public String getProvinceName(String id) {
		// TODO Auto-generated method stub
		return frontUserMapper.getProvinceName(id);
	}
	
}
