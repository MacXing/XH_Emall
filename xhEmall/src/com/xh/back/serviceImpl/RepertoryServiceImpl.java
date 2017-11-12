package com.xh.back.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.back.mapper.RepertoryMapper;
import com.xh.back.mapper.XhsalesMapper;
import com.xh.back.service.RepertoryService;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

public class RepertoryServiceImpl implements RepertoryService {
	@Autowired
	@Qualifier("repertoryMapper")
	private RepertoryMapper repertoryMapper;

	@Override
	public List<Xhrepertory> queryAllRepertory() {
		return repertoryMapper.queryAllRepertory();
	}
	
	@Override
	public Xhrepertory queryRepertoryById(Integer repid) {
		return repertoryMapper.queryRepertoryById(repid);
	}

	@Override
	public void addRepertory(Xhrepertory xhrepertory) {
		repertoryMapper.addRepertory(xhrepertory);
	}

	@Override
	public void updateRepertory(Xhrepertory xhrepertory) {
		repertoryMapper.updateRepertory(xhrepertory);
	}

	@Override
	public void deleteRepertory(Integer repid) {
		repertoryMapper.deleteRepertory(repid);
	}

	@Override
	public List<Xhrepertory> queryStock() {
		return repertoryMapper.queryStock();
	}

	@Override
	public List<Xhproduct> queryAllProduct() {
		return repertoryMapper.queryAllProduct();
	}

	@Override
	public void addInput(Xhinput xhinput) {
		repertoryMapper.addInput(xhinput);		
	}

	@Override
	public Xhstock queryStockById(Xhstock xhstock) {		
		return repertoryMapper.queryStockById(xhstock);
	}

	@Override
	public void addStock(Xhstock xhstock) {
		repertoryMapper.addStock(xhstock);		
	}

	@Override
	public void updateStock(Xhstock xhstock) {
		repertoryMapper.updateStock(xhstock);		
	}
	
	@Override
	public void cutStock(Xhstock xhstock) {
		repertoryMapper.cutStock(xhstock);		
	}

	@Override
	public void addOutput(Xhoutput xhoutput) {
		repertoryMapper.addOutput(xhoutput);		
	}

	@Override
	public List<Xhrepertory> queryRepertoryByPid(Integer pid) {		
		return repertoryMapper.queryRepertoryByPid(pid);
	}

	@Override
	public List<Xhinput> queryAllInput() {
		return repertoryMapper.queryAllInput();
	}

	@Override
	public List<Xhoutput> queryAllOutput() {
		return repertoryMapper.queryAllOutput();
	}

	

	


}
