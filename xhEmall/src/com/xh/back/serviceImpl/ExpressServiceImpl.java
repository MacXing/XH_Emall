package com.xh.back.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhshopping;
import com.xh.back.mapper.ExpressMapper;
import com.xh.back.mapper.UserMapper;
import com.xh.back.service.ExpressService;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;


public class ExpressServiceImpl implements ExpressService {
	
	@Autowired
	@Qualifier("expressMapper")
	private ExpressMapper expressMapper;

	@Override
	public void addExpress(Xhshopping express) {
		// TODO Auto-generated method stub
		expressMapper.addExpress(express);
	}

	@Override
	public void deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		expressMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Xhshopping queryExpByPrimarykey(int id) {
		// TODO Auto-generated method stub
		Xhshopping express=expressMapper.queryExpByPrimarykey(id);
		return express;
	}

	@Override
	public void updateExpressByPrimaryKey(Xhshopping express) {
		// TODO Auto-generated method stub
		expressMapper.updateExpressByPrimaryKey(express);
	}

	@Override
	public List<Xhshopping> queryAllExpress() {
		// TODO Auto-generated method stub
		List<Xhshopping> expressList=expressMapper.queryAllExpress();
		return expressList;
	}
	
	
	/*@Override
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
	}*/

}
