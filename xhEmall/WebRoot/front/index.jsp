<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(application.getAttribute("init")==null||application.getAttribute("init")==""){
		response.sendRedirect(request.getContextPath()+"/home/home.action");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>孝和电商</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link href="//csdnimg.cn/public/favicon.ico" rel="icon">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="front/css/style.css" />
	<script type="text/javascript" src="front/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="front/js/jquery.bxslider_e88acd1b.js"></script>   
    <script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="front/js/menu.js"></script>           
	<script type="text/javascript" src="front/js/select.js"></script>    
	<script type="text/javascript" src="front/js/lrscroll.js"></script>
    <script type="text/javascript" src="front/js/iban.js"></script>
    <script type="text/javascript" src="front/js/fban.js"></script>
    <script type="text/javascript" src="front/js/f_ban.js"></script>
    <script type="text/javascript" src="front/js/mban.js"></script>
    <script type="text/javascript" src="front/js/bban.js"></script>
    <script type="text/javascript" src="front/js/hban.js"></script>
    <script type="text/javascript" src="front/js/tban.js"></script>   
	<script type="text/javascript" src="front/js/lrscroll_1.js"></script>

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?a7dc93e4ba6534c4c3a6a05c33c7d6a8";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>



  
<body>

<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
    	<!--Begin 所在收货地区 Begin-->
    	<span class="s_city_b">
        </span> 
        <!--End 所在收货地区 End-->
		<span class="fr">
			<span class="fl">
			   <input type="hidden" id="loginuser" name="user" value="${current_user.userid}"/>
				<c:if test="${current_user == null }">
					你好，请
					<a href="front/Login.jsp">登录</a>
					&nbsp;
					<a href="front/Regist.jsp" style="color:#7d9b16;">免费注册</a>
				</c:if>
				<c:if test="${current_user != null}">
					欢迎您，<a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
					&nbsp;|&nbsp;
					<a class="logout">退出登录</a>
				</c:if>
				&nbsp;|&nbsp;
				<c:if test="${current_user == null }">
				<a href="front/Login.jsp">我的订单</a>
				</c:if>
				<c:if test="${current_user != null }">
				<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid}">我的订单</a>
				</c:if>
				&nbsp;|
				<c:if test="${current_user == null }">
				<a href="front/Login.jsp">我的购物车</a>
				</c:if>
				<c:if test="${current_user != null }">
				<a href="${pageContext.request.contextPath }/trolley/findByUserCart.action">我的购物车</a>
				&nbsp;|
				</c:if>
			</span>
			<span class="ss">
				<div class="ss_list">
					<a href="#">收藏夹</a>
					<div class="ss_list_bg">
						<div class="s_city_t"></div>
						<div class="ss_list_c">
							<ul>
								<li>
									<a href="#">我的收藏夹</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="ss_list">
					<a href="#">客户服务</a>
					<div class="ss_list_bg">
						<div class="s_city_t"></div>
						<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">客户服务</a>
									</li>
								</ul>
					        </div>
					    </div>
				    </div>
					<div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<c:forEach items="${CP}" var="item">
									<li>
										<a href="${pageContext.request.contextPath}/home/queryAllProductsByCatid.action?catid=${item.catid}">${item.catname }</a>
									</li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>    
                </div>
            </span>          
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="home/home.action"><img src="front/images/logo.png" /></a></div>
    <div class="search">
    	<form action="${pageContext.request.contextPath}/ProductList/queryAllProductByFind.action"
				method="post">
				<input type="text" name="pname" value="" id="keyword" class="s_ipt" />
				<button type="submit" class="s_btn">搜索</button>
		</form>                     
    </div>
    <div class="i_car">
    	<div class="car_t">购物车 </div>
        <div class="car_bg">
       		<!--Begin 购物车未登录 Begin-->
       		<c:if test="${current_user == null }">
        	<div class="un_login">还未登录！<a href="front/Login.jsp" style="color:#7d9b16;">马上登录</a> 查看购物车！</div>
        	</c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <c:if test="${current_user!=null }">
            <ul class="cars" id="cart">
           
            
            <c:forEach items="${trolleyItem}" var="items">
            	<li>
            		<input type="hidden" id="falg" value="${falg}">
            		<input type="hidden" id="tro" value="${trolleyItem}">
                	<div class="img"><a href="#"><img src="${pageContext.request.contextPath}${items.xhproduct.pimg}" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">${items.xhproduct.pname}</a></div>
                    <div class="price"><font color="#7d9b16">￥${items.xhproduct.psale}</font> X${items.tronum}</div>
                </li>
               
                </c:forEach>
            </ul>
            <div class="price_a"><a href="${pageContext.request.contextPath}/trolley/findByUserCart.action">去购物车结算</a></div>
            </c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
<!--End Header End--> 
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul id="category">
                <c:set var="i" value="-1"/>
                <c:set var="s" value="0"/>
                <c:set var="e" value="4"/>
                <c:forEach items="${categoryList }" var="item" varStatus="j">   
                     <c:if test="${item.catid!=1 }">
                     	<c:if test="${item.catgrade==1 }">
                     	<c:set var="i" value="${i+1 }"></c:set>	
                     	<li>
                    	<div class="fj">
                        	<span class="n_img"><span></span><!-- <img src="front/images/nav1.png" /> --></span>
                            <span class="fl">${item.catname}</span> 
                        </div>
                        <div class="zj" style="top:${-i*40}px;" test="${i}">
                            <div class="zj_l">
                            
                             <c:forEach begin="0" end="2">
                             <c:set var="a" value="0"/>
                             <c:set var="b" value="5"/>
                                <div class="zj_l_c">
	                                <c:forEach items="${categoryList }" var="item2">                                 
	                                    <c:if test="${item2.parentid==item.catid&&item2.catgrade==2 }">
	                                    	<c:set var="a" value="${a+1 }"/>
	                                    	<c:if test="${a<12 }">
	                                    	<a href="${pageContext.request.contextPath}/home/queryproductsByCategory.action?catid=${item2.catid}">${item2.catname }</a>
	                                   		</c:if>
	                                    </c:if>
	                                </c:forEach>
	                                <hr>                                                                                 
                                </div>           
                             </c:forEach>   
                            </div>
                           <div class="zj_r">                    
								    <c:forEach items="${brands }" var="item" begin="${s }" end="${e }">
								    	<a href="${pageContext.request.contextPath}/home/queryProductsByBrand.action?brandid=${item.brandid}">
								    	<img src="${pageContext.request.contextPath}${item.image }" width="100" height="70"/></a>
								    </c:forEach>
								     <c:set var="s" value="${e+1 }"/>
                					 <c:set var="e" value="${e+5 }"/>
                            </div>
                        </div>
                       
                         </li> 
                        </c:if>
                       </c:if> 
                   
                   </c:forEach> 
                </ul>            
            </div>
        </div>  
        <!--End 商品分类详情 End-->                                                     
    	<ul class="menu_r">
    		<li><a href="front/index.jsp">首页</a></li>
    		<c:forEach items="${CP }" var="item">                                                                                                                                              
        	<li><a href="${ pageContext.request.contextPath}/home/queryAllProductsByCatid.action?catid=${item.catid}">${item.catname }</a></li>
            </c:forEach> 
        </ul>
        <div class="m_ad">双十二·送好礼</div>
    </div>
</div>
<!--End Menu End-->

<div class="i_bg bg_color">
	<div class="i_ban_bg">
	<div id="pic1">
		<ul id="slideName1" class="slide_box bxslider">
		<c:forEach items="${navbars }" var="item">
	      <li><img src="${pageContext.request.contextPath}${item.url }" width="100%" height="500px" /></li>                   
	    </c:forEach>
	  	</ul>  
    </div>          
    <script type="text/javascript">     
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:jq(".bxslider .op_prev")[0],nextSelector:jq(".bxslider .op_next")[0]
            });
        })();
        
        $('#pic1 .focusBox li').click(function(){
            index = $('#pic1 .focusBox li').index(this);
            showPic(index);
         }).eq(0).trigger('click');
          
         $('#pic1 .sildebar').css("width",sWidth * (len));
        
    </script>
        <!--End Banner End-->
    </div>
	<div class="content mar_20">	    
	</div>
	    
    <!--Begin 食品饮料 Begin--> 
       
    <c:forEach items="${CP }" var="item" varStatus="i" begin="0" end="4">
    <div class="i_t mar_10">
    	<span class="floor_num">${i.index+1}F</span>
    	<span class="fl">${item.catname }</span>                              
    </div>
    <div class="content">
    	<div class="food_left">
        	<div class="food_ban">
            	<div id="imgPlay2">                   
                    <c:forEach items="${ads }" var="ad">
                    	 <c:if test="${ad.positionid==i.index+1 }">                  
                        <li><a href="#"><img src="${pageContext.request.contextPath }${ad.adlink}" width="211" height="286" /></a></li>
                    	</c:if>
                    </c:forEach>
                </div>   
            </div>
            <div class="fresh_txt">
            	<div class="fresh_txt_c">
            	<c:forEach items="${item.categorys }" var="item2">
                	<a href="${pageContext.request.contextPath}/home/queryproductsByCategory.action?catid=${item2.catid}">${item2.catname }</a>
                </c:forEach>
                </div>
            </div>
        </div>
        <div class="fresh_mid">
        	<ul>
        		<c:forEach items="${item.categorys}" var="item3" >
        		<c:forEach items="${item3.products }" var="item4" begin="0" end="2">
            	<li>
                	<div class="name"><a href="${pageContext.request.contextPath }/ProductDetails/queryImagesByPid.action?pid=${item4.pid }">${item4.pname }</a></div>
                    <div class="price">
                    	<font>￥<span>${item4.psale }</span></font> &nbsp;
                    </div>
                    <div class="img"><a href="${pageContext.request.contextPath }/ProductDetails/queryImagesByPid.action?pid=${item4.pid }"><img src="${pageContext.request.contextPath }${item4.pimg}" width="185" height="155" /></a></div>
                </li>
                </c:forEach>               
                </c:forEach>  
            </ul>
        </div>
    </div>
    </c:forEach>    
    <!--End 食品饮料 End-->
   
    <div class="content mar_20">
    	<!-- <img src="front/images/mban_1.jpg" width="1200" height="110" /> -->
    </div>
    
   
   
    <!--Begin 猜你喜欢 Begin-->
    <!-- <div class="i_t mar_10">
    	<span class="fl">猜你喜欢</span>
    </div>    
    <div class="like">        	
        <div id="featureContainer1">
            <div id="feature1">
                <div id="block1">
                    <div id="botton-scroll1">
                        <ul class="featureUL">
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="front/images/hot1.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>德国进口</h2>
                                        德亚全脂纯牛奶200ml*48盒
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>189</span></font> &nbsp; 26R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="front/images/hot2.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>iphone 6S</h2>
                                        Apple/苹果 iPhone 6s Plus公开版
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>5288</span></font> &nbsp; 25R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="front/images/hot3.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>倩碧特惠组合套装</h2>
                                        倩碧补水组合套装8折促销
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>368</span></font> &nbsp; 18R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="front/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="front/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <a class="l_prev" href="javascript:void();">Previous</a>
                <a class="l_next" href="javascript:void();">Next</a>
            </div>
        </div>
    </div> -->
    <!--End 猜你喜欢 End-->
    
    <!--Begin Footer Begin -->
     <div class="b_btm_bg b_btm_c">
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
   	<jsp:include page="/front/foot.jsp"/>
    </div>
    <!--End Footer End -->    
</div>
<script type="text/javascript">

		$(document).ready(function(){
			
			 var userid=$("#loginuser").val();
			 
			 if($("#falg").val()>0){
			 	return;
			 }
			
			 var tro = $("#tro").val();
	         if(userid>0){
	        	 if(tro!=null){
	        		 window.location.href="${pageContext.request.contextPath }/trolley/findByUser.action";
	        	 }else{
	        		 return;
	        	 }
	                   
	         }
			
		}); 
		
</script>
<script type="text/javascript" src="front/js/logout.js"></script>
	 
  </body>
  <a id="ibangkf" href="http://www.ibangkf.com">网站客服</a>
  <script type="text/javascript" src="http://c.ibangkf.com/i/c-zhouxing.js"></script>
</html>
