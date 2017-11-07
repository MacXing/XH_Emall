package com.xh.front.mapper;


import org.apache.ibatis.annotations.Param;

import com.xh.front.bean.Xhusers;

public interface XhUserMapper {
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	//userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
    //useraddress,userhomephone,userphoto,usermoney
	
	public Xhusers selectLogin(@Param("username") String username, @Param("password") String password);
	
	public int checkUserName(String userName);
	
	public int checkUserEmail(String userEmail);
	
	public int checkUserPhone(String userPhone);
	
	public int insert(Xhusers user);
	
	public String selectQuestionByUsername(String username);
	
	public int checkAnswer(@Param("username")String username, @Param("question")String question, @Param("answer")String answer);
	
	public int updataPasswordByUsername(@Param("username")String username, @Param("passwordNew")String passwordNew);
}
