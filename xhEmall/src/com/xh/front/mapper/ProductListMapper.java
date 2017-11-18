package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.Xhproduct;

public interface ProductListMapper {
	List<Xhproduct> queryAllProductByFind(String pname);
	
	int queryCount(String pname);
	
	List<Xhproduct> queryProductOrderByPsaleDesc(String pname);
}
