package com.xh.front.service;

import java.util.List;

import com.xh.back.bean.ProductImage;

public interface ProductDetailsService {
	List<ProductImage> queryImagesByPid(Integer pid);
}
