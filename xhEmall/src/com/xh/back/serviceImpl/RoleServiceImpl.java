package com.xh.back.serviceImpl;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.xh.back.bean.Admin_Role;
import com.xh.back.bean.Role;
import com.xh.back.bean.Xhadmin;
import com.xh.back.mapper.RoleMapper;
import com.xh.back.service.RoleService;
/**
 * 通过id查找Menu信息
 * 
 * */
public class RoleServiceImpl implements RoleService{

	@Autowired
	@Qualifier("roleMapper")
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> queryAllRoleById(int id) {
		
		return roleMapper.queryAllRoleById(id);
	}

	@Override
	public List<Admin_Role> queryAllRoleAndPermission() {
		
		return roleMapper.queryAllRoleAndPermission();
	}

	
	public List<Xhadmin> queryAllAdmins() {
		
		return roleMapper.queryAllAdmins();
	}

	
	public List<Role> queryAllRoles() {
		
		return roleMapper.queryAllRoles();
	}

	@Override
	public void insertAdmin_Role(Admin_Role ar) {
		
		roleMapper.insertAdmin_Role(ar);
	}

	@Override
	public void deleteAdmin_Role(Admin_Role ar) {
		// TODO Auto-generated method stub
		roleMapper.deleteAdmin_Role(ar);
	}

	@Override
	public void updateAdmin_Role(Admin_Role ar) {
		// TODO Auto-generated method stub
		roleMapper.updateAdmin_Role(ar);
	}

	@Override
	public List<Admin_Role> queryRoleAndPermissionByAdminId(int id) {
		// TODO Auto-generated method stub
		return roleMapper.queryRoleAndPermissionByAdminId(id);
	}

	@Override
	public Admin_Role queryRoleAndPermissionByAdminIdAndRoleId(
			Admin_Role ar) {
		
		return roleMapper.queryRoleAndPermissionByAdminIdAndRoleId(ar);
	}

}
