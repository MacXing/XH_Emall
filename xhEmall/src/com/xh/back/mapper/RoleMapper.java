package com.xh.back.mapper;

import java.util.List;

import com.xh.back.bean.Admin_Role;
import com.xh.back.bean.Role;
import com.xh.back.bean.Xhadmin;


public interface RoleMapper {
	
	public List<Role> queryAllRoleById(int id);
	
	public List<Admin_Role> queryAllRoleAndPermission();
	
	public List<Xhadmin> queryAllAdmins();
	
	public List<Role> queryAllRoles();
	
	public void insertAdmin_Role(Admin_Role ar);
	
	public void deleteAdmin_Role(Admin_Role ar);
	
	public void updateAdmin_Role(Admin_Role ar);
	
	public List<Admin_Role> queryRoleAndPermissionByAdminId(int id);
	
	public Admin_Role queryRoleAndPermissionByAdminIdAndRoleId(Admin_Role ar);
	
	
}
