<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>尤洪</title>        
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	
  	<!-- <link rel="stylesheet" href="front/css/pager.css"/> -->
	<link type="text/css" rel="stylesheet" href="front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="front/css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="front/css/MagicZoom.css" />
    
    
    <script type="text/javascript" src="front/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="front/js/jquery.bxslider_e88acd1b.js"></script>   
    <script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>    
    <!-- <script src="resource/js/jquery.min.js?v=2.1.4"></script> -->
    <script type="text/javascript" src="front/js/menu.js"></script>                
	<script type="text/javascript" src="front/js/lrscroll_1.js"></script>            
	<script type="text/javascript" src="front/js/n_nav.js"></script>        
    <script type="text/javascript" src="front/js/MagicZoom.js"></script>    
    <script type="text/javascript" src="front/js/num.js">
    	var jq = jQuery.noConflict();
    </script>        
    <script type="text/javascript" src="front/js/p_tab.js"></script>    
    <script type="text/javascript" src="front/js/shade.js"></script>    
	<script src="front/js/pager.js">  </script>	
    

</head>
<body>  
<jsp:include page="/front/head.jsp" flush="true"/>
<div class="i_bg">
	<div class="postion">
    	
    </div>    
    <div class="content">    	                    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="${pageContext.request.contextPath}${productImages[0].url }" title="Images" class="MagicZoom" id="MagicZoom">
            	<img src="${pageContext.request.contextPath}${productImages[0].url }" width="390" height="390" /></a>
            </div>
            <div id="tsPicContainer">
                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                <div id="tsImgSCon">
                    <ul>
                    	<c:forEach items="${productImages }" var="image">
                    		<li onclick="showPic(${image.picid })" rel="MagicZoom">
                    		<img src="${pageContext.request.contextPath}${image.url }" 
                    			tsImgS="${pageContext.request.contextPath}${image.url }" width="79" height="79" />
                    		</li>
                    	</c:forEach>                      
                    </ul>
                </div>
                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="front/images/loading.gif" alt="Loading..." />				
        </div>
        
        <div class="pro_des">
        	<div class="des_name">
            	<p style="font-size:25px">${xhproduct.pname }</p>
                	限时折扣，欲购从速！
            </div>
            <div class="des_price" style="font-size:15px">
            	本店价格：<b>¥${xhproduct.psale }</b><br />
              	市场价：<del>¥${xhproduct.pprice }</del>
            </div>
            <div class="des_choice" style="font-size:13px">
            	<span class="fl">型号：</span>
            	<span>${xhproduct.psize }(${xhproduct.punit })</span>                
            </div>
            <!-- <div class="des_choice">
            	<span class="fl">颜色选择：</span>
                <ul>
                	<li>红色<div class="ch_img"></div></li>
                    <li class="checked">白色<div class="ch_img"></div></li>
                    <li>黑色<div class="ch_img"></div></li>
                </ul>
            </div> -->
            <div class="des_share">
            	<div class="d_sh">
                	分享
                    <div class="d_sh_bg">
                    	<a href="#"><img src="front/images/sh_1.gif" /></a>
                        <a href="#"><img src="front/images/sh_2.gif" /></a>
                        <a href="#"><img src="front/images/sh_3.gif" /></a>
                        <a href="#"><img src="front/images/sh_4.gif" /></a>
                        <a href="#"><img src="front/images/sh_5.gif" /></a>
                    </div>
                </div>
                <div class="d_care"><a onclick="ShowDiv('MyDiv','fade')">关注商品</a></div>
            </div>
            <div class="des_join">
            	<div class="j_nums">
                	<input type="text" value="1" name="" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />   
                </div>
                <span class="fl"><a onclick="ShowDiv_1('MyDiv1','fade1')"><img src="front/images/j_car.png" /></a></span>
            </div>            
        </div>    
        
        <div class="s_brand">
        	<div class="s_brand_img"><img src="front/images/sbrand.jpg" width="188" height="132" /></div>
            <div class="s_brand_c"><a href="#">进入品牌专区</a></div>
        </div>    
        
        
    </div>
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="fav_t">用户还喜欢</div>
        	<ul>
            	<li>
                    <div class="img"><a href="#"><img src="front/images/his_1.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_2.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_3.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_4.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_5.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
        	</ul>
        </div>
        <div class="l_list">        	
            <div class="des_border">
            	<div class="des_tit">
                	<ul>
                    	<li class="current">推荐搭配</li>
                    </ul>
                </div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="front/images/mat_1.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">倩碧补水组合套装8折促销</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="front/images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="front/images/mat_2.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="front/images/jia_b.gif" /></div>
                <div class="team_list">
                	<div class="img"><a href="#"><img src="front/images/mat_3.jpg" width="160" height="140" /></a></div>
                	<div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                    	<div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                    	<font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="front/images/equl.gif" /></div>
                <div class="team_sum">
                	套餐价：￥<span>1517</span><br />
                    <input type="text" value="1" class="sum_ipt" /><br />
                    <a href="#"><img src="front/images/z_buy.gif" /></a> 
                </div>
                
            </div>
            <div class="des_border">
                <div class="des_t">商品属性</div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">                                           	                                          
                      <tr>
                      	<td>商品编号：${xhproduct.pid }</td>
                        <td>品牌： ${xhproduct.brand.brandname }</td>
                        <td>上架时间：<fmt:formatDate value="${xhproduct.paddtime }" pattern="yyyy-MM-dd"/> </td>
                        <td>商品大小：${xhproduct.psize }(${xhproduct.punit })</td>                        
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
            
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                	<table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="265"><img src="${pageContext.request.contextPath}${productImages[0].url }" width="390" height="390" /></td>
                        <td>
                        	<b>${xhproduct.pname }</b><br />
                            	【商品规格】：${xhproduct.psize }(${xhproduct.punit })<br />
                            	【品牌】： ${xhproduct.brand.brandname }  <br />                          	
                            	【商品日期】：<fmt:formatDate value="${xhproduct.paddtime }" pattern="yyyy-MM-dd"/><br />                            	                            	
                            	【${xhproduct.pdesc }】<br />
                        </td>
                      </tr>
                    </table>
                    <br />
                    
                    <p align="center">
                    <img src="front/images/de2.jpg" width="746" height="425" /><br /><br />
                    <img src="front/images/de3.jpg" width="750" height="417" /><br /><br />
                    <img src="front/images/de4.jpg" width="750" height="409" /><br /><br />
                    <img src="front/images/de5.jpg" width="750" height="409" />
					</p>
                    
                </div>
          	</div>  
            
            <div class="des_border" id="p_comment">
            	<div class="des_t">商品评论</div>
                
                <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="175" class="jud_per">
                    	<p>80.0%</p>好评度
                    </td>
                    <td width="300">
                    	<table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="90">好评<font color="#999999">（80%）</font></td>
                            <td><img src="front/images/pl.gif" align="absmiddle" /></td>
                          </tr>
                          <tr>
                            <td>中评<font color="#999999">（20%）</font></td>
                            <td><img src="front/images/pl.gif" align="absmiddle" /></td>
                          </tr>
                          <tr>
                            <td>差评<font color="#999999">（0%）</font></td>
                            <td><img src="front/images/pl.gif" align="absmiddle" /></td>
                          </tr>
                        </table>
                    </td>
                    <td width="185" class="jud_bg">
                    	购买过雅诗兰黛第六代特润精华露50ml的顾客，在收到商品才可以对该商品发表评论
                    </td>
                    <td class="jud_bg">您可对已购买商品进行评价<br /><a href="#"><img src="front/images/btn_jud.gif" /></a></td>
                  </tr>
                </table>
                
                
                				
                <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${pageInfo.list}" var="comm">
                  <tr valign="top">
                    <td width="30">
                    <img src="front/images/peo1.png" width="20" height="20" align="absmiddle" />
                    <font size="2" color="black" >${comm.users.username }</font><br /><br />                   
                    </td>                    
                    <td width="80">  
                    	商品：<font color="#999999">${comm.product.pname }</font><br />                 	                    	
                      	 型号：<font color="#999999">${comm.product.psize }</font>                     	                      	 
                    </td>
                    <td width="40" align=center>  
                    	服务等级：${comm.commentservice }<br />
                		商品等级：${comm.commentgoods}<br />
                		物流等级：${comm.commentshopping }<br />                     	                      	 
                    </td>  
                    <td width="190">                   	                    	                      	
                      	<font size="4" color="black">${comm.commenttxt }</font> <br />                      	
                       	<font color="#999999"><fmt:formatDate value="${comm.commenttime }" pattern="yyyy-MM-dd HH:mm:ss"/></font>
                    </td>                  
                  </tr>                  
                </c:forEach>                  
                </table> 
                <div class="pages">   
                <c:if test="${pageInfo.hasPreviousPage==true }">                  
                   <a class="p_pre" href="ProductDetails/queryImagesByPid.action?pageNum=${pageInfo.pageNum-1}&pid=${xhproduct.pid}">上一页</a>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage==false }">
                	<a class="p_pre" href="ProductDetails/queryImagesByPid.action?pageNum=${pageInfo.pageNum}&pid=${xhproduct.pid}">上一页</a>
                </c:if> 
                <c:forEach items="${pageInfo.navigatepageNums }" var="n">
                	<a href="ProductDetails/queryImagesByPid.action?pageNum=${n}&pid=${xhproduct.pid}">${n}</a>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage==true }">                  
                   <a class="p_pre" href="ProductDetails/queryImagesByPid.action?pageNum=${pageInfo.pageNum+1}&pid=${xhproduct.pid}">下一页</a>
                </c:if>
                <c:if test="${pageInfo.hasNextPage==false }">                  
                   <a class="p_pre" href="ProductDetails/queryImagesByPid.action?pageNum=${pageInfo.pageNum}&pid=${xhproduct.pid}">下一页</a>
                </c:if> 
                </div>                              
          	</div>                        
        </div>
    </div>
    
    
    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="front/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="front/images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                    	<a href="#">查看我的关注 >></a>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="#" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    
    
    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="front/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="front/images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">宝贝已成功添加到购物车</span><br />                    	
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="#" class="b_sure">去购物车结算</a><a href="#" class="b_buy">继续购物</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-加入购物车 End-->
    
    
    
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

<script>
	Page({
		num:7,					//页码数
		startnum:6,				//指定页码
		elem:$('#page2'),		//指定的元素
		callback:function(n){	//回调函数
			console.log(n);
		}
	});
</script>

</body>

<script src="front/js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
