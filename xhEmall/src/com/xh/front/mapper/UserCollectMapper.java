package com.xh.front.mapper;

import java.util.Collection;
import java.util.List;

import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhmessage;
import com.xh.front.bean.UserCollection;

public interface UserCollectMapper {
	/**
	 * 用户收藏管理:添加收藏，删除收藏
	 * **/
	
	public List<UserCollection> queryCollectByPrimaryKey(int id);
	public void deleteCollectByPrimaryKey(int id);
	public void addCollect(UserCollection collected);
}
