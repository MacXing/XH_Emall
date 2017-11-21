<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<title>head</title>
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
<script type="text/javascript" src="front/js/lrscroll_1.js"></script>
<script type="text/javascript" src="front/js/n_nav.js"></script>
<script type="text/javascript" src="front/js/milk_ban.js"></script>
<script type="text/javascript" src="front/js/paper_ban.js"></script>
<script type="text/javascript" src="front/js/baby_ban.js"></script>
 
 <script type="text/javascript">
    $(function(){
    var car=document.getElementById("#cart");
    var carnum=car.getElementsByTagName("ul").length;
   
         alert(carnum);
     $("#carsize").text(carnum); 
    });
 </script>
</head>  
  <body>
<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<!--Begin 所在收货地区 Begin-->
			
			<!--End 所在收货地区 End-->
			
			<span class="fr">
				<span class="fl">
					<c:if test="${current_user == null }">
					你好，请
					<a href="front/Login.jsp">登录</a>
					&nbsp;
					<a href="Regist.html" style="color:#ff4e00;">免费注册</a>
					</c:if>
					<c:if test="${current_user != null}">
					欢迎您，<a
							href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
					&nbsp;|&nbsp;
					<a class="logout">退出登录</a>
					</c:if>

					&nbsp;|&nbsp;
					<a href="#">我的订单</a>
					&nbsp;|
					<a href="${pageContext.request.contextPath }/trolley/findByUserCart.action">我的购物车</a>
					&nbsp;|
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
				<span class="fl">|&nbsp;关注我们：</span>
				<span class="s_sh">
					<a href="#" class="sh1">新浪</a>
					<a href="#" class="sh2">微信</a>
				</span>
				<span class="fr">
					|&nbsp;
					<a href="home/home.action">
						首页&nbsp;<img src="front/images/home.png" align="absmiddle" />
					</a>
				</span>
			</span>
		</div>
	</div>
	<div class="top">
		<div class="logo">
			<a href="home/home.action">
				<img src="front/images/logo.png" />
			</a>
		</div>
		<div class="search">
			<form action="${pageContext.request.contextPath}/ProductList/queryAllProductByFind.action"
				method="post">
				<input type="text" name="pname" value="" id="keyword" class="s_ipt" />
				<button type="submit" class="s_btn">搜索</button>
			</form>
		</div>
		
		<div class="i_car">
    	<div class="car_t">购物车 [<span id="carsize">${trolleyItem.size()}</span> ]</div>
        <div class="car_bg">
       		<!--Begin 购物车未登录 Begin-->
       		<c:if test="${current_user == null }">
        	<div class="un_login">还未登录！<a href="Login.html" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
            </c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <c:if test="${current_user != null }">
            <ul class="cars" id="cart">
            <c:forEach items="${trolleyItem}" var="items">
            	<li id="pli">
                	<div class="img"><a href="#"><img src="${pageContext.request.contextPath}${items.xhproduct.pimg}" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">${items.xhproduct.pname}</a></div>
                    <div class="price"><font color="#ff4e00"><span>￥</span>${items.xhproduct.psale}</font><span>X</span>${items.tronum}</div>
                </li>
                </c:forEach>
            </ul>
            <div class="price_a"><a href="${pageContext.request.contextPath}/trolley/findByUserCart.action">去购物车结算</a></div>
           </c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
	
	<!--End Header End-->
	<!--Begin Menu Begin-->
	<div class="menu_bg">
		<div class="menu">
			<!--Begin 商品分类详情 Begin-->
			<div class="nav">
				<div class="nav_t">全部商品分类</div>
				<div class="leftNav none">
					<ul>
						<c:set var="i" value="-1" />
						<c:set var="s" value="0"/>
                		<c:set var="e" value="4"/>
						<c:forEach items="${categoryList }" var="item">
							<c:if test="${item.catid!=1 }">
								<c:if test="${item.catgrade==1 }">
									<li>
										<c:set var="i" value="${i+1 }" />
										<div class="fj">
											<span class="n_img">
												<span></span>
												<!-- <img src="front/images/nav1.png" /> -->
											</span>
											<span class="fl">${item.catname}</span>
										</div>
										<div class="zj" style="top:${-40*i}px;">
											<div class="zj_l">
												<c:set var="a" value="0"/>
                             <c:set var="b" value="5"/>
                             <c:forEach begin="0" end="2">
                                <div class="zj_l_c">
	                                <c:forEach items="${categoryList }" var="item2">                                 
			                                    <c:if test="${item2.parentid==item.catid&&item2.catgrade==2 }">
			                                    	<a href="${pageContext.request.contextPath}/home/queryproductsByCategory.action?catid=${item2.catid}">${item2.catname }</a>
			                                    </c:if>
			                                </c:forEach>
			                                <hr>                                                                                 
		                                </div>
		                                <c:set var="a" value="${b }"/>
		                                <c:set var="b" value="${b+11 }"/>  
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
				<li>
					<a href="${ pageContext.request.contextPath}/home/home.action">首页</a>
				</li>
				<c:forEach items="${CP }" var="item">
					<li>
						<a
							href="${ pageContext.request.contextPath}/home/queryAllProductsByCatid.action?catid=${item.catid}">${item.catname }</a>
					</li>
				</c:forEach>
			</ul>
			<div class="m_ad">双十二·送好礼</div>
		</div>
	</div>
	<!--End Menu End-->
	<script type="text/javascript" src="front/js/logout.js"></script>
	
</body>
</html>
