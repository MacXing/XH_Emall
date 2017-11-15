package com.xh.front.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.xh.front.bean.Navbar;
import com.xh.front.mapper.NavbarMapper;
import com.xh.front.service.NavbarService;


public class NavbarServiceImpl implements NavbarService {
	
	@Autowired
	@Qualifier("navbarMapper")
	private NavbarMapper navbarMapper;

	public List<Navbar> queryAllNavbar() {
		
		return navbarMapper.queryAllNavbar();
	}

	public void insertNavbar(Navbar navbar) {
		
		navbarMapper.insertNavbar(navbar);;
	}

	@Override
	public void deleteNavbar(int id) {
		
		navbarMapper.deleteNavbar(id);	
	}

	@Override
	public Navbar queryNavbarById(int id) {
		// TODO Auto-generated method stub
		return navbarMapper.queryNavbarById(id);
	}

	@Override
	public void updateNavbarById(Navbar navbar) {
		navbarMapper.updateNavbarById(navbar);
	}
	
}
