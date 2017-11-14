package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.ProductImage;

public interface ProductDetailsMapper {
	List<ProductImage> queryImagesByPid(Integer pid);
}
