package com.xh.front.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.CollectionUtils;

import com.other.currency.ServerResponse;
import com.xh.back.bean.OrderGoods;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.bean.Xhtrolley;
import com.xh.back.mapper.OrderGoodsMapper;
import com.xh.back.mapper.XhTrolleyMapper;
import com.xh.front.bean.UserAddress;
import com.xh.front.mapper.FrontOrderMapper;
import com.xh.front.service.FrontOrderService;

public class FrontOrderServiceImpl implements FrontOrderService {

	@Autowired
	@Qualifier("orderGoodsMapper")
	private OrderGoodsMapper orderGoodsMapper;
	
	@Autowired
	@Qualifier("frontOrderMapper")
	private FrontOrderMapper frontOrderMapper;
	
	@Autowired
	@Qualifier("xhTrolleyMapper")
    private XhTrolleyMapper xhTrolleyMapper;
	
	@Override
	public ServerResponse<List<OrderGoods>> queryOrderInfo(Integer userid) {
		List<OrderGoods> ogList = orderGoodsMapper.queryAllOrderGoodsByUserId(userid);
		if(CollectionUtils.isEmpty(ogList)){
			return ServerResponse.createByErrorMassage("没有相关信息");
		}
		return ServerResponse.createBySuccess(ogList);
	}

	@Override
	public ServerResponse<String> addAddress(UserAddress address) {
		int resultCount = frontOrderMapper.addAddress(address);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("地址添加成功");
		}
		return ServerResponse.createBySuccessMessage("地址添加失败");
	}

	@Override
	public ServerResponse<List<UserAddress>> queryAddressById(int userid) {
		List<UserAddress> addList = frontOrderMapper.queryAddressById(userid);
		if(CollectionUtils.isEmpty(addList)){
			return ServerResponse.createByErrorMassage("没有收货地址，请添加");
		}
		return ServerResponse.createBySuccess(addList);
	}

	@Override
	public ServerResponse<String> deleteAddressById(int addID) {
		int resultCount = frontOrderMapper.deleteAddressById(addID);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("删除成功");
		}
		return ServerResponse.createByErrorMassage("删除失败");
	}

	@Override
	public ServerResponse<String> updateAddressById(UserAddress address) {
		int resultCount = frontOrderMapper.updateAddressById(address);
		if(resultCount > 0){
			return ServerResponse.createBySuccessMessage("更新成功");
		}
		return ServerResponse.createByErrorMassage("更新失败");
	}

	@Override
	public ServerResponse<String> updateDefaultById(int addID, int userID) {
		int resultCount = frontOrderMapper.updateDefaultFormerById(addID, userID);
		if(resultCount > 0){
			resultCount = frontOrderMapper.updateDefaultById(addID, userID);
			if(resultCount > 0){
				return ServerResponse.createBySuccessMessage("设置成功");
			}
			return ServerResponse.createByErrorMassage("设置失败");
		}
		return ServerResponse.createByErrorMassage("设置失败");
	}

	@Override
	public ServerResponse<UserAddress> queryAddInfoById(int addID) {
		UserAddress userAddress = frontOrderMapper.queryAddInfoById(addID);
		if(userAddress != null){
			return ServerResponse.createBySuccess(userAddress);
		}
		return ServerResponse.createByErrorMassage("没有找到相关信息");
	}

	@Override
	public ServerResponse<Xhorderinfo> addOrder(int spid, UserAddress userAddress, List<Xhtrolley> items) {
		
		int resultCount = 0;
		double payfee = 0;
		Xhorderinfo orderInfo = new Xhorderinfo();
		
		for(Xhtrolley t : items){
			payfee += t.getTronum()*t.getXhproduct().getPsale();
		}
		
		orderInfo.setShoppingid(spid);
		orderInfo.setAddaddress(userAddress.getAddAddress());
		orderInfo.setAddcity(userAddress.getAddCity());
		orderInfo.setAddcode(userAddress.getAddCode());
		orderInfo.setAdddistrict(userAddress.getAddDistrict());
		orderInfo.setAddcountry(userAddress.getAddCountry());
		orderInfo.setAddphone(userAddress.getAddPhone());
		orderInfo.setAddusername(userAddress.getAddUserName());
		orderInfo.setAddprovince(userAddress.getAddProvice());
		orderInfo.setUserid(userAddress.getUserID());
		orderInfo.setPayfee(payfee);
		resultCount = frontOrderMapper.addOrder(orderInfo);
		
		if(resultCount > 0){
			for(Xhtrolley t : items){
				orderGoodsMapper.addOrderGood(t.getXhproduct().getPid(), orderInfo.getOrderid(), t.getTronum());
				frontOrderMapper.addShopping(orderInfo.getOrderid(), orderInfo.getShoppingcode());
			}
			Xhorderinfo frontorderInfo = frontOrderMapper.queryOrderInfoById(orderInfo.getOrderid());
			return ServerResponse.createBySuccess(frontorderInfo);
		}
		return ServerResponse.createByErrorMassage("添加失败");
	}
}
