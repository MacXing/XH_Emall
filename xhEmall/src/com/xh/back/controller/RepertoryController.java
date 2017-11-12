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
import com.sun.mail.iap.Response;
import com.xh.back.bean.Xhinput;
import com.xh.back.bean.Xhoutput;
import com.xh.back.bean.Xhproduct;
import com.xh.back.bean.Xhrepertory;
import com.xh.back.bean.Xhstock;
import com.xh.back.service.RepertoryService;
import com.xh.back.service.SalesService;
import com.xh.front.bean.Xhusers;

@Controller
@RequestMapping("repertory")
public class RepertoryController {
	@Autowired
	@Qualifier("repertoryService")
	private RepertoryService repertoryService;
	
	//查询所有仓库（用于仓库管理）
	@RequestMapping("queryAllRepertory.action")
	public String queryAllRepertory(Model model){
		List<Xhrepertory> xhrepertories = repertoryService.queryAllRepertory();
		model.addAttribute("xhrepertories", xhrepertories);
		return "/jsp/back/warehouse/housequery.jsp";
	}
	
	//根据ID查询仓库
	@RequestMapping("queryRepertoryById.action")
	@ResponseBody
	public Xhrepertory queryRepertoryById(Integer repid){			
		Xhrepertory xhrepertory = repertoryService.queryRepertoryById(repid);
		return xhrepertory;
	}
	
	//增加仓库
	@RequestMapping("addRepertory.action")
	public String addRepertory(Xhrepertory xhrepertory){
		repertoryService.addRepertory(xhrepertory);
		return "/jsp/back/warehouse/addhouse.jsp";	
	}
	
	//更新仓库
	@RequestMapping("updateRepertory.action")
	public String updateRepertory(Xhrepertory xhrepertory){
		repertoryService.updateRepertory(xhrepertory);
		return "forward:/repertory/queryAllRepertory.action";
	}
	
	//删除仓库
	@RequestMapping("deleteRepertory.action")
	public String deleteRepertory(Integer repid){
		repertoryService.deleteRepertory(repid);
		return "forward:/repertory/queryAllRepertory.action";
	}
	
	//查询库存
	@RequestMapping("queryStock.action")
	public String queryStock(Model model){
		List<Xhrepertory> xhrepertories = repertoryService.queryStock();
		model.addAttribute("xhrepertories", xhrepertories);
		return "/jsp/back/warehouse/stockquery.jsp";
	}
	
	//查询所有商品
	@RequestMapping("queryAllProduct.action")
	public String queryAllProduct(Model model){
		List<Xhproduct> xhproducts = repertoryService.queryAllProduct();
		model.addAttribute("xhproducts", xhproducts);
		return "/jsp/back/warehouse/stockinout.jsp";
	}
	
	//查询所有仓库（用于进出货管理）
	@RequestMapping("queryRepertory.action")
	@ResponseBody
	public List<Xhrepertory> queryRepertory(){
		return repertoryService.queryAllRepertory();			
	}
	
	@RequestMapping("queryRepertoryByPid.action")
	@ResponseBody
	public List<Xhrepertory> queryRepertoryByPid(Integer pid){
		return repertoryService.queryRepertoryByPid(pid);
	}
	
	//进货
	@RequestMapping("addInput.action")
	@ResponseBody
	public Msg addInput(Xhinput xhinput){
		Xhstock xhstock = new Xhstock();
		xhstock.setPid(xhinput.getPid());
		xhstock.setRepid(xhinput.getRepid());
		xhstock.setStonumber(xhinput.getInputnumber());
		if(xhstock.getStonumber()!=null && xhstock.getStonumber()!=0){
			Xhstock xhstocktest = repertoryService.queryStockById(xhstock);
			if(xhstocktest != null){
				xhstock.setStoid(xhstocktest.getStoid());
				repertoryService.updateStock(xhstock);
			}else {
				repertoryService.addStock(xhstock);
			}
			repertoryService.addInput(xhinput);
			return Msg.success();
		}else {
			return Msg.fail();
		}
	
	}
	
	//出货
	@RequestMapping("addOutput.action")
	@ResponseBody
	public Msg addOutput(Xhoutput xhoutput){		
		Xhstock xhstock = new Xhstock();
		xhstock.setPid(xhoutput.getPid());
		xhstock.setRepid(xhoutput.getRepid());
		xhstock.setStonumber(xhoutput.getOutputnumber());
		
		Integer stonumber = repertoryService.queryStockById(xhstock).getStonumber();
		if (xhstock.getStonumber()!=null && xhstock.getStonumber()!=0 && xhstock.getStonumber()<stonumber) {
			repertoryService.cutStock(xhstock);
			
			xhstock.setRepid(xhoutput.getRepid2());
			Xhstock xhstocktest = repertoryService.queryStockById(xhstock);
			if(xhstocktest != null){				
				xhstock.setStoid(xhstocktest.getStoid());
				repertoryService.updateStock(xhstock);
			}else {
				repertoryService.addStock(xhstock);
			}
			repertoryService.addOutput(xhoutput);
			return Msg.success();			
		}else {
			return Msg.fail();
		}		
	}
	
	@RequestMapping("queryAllInput.action")
	public String queryAllInput(Model model){
		List<Xhinput> xhinputs = repertoryService.queryAllInput();
		model.addAttribute("xhinputs", xhinputs);
		return "/jsp/back/warehouse/inputquery.jsp";
	}
	
	@RequestMapping("queryAllOutput.action")
	public String queryAllOutput(Model model){
		List<Xhoutput> xhoutputs = repertoryService.queryAllOutput();
		model.addAttribute("xhoutputs", xhoutputs);
		return "/jsp/back/warehouse/outputquery.jsp";
	}
}
