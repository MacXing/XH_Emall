package com.xh.front.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.front.bean.UserCollection;
import com.xh.front.mapper.FrontUserMapper;
import com.xh.front.mapper.UserCollectMapper;
import com.xh.front.service.UserCollectionService;

public class UserCollectionServiceImpl implements UserCollectionService{
	/**
	 * 收藏的接口
	 * **/
	
	@Autowired
	@Qualifier("userCollectMapper")
	private UserCollectMapper userCollectMapper;
	
	@Override
	public List<UserCollection> queryAllCollect(int id) {
		// TODO Auto-generated method stub
		List<UserCollection> collect=userCollectMapper.queryCollectByPrimaryKey(id);
		return collect;
	}

	@Override
	public void deleteCollectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		userCollectMapper.deleteCollectByPrimaryKey(id);
	}

	@Override
	public void addCollect(UserCollection collected) {
		// TODO Auto-generated method stub
		userCollectMapper.addCollect(collected);
	}
}
