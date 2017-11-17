package com.xh.front.mapper;

import java.util.List;

import com.xh.front.bean.Navbar;

public interface NavbarMapper {
	
	public List<Navbar> queryAllNavbar();
	
	public void insertNavbar(Navbar navbar);
	
	public Navbar queryNavbarById(int id);
	
	public void deleteNavbar(int id);
	
	public void updateNavbarById(Navbar navbar);
	
	public List<Navbar> queryAllNavbarIsshow();
}
