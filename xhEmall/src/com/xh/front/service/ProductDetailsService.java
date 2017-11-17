package com.xh.front.service;

import java.util.List;

import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;

public interface ProductDetailsService {
	List<ProductImage> queryImagesByPid(Integer pid);
	
	List<Xhcomment> queryCommentByPid(Integer pid);
}
