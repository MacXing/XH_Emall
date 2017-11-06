package com.xh.back.serviceImpl;


import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.xh.back.bean.XhQueryTrolley;
import com.xh.back.bean.Xhtrolley;
import com.xh.back.mapper.XhTrolleyMapper;
import com.xh.back.service.XhTrolleyService;

public class XhTrolleyServiceImpl implements XhTrolleyService{
	@Autowired
	@Qualifier("xhTrolleyMapper")
   private XhTrolleyMapper xhTrolleyMapper;
	//查询购物车信息 
	@Override
	public List<XhQueryTrolley> TrolleyItem() {
		// TODO Auto-generated method stub
		 List<XhQueryTrolley>allItem=xhTrolleyMapper.TrolleyItem();
		return allItem;
	}
	
    //添加购物车
	@Override
	public void addTrolley(Xhtrolley xhtrolley) {
		// TODO Auto-generated method stub
		xhTrolleyMapper.addTrolley(xhtrolley);
		
	}

	//删除购物车
	@Override
	public void deleteTrolleyById(int id) {
		// TODO Auto-generated method stub
		xhTrolleyMapper.deleteTrolleyById(id);
		
	}
    
	//批量删除
	@Override
	public void deleteTrolleyByIds(String id) {
		List<String> idlist=getList(id);
		xhTrolleyMapper.deleteTrolleyByIds(idlist);
		
	}
	
	public List<String> getList(String id){
		List<String> list=new ArrayList<String>();
		String[] str=id.split(","); 
		for(String string:str){
			list.add(string);
		}
		return list;
	}

	//前端
    
	
	
	  

}
