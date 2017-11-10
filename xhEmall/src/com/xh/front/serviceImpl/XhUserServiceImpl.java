package com.xh.front.serviceImpl;


import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.other.currency.Const;
import com.other.currency.ServerResponse;
import com.other.currency.TokenCache;
import com.other.tools.MD5Util;
import com.xh.front.bean.Xhusers;
import com.xh.front.mapper.XhUserMapper;
import com.xh.front.service.XhUserService;

public class XhUserServiceImpl implements XhUserService {
	/**
	 * 用户登录
	 */
	@Autowired
	@Qualifier("xhUserMapper")
	private XhUserMapper xhUserMapper;
	
	@Override
	public Xhusers selectUserByPhone(Xhusers user) {
		
		return xhUserMapper.selectUserByPhone(user);
		
	}

	@Override
	public void updateUserIpAndTime(Xhusers user) {

		xhUserMapper.updateUserIpAndTime(user);
		
	}
	
	@Override
	public ServerResponse<Xhusers> login(String username, String password){
		
		int resultCount = xhUserMapper.checkUserName(username);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMassage("用户名不存在");
        }

        //todo 密码登录
        String md5password = MD5Util.MD5EncodeUtf8(password);
        Xhusers user = xhUserMapper.selectLogin(username, md5password);
        if (user == null) {
            return ServerResponse.createByErrorMassage("密码错误");
        }
        user.setUserpassword(StringUtils.EMPTY);
        return ServerResponse.createBySuccess("登录成功", user);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public ServerResponse<String> register(Xhusers user){
		ServerResponse validResponse = this.checkValid(user.getUsername(), Const.USERNAME);
		if(!validResponse.isSuccess()){
			return validResponse;
		}
		validResponse = this.checkValid(user.getUserphone(), Const.USERPHONE);
		if(!validResponse.isSuccess()){
			return validResponse;
		}
		validResponse = this.checkValid(user.getUseremail(), Const.EMAIL);
		if(!validResponse.isSuccess()){
			return validResponse;
		}
		// TODO 设置注册身份
		// user.setRole(Const.Role.ROLE_COUSTOMER);
		// MD5加密
		user.setUserpassword(MD5Util.MD5EncodeUtf8(user.getUserpassword()));
		user.setUserlogintime(new Date());
		
		int resultCount = xhUserMapper.insert(user);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMassage("注册失败");
        }
        return ServerResponse.createByErrorMassage("注册成功");
		
	}
	
	@Override
	public ServerResponse<String> checkValid(String str, String type){
		if(StringUtils.isNoneBlank(type)){
			if(Const.USERNAME.equals(type)){
				int resultCount = xhUserMapper.checkUserName(str);
				if(resultCount > 0){
					return ServerResponse.createByErrorMassage("用户名已存在");
				}
			}
			if(Const.USERPHONE.equals(type)){
				int resultCount = xhUserMapper.checkUserPhone(str);
				if(resultCount > 0){
					return ServerResponse.createBySuccessMessage("电话号码被注册");
				}
			}
			if(Const.EMAIL.equals(type)){
				int resultCount = xhUserMapper.checkUserEmail(str);
				if(resultCount > 0){
					return ServerResponse.createBySuccessMessage("邮箱被注册");
				}
			}
		} else {
			return ServerResponse.createByErrorMassage("参数错误");
		}
		return ServerResponse.createBySuccessMessage("校验成功");
	}

	@Override
	public ServerResponse<String> selectGetQuestion(String username) {
		ServerResponse validResponse = this.checkValid(username, Const.USERNAME);
		if(validResponse.isSuccess()){
			// 用户不存在
			return ServerResponse.createByErrorMassage("用户名不存在");
		}
		String question = xhUserMapper.selectQuestionByUsername(username);
		if(StringUtils.isNoneBlank(question)){
			return ServerResponse.createBySuccess(question);
		}
		return ServerResponse.createByErrorMassage("找回密码的问题为空");
	}

	@Override
	public ServerResponse<String> checkAnswer(String username,
			String question, String answer) {
		int resultCount = xhUserMapper.checkAnswer(username, question, answer);
		// 说明问题、答案都属于这个用户，并且是正确的
		if(resultCount > 0 ){
			String forgetToken = UUID.randomUUID().toString();
			TokenCache.setKey(TokenCache.TOKEN_PREFIX + username, forgetToken);
			return ServerResponse.createBySuccessMessage(forgetToken);
		}
		return ServerResponse.createByErrorMassage("问题的答案错误");
	} 

	public ServerResponse<String> forgetRestPassword(String username, String passwordNew, String forgetToken){
		if(StringUtils.isBlank(forgetToken)){
			return ServerResponse.createByErrorMassage("参数错误，需要重新传递");
		}
		ServerResponse validResponse = this.checkValid(username, Const.USERNAME);
		if(validResponse.isSuccess()){
			// 用户不存在
			return ServerResponse.createByErrorMassage("用户名不存在");
		}
		String token = TokenCache.getKey(TokenCache.TOKEN_PREFIX + username);
		if(StringUtils.isBlank(token)){
			return ServerResponse.createByErrorMassage("token无效或过期");
		}
		if(StringUtils.equals(forgetToken, token)){
			String md5Password = MD5Util.MD5EncodeUtf8(passwordNew);
			int rowCount = xhUserMapper.updataPasswordByUsername(username, md5Password);
			if(rowCount > 0){
				return ServerResponse.createBySuccessMessage("修改密码成功");
			}
		} else {
			return ServerResponse.createByErrorMassage("token错误，请重新获取重置密码的token");
		}
		return ServerResponse.createByErrorMassage("修改密码失败");
	}
}
