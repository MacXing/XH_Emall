package com.xh.back.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getImage.FileUtil;
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
    	   List<Xhad> allAdsList=adService.queryAllAdsList();
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
		  /* XhqueryAd oneAd=new XhqueryAd();*/
		   System.out.println(id);
		   Xhad oneAd=adService.queryadById(id);
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
	   @ResponseBody
	   public Msg  deleteAd(int id,HttpServletRequest request) throws Exception{
		   String url ="";
		   
		   if(id>0){
			   url = adService.queryadById(id).getAdlink();
				if(!url.equals("")){
					String urlpath = request.getServletContext().getRealPath(url);
					FileUtil.deleteFile(urlpath);	
					adService.deleteAd(id);
				}
				adService.deleteAd(id);
				return Msg.success();
		   }
		   return Msg.fail();
	   }
	   
	   //添加广告信息
	   @RequestMapping("insertAd.action")
	   @ResponseBody
	   public Msg insertAd(MultipartFile file,HttpServletRequest request,Xhad ad) throws IllegalStateException, IOException{
		    String url = "";
			if(file!=null){
				String file_name = file.getOriginalFilename();
				//判读是不是图片
				String extName = file_name.substring(file_name.lastIndexOf(".")+1,file_name.length());
				String regex="(gif|jpg|jpeg|png|JPG|PNG)";
				if(!Pattern.matches(regex, extName)){
					return Msg.fail();	
				}
				String savePath = request.getServletContext().getRealPath("/upload/ad/");			
				file_name = FileUtil.uploadFile(file, savePath, file_name);
				url="/upload/ad/"+file_name;	
			}
			ad.setAdstarttime(new Date());
			ad.setAdlink(url);
		   adService.insertAd(ad);
		   return Msg.success();
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
