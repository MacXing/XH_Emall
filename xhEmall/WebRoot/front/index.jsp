<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	
</head>
  
<body>
<jsp:include page="/front/head.jsp" flush="true"/>

<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul id="category">
                <c:set var="i" value="-1"/>
                <c:forEach items="${categoryList }" var="item" varStatus="j">   
                     <c:if test="${item.catid!=1 }">
                     	<c:if test="${item.catgrade==1 }">
                     	<c:set var="i" value="${i+1 }"></c:set>	
                     	<li>
                    	<div class="fj">
                        	<span class="n_img"><span></span><img src="front/images/nav1.png" /></span>
                            <span class="fl">${item.catname}</span> 
                        </div>
                        <div class="zj" style="top:${-i*40}px;" test="${i}">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <c:forEach items="${categoryList }" var="item2">
                                    	<c:if test="${item2.parentid==item.catid&&item2.catgrade==2 }">
                                    		<a href="${pageContext.request.contextPath}/home/queryproductsByCategory.action?catid=${item2.catid}">${item2.catname }</a>| 
                                    	</c:if>
                                    </c:forEach>                         
                                </div>   
                            </div>
                           <div class="zj_r">
                                <a href="#"><img src="front/images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="front/images/n_img2.jpg" width="236" height="200" /></a>
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
    		<li><a href="Index.html">首页</a></li>
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
		<!--Begin Banner Begin-->
    	<div class="banner">    	
            <div class="top_slide_wrap">
                <ul class="slide_box bxslider">
                <c:forEach items="${navbars }" var="item">
                    <li><img src="${pageContext.request.contextPath}${item.url }" width="740" height="401" /></li>                   
                </c:forEach>	
                </ul>	
                <div class="op_btns clearfix">
                    <a href="#" class="op_btn op_prev"><span></span></a>
                    <a href="#" class="op_btn op_next"><span></span></a>
                </div>        
            </div>
        </div>
       <script type="text/javascript">
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:jq(".top_slide_wrap .op_prev")[0],nextSelector:jq(".top_slide_wrap .op_next")[0]
            });
        })();
        </script>
        <!--End Banner End-->
        <div class="inews">
        	<div class="news_t">
            	<span class="fr"><a href="#">更多 ></a></span>新闻资讯
            </div>
            <ul>
            	<li><span>[ 特惠 ]</span><a href="#">掬一轮明月 表无尽惦念</a></li>
            	<li><span>[ 公告 ]</span><a href="#">好奇金装成长裤新品上市</a></li>
            	<li><span>[ 特惠 ]</span><a href="#">大牌闪购 · 抢！</a></li>
            	<li><span>[ 公告 ]</span><a href="#">发福利 买车就抢千元油卡</a></li>
            	<li><span>[ 公告 ]</span><a href="#">家电低至五折</a></li>
            </ul>
            <div class="charge_t">
            	话费充值<div class="ch_t_icon"></div>
            </div>
            <form>
            <table border="0" style="width:205px; margin-top:10px;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td width="33">号码</td>
                <td><input type="text" value="" class="c_ipt" /></td>
              </tr>
              <tr height="35">
                <td>面值</td>
                <td>
                	<select class="jj" name="city">
                      <option value="0" selected="selected">100元</option>
                      <option value="1">50元</option>
                      <option value="2">30元</option>
                      <option value="3">20元</option>
                      <option value="4">10元</option>
                    </select>
                    <span style="color:#ff4e00; font-size:14px;">￥99.5</span>
                </td>
              </tr>
              <tr height="35">
                <td colspan="2"><input type="submit" value="立即充值" class="c_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
    <!--Begin 热门商品 Begin-->
    <div class="content mar_10">
    	<div class="h_l_img">
        	<div class="img"><img src="front/images/l_img.jpg" width="188" height="188" /></div>
            <div class="pri_bg">
                <span class="price fl">￥53.00</span>
                <span class="fr">16R</span>
            </div>
        </div>
        <div class="hot_pro">        	
        	<div id="featureContainer">
                <div id="feature">
                    <div id="block">
                        <div id="botton-scroll">
                            <ul class="featureUL">
                                <li class="featureBox">
                                    <div class="box">
                                    	<div class="h_icon"><img src="front/images/hot.png" width="50" height="50" /></div>
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
                                        <div class="h_icon"><img src="front/images/hot.png" width="50" height="50" /></div>
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
                                        <div class="h_icon"><img src="front/images/hot.png" width="50" height="50" /></div>
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
                                        <div class="h_icon"><img src="front/images/hot.png" width="50" height="50" /></div>
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
                    <a class="h_prev" href="javascript:void();">Previous</a>
                    <a class="h_next" href="javascript:void();">Next</a>
                </div>
            </div>
        </div>
    </div>  
	    <div class="content mar_20">
	    <c:forEach items="${brands }" var="item" begin="0" end="21">
	    	<a href="${pageContext.request.contextPath}/home/queryProductsByBrand.action?brandid=${item.brandid}"><img src="${pageContext.request.contextPath}${item.image }" width="100" height="70" /></a>
	    </c:forEach>
	    </div>
    <!--Begin 食品饮料 Begin-->
    
    <c:forEach items="${CP }" var="item" varStatus="i">
    <div class="i_t mar_10">
    	<span class="floor_num">${i.index+1}F</span>
    	<span class="fl">${item.catname }</span>                              
    </div>
    <div class="content">
    	<div class="food_left">
        	<div class="food_ban">
            	<div id="imgPlay2">
                    <ul class="imgs" id="actor2">
                        <li><a href="#"><img src="front/images/food_r.jpg" width="211" height="286" /></a></li>
                        <li><a href="#"><img src="front/images/food_r.jpg" width="211" height="286" /></a></li>
                        <li><a href="#"><img src="front/images/food_r.jpg" width="211" height="286" /></a></li>
                    </ul>
                    <div class="prev_f">上一张</div>
                    <div class="next_f">下一张</div> 
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
        		<c:forEach items="${item.categorys[0].products}" var="item3" begin="0" end="5">
            	<li>
                	<div class="name"><a href="${pageContext.request.contextPath }/ProductDetails/queryImagesByPid.action?pid=${item3.pid }">${item3.pname }</a></div>
                    <div class="price">
                    	<font>￥<span>${item3.psale }</span></font> &nbsp;
                    </div>
                    <div class="img"><a href="${pageContext.request.contextPath }/ProductDetails/queryImagesByPid.action?pid=${item3.pid }"><img src="${pageContext.request.contextPath }${item3.pimg}" width="185" height="155" /></a></div>
                </li>               
                </c:forEach>  
            </ul>
        </div>
        <div class="fresh_right">
        	<ul>
            	<li><a href="#"><img src="front/images/food_b1.jpg" width="260" height="220" /></a></li>
                <li><a href="#"><img src="front/images/food_b2.jpg" width="260" height="220" /></a></li>
            </ul>
        </div>
    </div>
    </c:forEach>    
    <!--End 食品饮料 End-->
   
    <div class="content mar_20">
    	<img src="front/images/mban_1.jpg" width="1200" height="110" />
    </div>
    
   
   
    <!--Begin 猜你喜欢 Begin-->
    <div class="i_t mar_10">
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
    </div>
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
		$(document).ready(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/home/home.action",
				type:"GET",
				success:function(result){
					if(result.code==100){
						console.log(result);
						$.each(result.extend.navbars,function(index,item){
							var ban ="<li><img src='"+"${pageContext.request.contextPath}"+item.url+"'width=\"740\"height= \"401\" /></li>";
							$("#banner").append(ban);
						});
					}
				}
			});
			
			/* $.ajax({
				url:"${pageContext.request.contextPath}/category/queryAllCategoryForJson.action",
				type:"GET",
				success:function(result){
					if(result.code==100){
						console.log(result);
						
						$.each(result.extend.categoryList,function(index,item){
							if(item.catid!=1){
								if(item.catgrade==1){
									var li1 ="<li><div class=\"fj\"><span class=\"n_img\"><span></span></span>";
			                        var li2 ="<span class=\"fl\">"+item.catname+"</span>";
			                        var li3="</div><div class=\"zj\" style=\"display: none;\"><div class=\"zj_l\"><div class=\"zj_l_c\">  ";
			                        var li4="";
			                        $.each(result.extend.categoryList,function(index2,item2){
			                        	if(item2.catgrade==2&&item2.parentid==item.catid){
			                        		 
			                        		 li4=li4+"<a href=\"#\">"+item2.catname+ "</a>| ";
	
										}
			                        });
			                        var li5="</div> </div> <div class=\"zj_r\"> ";
			                        var li6="<a href=\"#\"> <img src=\"front/images/n_img1.jpg\" width=\"236\" height=\"200\" /></a> ";  
			                        var li7="<a href=\"#\"> <img src=\"front/images/n_img2.jpg\" width=\"236\" height=\"200\" /></a> ";
		   							var li8="</div></div></li>  ";
		   							
		   							var cate = li1+li2+li3+li4+li5+li6+li7+li8;
									$("#category").append(cate); 
								}
								      
							}
							
						});					
					}
				}
			});
			*/
		}); 
		
</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
	 
  </body>
</html>
