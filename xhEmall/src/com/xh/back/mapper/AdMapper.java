package com.xh.back.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xh.back.bean.Xhad;
import com.xh.back.bean.XhqueryAd;


public interface AdMapper {
    public List<XhqueryAd> queryNotSattueAllAds();
    
    public List<XhqueryAd> queryStatueAllAds();
    
    public List<Xhad> queryAllAdsList();
    
    public Xhad queryadById(int id);
    
    public void insertAd(Xhad ad);
    
    public void updateAd(@Param("idslist")List<String> idslist);
    
    public void deleteAd(int id);
    
    public void updateaAdStatue(@Param("idslist")List<String> idslist);
    
    public void updateaAdStatuede(@Param("ids")List<String> idss);
    
    public void updateaAdById(int id);
    
    public void updateaAddeById(int id);
  
}
