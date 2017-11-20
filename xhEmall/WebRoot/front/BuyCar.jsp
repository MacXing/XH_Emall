<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BuyCar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" rel="stylesheet" href="front/css/style.css" />
	
   	<script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>
   	<script type="text/javascript" src="front/js/jquery-1.4.2.min.js"></script>
   	<script type="text/javascript" src="front/js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="front/js/menu.js"></script>    
                
	<script type="text/javascript" src="front/js/n_nav.js"></script>   
    
    <script type="text/javascript" src="front/js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="front/js/shade.js"></script>
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript">
      $(function(){
         initCheckBox();
         showTotal();
      });
    </script>
  </head>  
<body>

<!--Begin Header Begin-->
<jsp:include page="/front/head.jsp"/>
<!--End Menu End-->
 
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="front/images/img1.jpg" />        
    </div>
    
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
			<c:choose>
				<c:when test="${empty trolleyItem}">
					<table border="0" class="car_tab" align="center" style="width:1200px; margin-bottom:50px;"
						cellspacing="0" cellpadding="0" id="buycar">
						<tr>
							<td align="center">
								<img src="front/images/empty.jpg" />
							</td>

						</tr>
					</table>
				</c:when>

				<c:otherwise>

					<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0"
						cellpadding="0" id="buycar">
						<tr>
							<td class="car_th" width="70px">
								<input type="checkbox" id="selectAll" checked="checked" onclick="selectedAll(this)"
									name="chkAll">
								<label for="selectAll">全选</label>
							</td>
							<td class="car_th" width="490">商品名称</td>
							<td class="car_th" width="140">属性</td>
							<td class="car_th" width="150">购买数量</td>
							<td class="car_th" width="130">售价</td>
							<td class="car_th" width="130">小计</td>
							<td class="car_th" width="140">返还积分</td>
							<td class="car_th" width="150">操作</td>
						</tr>
						<c:forEach items="${trolleyItem}" var="items">
							<tr>
								<td>
									<input type="checkbox" class="delids" name="checkboxBtn" value="${items.troid}">
									<input type="hidden" value="${items.troid}" id="inputroid" />
								</td>
								<td>
									<div class="c_s_img">
										<img src="front/images/c_1.jpg" width="73" height="73" />
									</div>
									${items.xhproduct.pname}
								</td>
								<td align="center">
									<span>单位：</span>
									<span>${items.xhproduct.punit}</span>
								</td>
								<td align="center">
									<div class="c_num">
										<input type="button" value="" onclick="mul(${items.troid},${items.tronum})"
											class="car_btn_1" />
										<input type="text" value="${items.tronum}" name="" class="car_ipt" />
										<input type="button" value="" onclick="add(${items.troid},${items.tronum})"
											class="car_btn_2" />
								</td>
								<td align="center">
									<span class="psale">${items.xhproduct.psale}</span>
								</td>
								<td align="center" style="color:#ff4e00;" class="sub" id="sub${items.troid }">${items.subTotal}</td>
								<td align="center">${items.xhproduct.psale}<span>R</span>
								</td>
								<td align="center">
									<a onclick="ShowDiv('MyDiv','fade')">删除</a>
								</td>
							</tr>
						</c:forEach>
						<tr height="70">
							<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
								<span class="fr">
									商品总价：
									<label style="font-size:22px; color:#ff4e00;">￥</label>
									<b style="font-size:22px; color:#ff4e00;" id="total"></b>
								</span>

							</td>
						</tr>
						<tr valign="top" height="150">
							<td colspan="6" align="right">
								<a href="${pageContext.request.contextPath}/front/index.jsp">
									<img src="front/images/buy1.gif" />
								</a>
								&nbsp; &nbsp;
								<a href="javascript:void(0);" id="settlement" class="settlement" onclick="settlement()">
									<img src="front/images/buy2.gif" />
								</a>
							</td>
						</tr>
					</table>
					<form method="post" action="${pageContext.request.contextPath}/trolley/loadItemsFront.action"
						id="submitOrder">
						<input name="id" type="hidden" id="itemids">
						<input name="total" type="hidden" id="totals">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
    
	<!--End 第一步：查看购物车 End--> 
    
    
    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="front/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a onclick="delete_cart()" class="b_sure">确定</a><a  <%-- href="${pageContext.request.contextPath }/" --%> class="b_close">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-删除商品 End-->
    
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
    	<dl>                                                                                            
        	<dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
        	<a href="#" class="b_sh1">新浪微博</a>            
        	<a href="#" class="b_sh2">腾讯微博</a>
            <p>
            服务热线：<br />
            <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="front/images/er.gif" width="118" height="118" /></div>
            <img src="front/images/ss.png" />
        </div>
    </div>    
    <div class="btmbg">
		<div class="btm">
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="front/images/b_1.gif" width="98" height="33" /><img src="front/images/b_2.gif" width="98" height="33" /><img src="front/images/b_3.gif" width="98" height="33" /><img src="front/images/b_4.gif" width="98" height="33" /><img src="front/images/b_5.gif" width="98" height="33" /><img src="front/images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->  
</div>


<script type="text/javascript">
  function mul(id,num){	
	if(num<1){
		alert("别再减了，亲！");
		return;
	}else{
	var num1 = num-1;
	$.ajax({
		url:"${pageContext.request.contextPath}/trolley/modifyTrolley.action?id="+id+"&num="+num1,
		type:"GET",
		success:function(result){ 
		showTotal();      
       	if(result.code==100){
       		window.location.href="${pageContext.request.contextPath}/trolley/findByUser.action";
       	}
       }
	});
	}
}

 function add(id,num){
    var num1=num+1;  
    $.ajax({
       url:"${pageContext.request.contextPath}/trolley/modifyTrolley.action?id="+id+"&num="+num1,
       type:"GET",
       success:function(result){ 
       showTotal();       
       	if(result.code==100){
       		window.location.href="${pageContext.request.contextPath}/trolley/findByUser.action";
       		
       	}
       }
    });
};  

/*删除  */
function delete_cart(){ 
  	var troid = $("#inputroid").val();
    $.ajax({
       url:"${pageContext.request.contextPath}/trolley/deleteTrolleyForFront.action?id="+troid,
       type:"GET",
       success:function(result){
       alert(result.code);      
       	if(result.code==100){
       		window.location.href="${pageContext.request.contextPath}/trolley/findByUser.action";
       	}
       }
    });
};  
    
    /*结算  */
   function settlement(){
       var ids=Array();
       $("input[type=checkbox][name=checkboxBtn]:checked").each(function(index,domEle){
        ids.push($(domEle).val());
        $("#itemids").val(ids);
        $("#totals").val($("#total").text());
        $("#submitOrder").submit();    
       });
    } 
  
   function showTotal() {
       var text;
       var total = 0;
       $("input[type=checkbox][name=checkboxBtn]:checked").each(function( index, domEle) {
           
           var id = $(domEle).val();
           console.log(id);
           text = $("#sub"+id).text();
           console.log(text);
           total += Number(text);
       });
       $("#total").text(total);
   }  
   function selectedAll(obj){
   //应该根据复选框的状态去设置子选框的状态
    $("input[type=checkbox][name=checkboxBtn]").each(function(index, ele){
    	//$(ele).attr("checked",$(obj).attr("checked"));
    	ele.checked = obj.checked;
    });
    showTotal();
   } 
   
         /* 实现全选 */
    function initCheckBox() {
   		
      $("input[type=checkbox][name=checkboxBtn]").click(function() {
          var all = $("input[type=checkbox][name=checkboxBtn]").length;//所有条目的个数
          var selected = $("input[type=checkbox][name=checkboxBtn]:checked").length;
          var selectAll = $("#selectAll");
         if(all == selected) {
             selectAll.prop("checked", true);
          } else if(selected == 0) {
             selectAll.prop("checked", false);
          } else {
             selectAll.prop("checked", false);
         }
          showTotal();
      });
 }
 
 
</script>

  </body>
</html>
