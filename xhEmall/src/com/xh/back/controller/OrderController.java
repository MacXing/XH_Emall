package com.xh.back.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.other.msg.Msg;
import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.service.OrderService;


@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	@RequestMapping("queryAllOrderController.action")
	public String queryAllOrderController(Model model){
        List<Xhorderinfo> order = orderService.queryAllUsersOreder();		
		model.addAttribute("order", order);
		//返回到查询JSP
		return "/jsp/back/order/queryOrders.jsp";
	}
	
	@ResponseBody
	@RequestMapping("queryOrderByIdForDetail")
	public Xhorderinfo queryOrderByIdForDetail(int id){
		Xhorderinfo order =orderService.queryOrderById(id);
		System.out.println(order);
		return order;
	}
		
	@RequestMapping("addOrder.action")
	@ResponseBody
	public Msg addOrder(Xhorderinfo order,HttpServletRequest request,Model model){
		
		//获取前端选择的省市县所属id
		String provinceid=request.getParameter("addprovince");
		String cityid=request.getParameter("addcity");
		String areaid=request.getParameter("adddistrict");	
		String resultuserid=request.getParameter("userid");
		String resultexpid=request.getParameter("shoppingid");
		Msg result1=new Msg();
		Msg result2=new Msg();
		
		if(resultuserid.equals("")||resultexpid.equals("")){
			result1=checkAddUser(0);
			result2=checkAddExpress(0);
		}else{
			result1=checkAddUser(Integer.parseInt(resultuserid));
			result2=checkAddExpress(Integer.parseInt(resultexpid));
		}
		
		if(result1.getCode()==100 && result2.getCode()==100){
			//通过ID
			order.setOrdertime(new Date());
			order.setPaytime(new Date());
			
			//添加发货时间
			if(order.getShoppingstatus()==1){
				order.setSendtime(new Date());
			}
			
			//查询省市县所属id所对应的名称，并加入订单对象
			order.setAddprovince(orderService.getProvinceName(provinceid));
			order.setAddcity(orderService.getCityName(cityid));
			order.setAdddistrict(orderService.getAreaName(areaid));
			
			orderService.addOrder(order);
		}else {
			return Msg.fail();
		}	
		return Msg.success();
	}
	
	@RequestMapping("deleteOrder.action")
	public String deleteOrder(int id){
		//通过ID
		orderService.deleteOrderById(id);
		return "/order/queryAllOrderController.action";
	}
	
	
	@RequestMapping("updateOrder.action")
	@ResponseBody
	public Msg updateOrder(Xhorderinfo order,HttpServletRequest request){		
		//获取前端选择的省市县所属id和发货状态
		String provinceid=request.getParameter("addprovince");
		String cityid=request.getParameter("addcity");
		String areaid=request.getParameter("adddistrict");	
		String resultuserid=request.getParameter("userid");
		String resultexpid=request.getParameter("shoppingid");
		Msg result1=new Msg();
		Msg result2=new Msg();
		if(resultuserid.equals("")||resultexpid.equals("")){
			result1=checkAddUser(0);
			result2=checkAddExpress(0);
		}else{
			result1=checkAddUser(Integer.parseInt(resultuserid));
			result2=checkAddExpress(Integer.parseInt(resultexpid));
		}
		
		if(result1.getCode()==100 && result2.getCode()==100){
			//通过ID
			order.setOrdertime(new Date());
			order.setPaytime(new Date());
			
			//更新发货时间
			if(order.getShoppingstatus()==1){
				order.setSendtime(new Date());
			}
			
			//查询省市县所属id所对应的名称，并加入订单对象
			order.setAddprovince(orderService.getProvinceName(provinceid));
			order.setAddcity(orderService.getCityName(cityid));
			order.setAdddistrict(orderService.getAreaName(areaid));		
			
			orderService.modifyOrderById(order);
		}else {
			return Msg.fail();
		}
		
		return Msg.success();
	}
	
	//获取省份、城市、地区
	//获取省份
	@RequestMapping("getProvincelist.action")
	@ResponseBody
	public Msg getProvincelist(Model model){
		List<OrderProvince> provincelist=orderService.getAllProvince();
		if(provincelist!=null){
			return Msg.success().add("provincelist", provincelist);
		}
		return Msg.fail();
	}	
	
	//根据省份id获取城市数据后直接使用@ResponseBody装成json数据
	@RequestMapping("getCityByProvinceId.action")
    @ResponseBody
	public Msg getCityByProvinceId(String id){
	    List<OrderCity> citylist = orderService.getCityByProvinceId(id);
	    if (citylist!=null){
	    	return Msg.success().add("citylist", citylist);
	    } else {
	    	return Msg.fail();
	    }
	}
	  
    //根据城市id获取区域数据后直接使用@ResponseBody装成json数据
    @RequestMapping("getAreaByCityId.action")
    @ResponseBody
    public Msg getAreaByCityId(String id){
        List<OrderArea> arealist = orderService.getAreaByCityId(id);
        if (arealist!=null){
        	return Msg.success().add("arealist", arealist);
        } else {
        	return Msg.fail();
        }
    }  
	
    @RequestMapping("querySendOrderController.action")
	public String querySendOrderController(Model model){
        List<Xhorderinfo> sendlist = orderService.getSendOrder(1);		
		model.addAttribute("sendlist", sendlist);
		//返回到查询JSP
		return "/jsp/back/order/queryOrdersSend.jsp";
	} 
    
    @RequestMapping("checkAddUser.action")
    @ResponseBody
	public Msg checkAddUser(int id){
    	int result=orderService.checkUser(id);
    	if(result>0){
    		return Msg.success();
    	}
		return Msg.fail1();
	} 
    
    @RequestMapping("checkAddExpress.action")
    @ResponseBody
	public Msg checkAddExpress(int id){		
    	int result=orderService.checkExpress(id);
    	if(result>0){
    		return Msg.success();
    	}
		return Msg.fail1();
	} 
    //查看所有未发货的订单
    @RequestMapping("queryAllOrderNotShop.action")
    public String queryAllOrderNotShop(Model model){
    	List<Xhorderinfo> orders = orderService.queryAllOrderNotShop();
    	model.addAttribute("orders", orders);
    	return "/jsp/back/order/queryAllOrderNotShop.jsp";
    }
    
    @RequestMapping("updateShoppingStatus.action")
    @ResponseBody
    public Msg updateShoppingStatus(int id){
    	if(id>0){
    		orderService.updateOrderShop(id);
    		return Msg.success();
    	}
    	return Msg.fail();
    }
}
