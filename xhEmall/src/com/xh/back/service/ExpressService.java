package com.xh.back.service;


import java.util.List;

import com.xh.back.bean.Xhshopping;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface ExpressService {
	/**
	 * 接口
	 * 定义所有增删改查的所有操作
	 * */
	public List<Xhshopping> queryAllExpress();
	public void addExpress(Xhshopping express);
	public void deleteByPrimaryKey(int id);
	public Xhshopping queryExpByPrimarykey(int id);
	public void updateExpressByPrimaryKey(Xhshopping express);
}
