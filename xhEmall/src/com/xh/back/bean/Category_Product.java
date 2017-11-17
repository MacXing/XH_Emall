package com.xh.back.bean;

import java.util.List;

public class Category_Product {
	private int id;
	private int pid;
	private int catid;
	private Xhcategory category;
	private Xhproduct product;
	private List<Xhcategory> categorys;
	private List<Xhproduct> products;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public Xhcategory getCategory() {
		return category;
	}
	public void setCategory(Xhcategory category) {
		this.category = category;
	}
	public Xhproduct getProduct() {
		return product;
	}
	public void setProduct(Xhproduct product) {
		this.product = product;
	}
	
	public List<Xhcategory> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Xhcategory> categorys) {
		this.categorys = categorys;
	}
	public List<Xhproduct> getProducts() {
		return products;
	}
	public void setProducts(List<Xhproduct> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "Category_Product [id=" + id + ", pid=" + pid + ", catid="
				+ catid + ", category=" + category + ", product=" + product
				+ "]";
	}
	
}
