package com.xh.back.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhproduct;
import com.xh.back.mapper.XhsalesMapper;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

public class SalesServiceImpl implements SalesService {
	@Autowired
	@Qualifier("xhsalesMapper")
	private XhsalesMapper xhsalesMapper;

	@Override
	public List<Xhproduct> queryIntegralProduct(int flag) {
		return xhsalesMapper.queryIntegralProduct(flag);
	}

	@Override
	public void updateNotIntegralProduct(Integer[] pids){
		List<Integer> pidList = new ArrayList<>();
		for (Integer pid : pids) {
			pidList.add(pid);
		} 
		xhsalesMapper.updateNotIntegralProduct(pidList);
	}

	@Override
	public void updateIntegralProduct(Integer[] pids){
		List<Integer> pidList = new ArrayList<>();
		for (Integer  pid : pids) {
			pidList.add(pid);
		}
		xhsalesMapper.updateIntegralProduct(pidList);
		
	}

	@Override
	public List<Xhusers> queryUsersIntegral() {
		return xhsalesMapper.queryUsersIntegral();
	}

	@Override
	public void updateIntegral(Xhusers user) {
		xhsalesMapper.updateIntegral(user);		
	}

	@Override
	public Xhusers queryUserById(Integer userid) {
		
		return xhsalesMapper.queryUserById(userid);
	}

	@Override
	public Xhproduct queryProductById(Integer pid) {
		
		return xhsalesMapper.queryProductById(pid);
	}

	@Override
	public void addUserIntegral(Xhusers user) {
		xhsalesMapper.addUserIntegral(user);		
	}

	@Override
	public void cutUserIntegral(Xhusers user) {
		xhsalesMapper.cutUserIntegral(user);
	}

}
