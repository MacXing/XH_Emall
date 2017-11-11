package com.xh.back.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xh.back.bean.Xhad;
import com.xh.back.bean.XhqueryAd;
import com.xh.back.mapper.AdMapper;
import com.xh.back.service.AdService;

public class AdServiceImpl implements AdService{
	@Autowired
	@Qualifier("adMapper")
    private AdMapper adMapper;
	
	@Override
	public List<XhqueryAd> queryNotSattueAllAds() {
		
		return adMapper.queryNotSattueAllAds();
	}
	@Override
	public List<XhqueryAd> queryStatueAllAds(){
		return adMapper.queryStatueAllAds();
	}
	@Override
	public List<XhqueryAd> queryAllAdsList(){
		return adMapper.queryAllAdsList();
	}

	
	@Override
	public XhqueryAd queryadById(int id) {
		
		return adMapper.queryadById(id);
	}

	@Override
	public void insertAd(XhqueryAd xhqueryAd) {
		adMapper.insertAd(xhqueryAd);
		
	}

	@Override
	public void updateAd(String ids) {
		List<String> idlist=getList(ids);
		adMapper.updateAd(idlist);
		
	}

	@Override
	public void deleteAd(int id) {
		adMapper.deleteAd(id);
		
	}

	
	@Override
	public void updateaAdStatue(String id){
		List<String> idlist=getList(id);
		adMapper.updateaAdStatue(idlist);
	}
	
	public List<String> getList(String id){
		List<String> list=new ArrayList<String>();
		String[] str=id.split(","); 
		for(String string:str){
			list.add(string);
		}
		return list;
	}
	
	@Override
	public void updateaAdStatuede(String id){
		List<String> idlist=getList(id);
		adMapper.updateaAdStatuede(idlist);
	}
	@Override
	public void updateaAdById(int id){
		adMapper.updateaAdById(id);
	}
	@Override
	public void updateaAddeById(int id){
		adMapper.updateaAddeById(id);
	}

}
