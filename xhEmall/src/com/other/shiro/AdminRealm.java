package com.other.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.other.error.CustomException;
import com.xh.back.bean.ActiveAdmin;
import com.xh.back.bean.Role;
import com.xh.back.bean.Xhadmin;
import com.xh.back.serviceImpl.AdminServiceImpl;
import com.xh.back.serviceImpl.RoleServiceImpl;



public class AdminRealm extends AuthorizingRealm {

	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl adminService;
	
	@Autowired
	@Qualifier("roleService")
	private RoleServiceImpl roleService;
	
	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("adminRealm");
	}
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token){
		
		String adminname =(String) token.getPrincipal();
		Xhadmin admin = null;
		
 		try {
 			admin = adminService.queryAdminByName(adminname);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		
 		if(admin==null){
 			
			 try {
				throw new CustomException("用户名错误！");
			} catch (CustomException e) {
				
				e.printStackTrace();
			}
					
 		}
 		
 		String password = admin.getAdminpassword();
 		
 		//盐
// 		String salt = admin.getSalt();
 		
 		//activeUser就是用户身份信息
 		ActiveAdmin activeAdmin = new ActiveAdmin();
 		

 		activeAdmin.setId(admin.getAdminid());
 		activeAdmin.setAdminname(admin.getAdminname());
 		activeAdmin.setAdminphoto(admin.getAdminphoto());
 		
 		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
 				activeAdmin, password, this.getName());
 		
		return simpleAuthenticationInfo;	
	}
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		ActiveAdmin activeAdmin = (ActiveAdmin) principals.getPrimaryPrincipal();
		if(activeAdmin==null){
			return null;
		}
		List<Role> roelsList = roleService.queryAllRoleById(activeAdmin.getId());
		List<String> list=new ArrayList<>();
		for(Role role: roelsList){
			System.out.println(role.getPermission());
			list.add(role.getPermission());
		}
		/*list.add("root");
		list.add("user");
		list.add("system");*/
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(list);
		return simpleAuthorizationInfo;
	}
	
}

    //用来测试的算出密码password盐值加密后的结果，下面方法用于新增用户添加到数据库操作的，我这里就直接用main获得，直接数据库添加了，省时间
    /*public static void main(String[] args) {
        String saltSource = "abcdef";    
        String hashAlgorithmName = "MD5";
        String credentials = "password";
        Object salt = new Md5Hash(saltSource);
        int hashIterations = 1024;            
        Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
        System.out.println(result);
    }
*/


