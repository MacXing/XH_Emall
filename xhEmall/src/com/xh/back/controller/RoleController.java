package com.xh.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.back.bean.Admin_Role;
import com.xh.back.bean.Role;
import com.xh.back.bean.Xhadmin;
import com.xh.back.serviceImpl.RoleServiceImpl;

@Controller
@RequestMapping("role")
public class RoleController {
	
	@Autowired
	@Qualifier("roleService")
	private RoleServiceImpl roleService;
	
	@RequestMapping("queryAllRoles.action")
	
	public String queryAllRoleAndPermission(Model model){
		
		List<Admin_Role> admin_role = roleService.queryAllRoleAndPermission();
		model.addAttribute("admin_role", admin_role);
		
		return "/jsp/back/permission/queryAllPermission.jsp";
		
	}
	
	@RequestMapping("queryAllAdmin.action")
	@ResponseBody
	public Msg queryAllAdmin(){
		List<Xhadmin> admins = roleService.queryAllAdmins();
		
		if(admins!=null){
			return Msg.success().add("admins", admins);
		}
		return Msg.fail();
	}
	
	@RequestMapping("queryAllRole.action")
	@ResponseBody
	public Msg queryAllARoleMsg(){
		List<Role> roles = roleService.queryAllRoles();
		
		if(roles!=null){
			return Msg.success().add("roles", roles);
		}
		return Msg.fail();
	}
	
	@RequestMapping("insertRole.action")
	@ResponseBody
	public Msg queryADByAdminid(Admin_Role AR){
		System.out.println(AR);
		List<Admin_Role> admin_Roles = roleService.queryRoleAndPermissionByAdminId(AR.getAdminid());
		if(admin_Roles!=null){
			for(Admin_Role ar:admin_Roles){
				if(AR.getRoleid()==ar.getRoleid()){
					return Msg.fail().add("msg", "该管理员已经拥有这个角色");
				}
			}
			roleService.insertAdmin_Role(AR);
			return Msg.success();
		}
		return Msg.fail().add("msg", "请联系管理员！");
	}
	
	@RequestMapping("queryAllRoleByAdminId.action")
	@ResponseBody
	public Msg queryAllRoleByAdminId(Admin_Role ar){
		if(ar!=null && ar.getAdminid()>0 && ar.getRoleid()>0){
			Admin_Role ars = roleService.queryRoleAndPermissionByAdminIdAndRoleId(ar);
			return Msg.success().add("ars", ars);
		}
		
		return Msg.fail();
	}
	
	@RequestMapping("updateRole.action")
	@ResponseBody
	public Msg updateRole(Admin_Role ar){
		
		System.out.println(ar);
		List<Admin_Role> admin_Roles = null;
		
		if(ar.getAdminid()>0){
			admin_Roles = roleService.queryRoleAndPermissionByAdminId(ar.getAdminid());
			System.out.println(admin_Roles);
		}else {
			return Msg.fail();
		}
		if(admin_Roles!=null){
			for(Admin_Role role:admin_Roles){
				if(ar.getRoleid()==role.getRoleid()){
					return Msg.fail().add("msg", "该管理员已经拥有这个角色");
				}
			}
			roleService.updateAdmin_Role(ar);
			return Msg.success();
		}
		return Msg.fail().add("msg", "请拨打110！");
	}
	
	@RequestMapping("deleteRole.action")
	@ResponseBody
	public Msg deleteRole(int adminid,int roleid){
		Admin_Role ar = new Admin_Role();
		ar.setAdminid(adminid);
		ar.setRoleid(roleid);
		System.out.println(adminid+""+roleid);
		if(adminid>0 && roleid >0 && ar!=null){
			roleService.deleteAdmin_Role(ar);
			return Msg.success();
		}	
		return Msg.fail();		
	}
	

}
