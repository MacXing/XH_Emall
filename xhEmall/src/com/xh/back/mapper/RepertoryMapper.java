package com.xh.back.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.front.bean.Xhusers;

public interface RepertoryMapper {
	
	public List<Xhrepertory> queryAllRepertory();
	
	public Xhrepertory queryRepertoryById(Integer repid);
	
	public void addRepertory(Xhrepertory xhrepertory);
	
	public void updateRepertory(Xhrepertory xhrepertory);
	
	public void deleteRepertory(Integer repid);
	
	public List<Xhstock> queryStock();
	
	public List<Xhproduct> queryAllProduct();
	
	public void addInput(Xhinput xhinput);
	
	public Xhstock queryStockById(Xhstock xhstock);
	
	public void addStock(Xhstock xhstock);
	
	public void updateStock(Xhstock xhstock);
	
	public void cutStock(Xhstock xhstock);	
	
	public void addOutput(Xhoutput xhoutput);
	
	public List<Xhrepertory> queryRepertoryByPid(Integer pid);
	
	public List<Xhinput> queryAllInput();
	
	public List<Xhoutput> queryAllOutput();
	
	public List<Xhstock> queryStockForData();
	
}
