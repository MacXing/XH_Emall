package com.xh.back.mapper;

import com.xh.back.bean.Xhadmin;


public interface XhadminMapper {
	
   public Xhadmin selectAdminByName(Xhadmin admin);
   
   public void updateAdminIpAndTime(Xhadmin admin);
    
}