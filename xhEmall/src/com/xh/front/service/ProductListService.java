package com.xh.front.service;

import java.util.List;

import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;
import com.xh.back.bean.Xhproduct;

public interface ProductListService {
	List<Xhproduct> queryAllProductByFind(String pname);
}
