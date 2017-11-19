package com.xh.back.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xh.back.bean.Xhtrolley;
import com.xh.front.bean.Xhusers;


public interface XhTrolleyMapper {
	  //查询购物车信息
       public List<Xhtrolley> TrolleyItem();
       //添加购物车
       public void addTrolley(Xhtrolley xhtrolley);
       
       //删除购物车信息通过troid
       public void deleteTrolleyById(int id);
       //删除通过Pid
       public void deleteById(int id);
       //批量删除购物车
       public void  deleteTrolleyByIds(@Param("idslist")List<String> idslist);
       
        //前端Trolley
       //查询购物车通过用户,可以通过session得到用户的ID
        public List<Xhtrolley> queryTrolleyByUser(int id);
        
        public Xhtrolley queryByUidAndPid(@Param("uid")int uid,@Param("pid")int pid);
        
        public void addTroItem(Xhtrolley tro);
        
        public void updateProductById(Xhtrolley trolley);
        
        public Xhtrolley queryItemById(String troid);
        
        public List<Xhtrolley> loadItemsFront(@Param("idlist")List<String> idlist);
}
