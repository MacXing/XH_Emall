package com.xh.back.bean;

import java.util.List;

public class Xhcategory {
    private Integer catid;

    private Integer parentid;

    private String catname;

    private String catdesc;

    private Integer sortorder;

    private Integer isshow;

    private Integer catgrade;

    private String attribute1;

    private String attribute2;

    private String attribute3;
    
    private List<Xhcategory> categorys;
    
	private Xhcategory category;
	
	private List<Xhproduct> products;

	public List<Xhproduct> getProducts() {
		return products;
	}

	public void setProducts(List<Xhproduct> products) {
		this.products = products;
	}

	public Xhcategory getCategory() {
		return category;
	}

	public void setCategory(Xhcategory category) {
		this.category = category;
	}

	public List<Xhcategory> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Xhcategory> categorys) {
		this.categorys = categorys;
	}

	public Integer getCatid() {
        return catid;
    }

    public void setCatid(Integer catid) {
        this.catid = catid;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname == null ? null : catname.trim();
    }

    public String getCatdesc() {
        return catdesc;
    }

    public void setCatdesc(String catdesc) {
        this.catdesc = catdesc == null ? null : catdesc.trim();
    }

    public Integer getSortorder() {
        return sortorder;
    }

    public void setSortorder(Integer sortorder) {
        this.sortorder = sortorder;
    }

    public Integer getIsshow() {
        return isshow;
    }

    public void setIsshow(Integer isshow) {
        this.isshow = isshow;
    }

    public Integer getCatgrade() {
        return catgrade;
    }

    public void setCatgrade(Integer catgrade) {
        this.catgrade = catgrade;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1 == null ? null : attribute1.trim();
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2 == null ? null : attribute2.trim();
    }

    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3 == null ? null : attribute3.trim();
    }

	@Override
	public String toString() {
		return "Xhcategory [catid=" + catid + ", parentid=" + parentid
				+ ", catname=" + catname + ", catdesc=" + catdesc
				+ ", sortorder=" + sortorder + ", isshow=" + isshow
				+ ", catgrade=" + catgrade + ", attribute1=" + attribute1
				+ ", attribute2=" + attribute2 + ", attribute3=" + attribute3
				+ ", categorys=" + categorys + ", category=" + category + "]";
	}
    
}