package com.xh.back.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhtrolley;
import com.xh.back.mapper.XhTrolleyMapper;
import com.xh.back.service.XhTrolleyService;

public class XhTrolleyServiceImpl implements XhTrolleyService{
	@Autowired
	@Qualifier("xhTrolleyMapper")
    private XhTrolleyMapper xhTrolleyMapper;
	//查询购物车信息 
	@Override
	public List<Xhtrolley> TrolleyItem() {
		// TODO Auto-generated method stub
		 List<Xhtrolley>allItem=xhTrolleyMapper.TrolleyItem();
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

	@Override
	public List<Xhtrolley> queryTrolleyByUser(int id) {
		
		return xhTrolleyMapper.queryTrolleyByUser(id);
	}

	@Override
	public void deleteById(int id) {
		xhTrolleyMapper.deleteById(id);
		
	}
    //添加购物车商品条目
	@Override
	public void addTroItem(Xhtrolley tro) {
		Xhtrolley troItem=xhTrolleyMapper.queryByUidAndPid(tro.getUserid(),tro.getPid());
		   if(troItem==null){
		   xhTrolleyMapper.addTroItem(tro);    
		   }else{
			   troItem.setTronum(troItem.getTronum()+tro.getTronum());
		  xhTrolleyMapper.updateProductById(troItem);   
		   }
	}
	
	//修改购物车商品数量
	 public void updateProductById(Xhtrolley trolley){
		 xhTrolleyMapper.updateProductById(trolley);	
	 }

	@Override
	public List<Xhtrolley> loadItemsFront(String ids) {
		List<String> idlist=getList(ids);
		
		return xhTrolleyMapper.loadItemsFront(idlist);
		
		
	}	
}
