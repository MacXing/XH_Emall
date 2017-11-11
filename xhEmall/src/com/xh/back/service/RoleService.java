package com.xh.back.service;


import java.util.List;

import com.xh.back.bean.Admin_Role;
import com.xh.back.bean.Role;
import com.xh.back.bean.Xhadmin;

public interface RoleService {
	
	List<Role> queryAllRoleById(int id);
	/**
	 * 查询所有的权限
	 * @return
	 */
	List<Admin_Role> queryAllRoleAndPermission();
	
	public List<Xhadmin> queryAllAdmins();
	
	public List<Role> queryAllRoles();
	
	public void insertAdmin_Role(Admin_Role ar);
	
	public void deleteAdmin_Role(Admin_Role ar);
	
	public void updateAdmin_Role(Admin_Role ar);
	
	public List<Admin_Role> queryRoleAndPermissionByAdminId(int id);
	
	public Admin_Role queryRoleAndPermissionByAdminIdAndRoleId(Admin_Role ar);
}
