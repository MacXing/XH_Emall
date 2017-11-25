
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
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?a7dc93e4ba6534c4c3a6a05c33c7d6a8";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
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
						&nbsp;|&nbsp;
						<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid}">我的订单</a>
					</c:if>
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

	<!--End Menu End-->
	<script type="text/javascript" src="front/js/logout.js"></script>
	
</body>
</html>
