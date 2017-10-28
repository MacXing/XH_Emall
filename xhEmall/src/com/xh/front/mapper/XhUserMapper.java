package com.xh.front.mapper;


import com.xh.front.bean.Xhusers;

public interface XhUserMapper {
	public Xhusers selectUserByPhone(Xhusers user);
	
	public void updateUserIpAndTime(Xhusers user);
	
	//userid,gradeid,username,userpassword,usersex,userbirthday,userphone,useremail,
    //useraddress,userhomephone,userphoto,usermoney
}
