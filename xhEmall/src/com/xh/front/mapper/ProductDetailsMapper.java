package com.xh.front.mapper;

import java.util.List;

import com.xh.back.bean.ProductImage;
import com.xh.back.bean.Xhcomment;

public interface ProductDetailsMapper {
	List<ProductImage> queryImagesByPid(Integer pid);
	
	List<Xhcomment> queryCommentByPid(Integer pid);
}
