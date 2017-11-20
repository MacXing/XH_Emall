package com.xh.back.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xh.back.bean.Xhad;
import com.xh.back.bean.XhqueryAd;

public interface AdService {
	//--查看所有未投放的广告信息  --
	public List<XhqueryAd> queryNotSattueAllAds();
	
	//--查看所有投放的广告信息  --
	public List<XhqueryAd> queryStatueAllAds();
	
	//查看所有的广告信息列表
	public List<Xhad> queryAllAdsList();
	//--查看某条广告的信息  --
	public Xhad queryadById(int id);
	//--添加广告  --
	public void insertAd(Xhad ad);
	//--修改广告信息  --
	public void updateAd(String ids);
	//--删除广告  --
	public void deleteAd(int id);
	
	public void updateaAdStatue(String ids);
	
	 public void updateaAdStatuede(String ids);
	 
	 public void updateaAdById(int id);
	 
	 public void updateaAddeById(int id);
	
}
