package com.xh.back.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.xh.back.bean.XhQueryTrolley;
import com.xh.back.bean.Xhtrolley;


public interface XhTrolleyMapper {
	  //查询购物车信息
       public List<XhQueryTrolley> TrolleyItem();
       //添加购物车
       public void addTrolley(Xhtrolley xhtrolley);
       
       //删除购物车信息通过pid
       public void deleteTrolleyById(int id);
       
       //批量删除购物车
       public void  deleteTrolleyByIds(@Param("idslist")List<String> idslist);
       
        //前端Trolley
       //查询购物车通过用户,可以通过session得到用户的ID
        public XhQueryTrolley queryTrolleyByUser(int uid);
}
