package com.xh.front.service;


import com.other.currency.ServiceResponse;
import com.xh.front.bean.Xhusers;

public interface XhUserService {
	
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	public ServiceResponse<Xhusers> login(String username, String password);
	
	public ServiceResponse<String> checkValid(String str, String type);
	
	public ServiceResponse<String> register(Xhusers user);
	
	public ServiceResponse<String> selectGetQuestion(String username);

	public ServiceResponse<String> checkAnswer(String username, String question, String answer);
	
	public ServiceResponse<String> forgetRestPassword(String username, String passwordNew, String forgetToken);
	
}
