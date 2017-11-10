package com.xh.back.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.mapper.UserMapper;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;


public class XhUserServiceImpl implements XhUserService {
	
	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	
	@Override
	public void deleteUserById(int id) {		
		userMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public List<Xhusers> queryAllUsers() {
		
		List<Xhusers> userList=userMapper.queryAllUsers();
		return userList;
		
	}
	
	@Override
	public void modifyUserById(XhusersBean user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public Xhusers queryUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.queryUserByPrimaryKey(id);
	}

	@Override
	public void addUser(Xhusers user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
		//System.out.println(user.getUserbirthday());
	}

	@Override
	public int checkGrade(int id) {
		// TODO Auto-generated method stub
		return userMapper.checkGrade(id);
	}

}
