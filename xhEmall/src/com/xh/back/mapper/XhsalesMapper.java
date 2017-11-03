package com.xh.back.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.xh.back.bean.Xhproduct;
import com.xh.front.bean.Xhusers;

public interface XhsalesMapper {
	public List<Xhproduct> queryIntegralProduct(int flag);
	
	public List<Xhusers> queryUsersIntegral();
	
	public void updateNotIntegralProduct(List<Integer> pids);
	
	public void updateIntegralProduct(List<Integer> pids);
	
	public Xhusers queryUserById(Integer userid);
	
	public Xhproduct queryProductById(Integer pid);
	
	public void updateIntegral(Xhusers user);
	
	public void addUserIntegral(Xhusers user);
	
	public void cutUserIntegral(Xhusers user);
		
}
