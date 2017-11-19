package com.xh.front.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.front.bean.UserAddress;
import com.xh.front.mapper.UserAddressMapper;
import com.xh.front.service.UserAddressService;

public class UserAddressServiceImpl implements UserAddressService{
    @Autowired
    @Qualifier("userAddressMapper")
    private UserAddressMapper userAddressMapper;
	@Override
	public UserAddress queryAllUserAddressByUser(int id) {
		
		return userAddressMapper.queryAllUserAddressByUser(id);
	}

}
