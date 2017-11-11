package com.xh.back.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.other.msg.Msg;
import com.xh.back.bean.Xhad;
import com.xh.back.bean.XhqueryAd;
import com.xh.back.serviceImpl.AdServiceImpl;

@Controller
@RequestMapping("ad")
public class AdController {
	   @Autowired
	   @Qualifier("adService")
	   private AdServiceImpl adService;
	   
	   //--查看所有未投放的广告信息  --
	   @RequestMapping("queryNotSattueAllAds.action")
       public String queryNotSattueAllAds(Model model){
    	   List<XhqueryAd> allAds=adService.queryNotSattueAllAds();
    	   model.addAttribute("allAds", allAds);
    	   return "/jsp/back/ad/queryAllAds.jsp"; 
       }
	   
	 //--查看所有投放的广告信息  --
	   @RequestMapping("queryStatueAllAds.action")
       public String queryStatueAllAds(Model model){
    	   List<XhqueryAd> allAdss=adService.queryStatueAllAds();
    	   model.addAttribute("allAdss", allAdss);
    	   return "/jsp/back/ad/queryGressAllAds.jsp"; 
       }
	   
	   //--查看广告信息 列表 --
	   @RequestMapping("queryAllAdsList.action")
       public String queryAllAdsList(Model model){
    	   List<XhqueryAd> allAdsList=adService.queryAllAdsList();
    	   model.addAttribute("allAdsList", allAdsList);
    	   return "/jsp/back/ad/queryAllAdsList.jsp"; 
       }
	   
	   
	 //--查看所有投放广告信息  --
	   @RequestMapping("queryStatueAllAdsJSON.action")
	   @ResponseBody
       public Msg queryStatueAllAdsJSON(){
    	   List<XhqueryAd> allAds=adService.queryStatueAllAds();
    	   if(allAds!=null){
   			return Msg.success().add("allAds", allAds);
   		}
   		return Msg.fail(); 
       }
	   
	 //--查看所有未投放广告信息  --
	   @RequestMapping("queryNotAllAdsJSON.action")
	   @ResponseBody
       public Msg queryNotAllAdsJSON(){
    	   List<XhqueryAd> allAds=adService.queryNotSattueAllAds();
    	   if(allAds!=null){
   			return Msg.success().add("allAds", allAds);
   		}
   		return Msg.fail(); 
       }
	   
	  
	   
	   //--查看某条广告的信息  --
	   @RequestMapping("queryadById.action")
	   public String queryadById(Model model,int id){
		   XhqueryAd oneAd=new XhqueryAd();
		   System.out.println(id);
		   oneAd=adService.queryadById(id);
		   model.addAttribute("oneAd", oneAd);
		   return "/jsp/back/ad/queryAdInfo.jsp";
	   }
	   
	   //--修改广告信息  --
	   @RequestMapping("updateAd.action")
	   public String updateAd(HttpServletRequest req){
		   String ids=req.getParameter("ids");
		   adService.updateaAdStatue(ids);
		   return "forward:/ad/queryStatueAllAds.action";
	   }
	   
	   //--删除广告--
	   @RequestMapping("deleteAd.action")
	   public String  deleteAd(int id){
		   if(id>0){
		   adService.deleteAd(id);
		   }
		   return "forward:/ad/queryAllAdsList.action";
	   }
	   
	   //添加广告信息
	   @RequestMapping("insertAd.action")
	   public String insertAd(){
		   XhqueryAd xhqueryAd=new XhqueryAd();
		   adService.insertAd(xhqueryAd);
		   return "/jsp/back/ad/addAd.jsp";
	   }
	    
	   //批量添加投放广告
	   @RequestMapping("updateaAdNotStatue.action")
	   public String updateaAdStatue(HttpServletRequest req){
		   String ids=req.getParameter("ids");
		   adService.updateaAdStatue(ids);
		   return "forward:/ad/queryNotSattueAllAds.action";
      }
	   
	   //添加投放广告
	   @RequestMapping("updateaAdById.action")
	  public String updateaAdById(HttpServletRequest req){
		  String id=req.getParameter("id");
		   adService.updateaAdById(Integer.parseInt(id));
		   return "forward:/ad/queryNotSattueAllAds.action";
	  }
	   
	 //批量删除投放广告
	   @RequestMapping("updateaAdStatuede.action")
	   public String updateaAdStatuede(HttpServletRequest req){
		   String ids=req.getParameter("ids");
		   adService.updateaAdStatuede(ids);
		   return "forward:/ad/queryStatueAllAds.action";
      }
	   
	 //删除投放广告
	   @RequestMapping("updateaAddeById.action")
	  public String updateaAddeById(HttpServletRequest req){
		  String id=req.getParameter("id");
		   adService.updateaAddeById(Integer.parseInt(id));
		   return "forward:/ad/queryStatueAllAds.action";
		  
	  }
}
