package com.xh.back.service;

import java.util.List;

import com.xh.back.bean.Xhtrolley;
import com.xh.front.bean.Xhusers;

public interface XhTrolleyService {
	//查询购物车信息
	public List<Xhtrolley> TrolleyItem();
	//添加购物车
    public void addTrolley(Xhtrolley xhtrolley);
     //删除购物车
    public void deleteTrolleyById(int id);
    
  //批量删除购物车
    public void  deleteTrolleyByIds(String id);
    
    //前端
    public List<Xhtrolley> queryTrolleyByUser(int id);
    	 
    public void deleteById(int id);
    
    public void addTroItem(Xhtrolley tro);
    
    public void updateProductById(Xhtrolley trolley);
    
    public List<Xhtrolley> loadItemsFront(String ids);
}
