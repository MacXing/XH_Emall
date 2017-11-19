package com.xh.front.service;


import com.other.currency.ServerResponse;
import com.xh.front.bean.Xhusers;

public interface XhUserService {
	
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	public ServerResponse<Xhusers> login(String userphone, String password);
	
	public ServerResponse<String> checkValid(String str, String type);
	
	public ServerResponse<String> register(Xhusers user);
	
	public ServerResponse<String> selectGetQuestion(String userphone);

	public ServerResponse<String> checkAnswer(String userphone, String question, String answer);
	
	public ServerResponse<String> forgetRestPassword(String userphone, String passwordNew, String forgetToken);
	
	public ServerResponse<String> restPassword(String passwordNew, String passwordOld, int userid);
	
	public ServerResponse<String> restPhone(String userphoneOld, String userphoneNew, int userid);
	
}
