package com.xh.front.mapper;


import org.apache.ibatis.annotations.Param;

import com.xh.front.bean.Xhusers;

public interface XhUserMapper {
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	//userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
    //useraddress,userhomephone,userphoto,usermoney
	
	public Xhusers selectLogin(@Param("userphone") String userphone, @Param("password") String password);
	
	public int checkUserName(String userName);
	
	public int checkUserEmail(String userEmail);
	
	public int checkUserPhone(String userPhone);
	
	public int insert(Xhusers user);
	
	public String selectQuestionByUserphone(String userPhone);
	
	public int checkAnswer(@Param("userphone")String userphone, @Param("question")String question, @Param("answer")String answer);
	
	public int updataPasswordByUserphone(@Param("userphone")String userphone, @Param("passwordNew")String passwordNew);
	
	public int checkUserPassword(@Param("userid")int userid, @Param("password")String password);
	
	public int updateUserPasswordById(@Param("userid")int userid, @Param("passwordNew")String passwordNew);
	
	public int updateUserPhoneById(@Param("userid")int userid, @Param("userphonenew")String userphonenew);
	
	public int checkUserPhoneById(@Param("userid")int userid, @Param("userphone")String userphoneOld);

}
