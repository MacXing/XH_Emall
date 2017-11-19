package com.xh.front.service;

import java.util.List;

import com.xh.front.bean.UserCollection;
import com.xh.front.mapper.UserCollectMapper;

public interface UserCollectionService {
	/**
	 * 收藏的接口
	 * **/

	public List<UserCollection> queryAllCollect(int id);
	public void deleteCollectByPrimaryKey(int id);
	public void addCollect(UserCollection collected);
}
