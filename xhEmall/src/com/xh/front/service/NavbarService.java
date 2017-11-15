package com.xh.front.service;

import java.util.List;

import com.xh.front.bean.Navbar;


public interface NavbarService {
	
	public List<Navbar> queryAllNavbar();
	
	public void insertNavbar(Navbar navbar);
	
	public void deleteNavbar(int id);
	
	public Navbar queryNavbarById(int id);
	
	public void updateNavbarById(Navbar navbar);
	
}
