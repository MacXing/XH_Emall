package com.xh.back.service;


import java.util.List;

import com.xh.back.bean.Xhproduct;
import com.xh.front.bean.Xhusers;

public interface SalesService {
	public List<Xhproduct> queryIntegralProduct(int flag);
	
	public void updateNotIntegralProduct(Integer[] pids);
	
	public void updateIntegralProduct(Integer[] pids);
	
	public List<Xhusers> queryUsersIntegral();
	
	public Xhusers queryUserById(Integer userid);
	
	public Xhproduct queryProductById(Integer pid);
	
	public void updateIntegral(Xhusers user);
	
	public void addUserIntegral(Xhusers user);
	
	public void cutUserIntegral(Xhusers user);
}
