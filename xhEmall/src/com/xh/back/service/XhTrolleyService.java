package com.xh.back.service;

import java.util.List;
import com.xh.back.bean.XhQueryTrolley;
import com.xh.back.bean.Xhtrolley;

public interface XhTrolleyService {
	//查询购物车信息
	public List<XhQueryTrolley> TrolleyItem();
	//添加购物车
    public void addTrolley(Xhtrolley xhtrolley);
     //删除购物车
    public void deleteTrolleyById (int id);
    
  //批量删除购物车
    public void  deleteTrolleyByIds(String  id);
    
    //前端
    
    	 
   
	
    
}
