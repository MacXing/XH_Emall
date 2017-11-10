package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Xhshopping;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

public interface ExpressMapper {
	/**
	 *用户：邮寄方式
	 *操作：增删改查
	 *属性：/xhEmall/src/com/xh/back/bean/Xhshopping.java
	 * */
	public List<Xhshopping> queryAllExpress();
	public void addExpress(Xhshopping express);
	public void deleteByPrimaryKey(int id);
	public Xhshopping queryExpByPrimarykey(int id);
	public void updateExpressByPrimaryKey(Xhshopping express);
}
