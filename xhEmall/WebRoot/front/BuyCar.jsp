<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>我的购物车</title>

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
	$(function() {
		initCheckBox();
		showTotal();
	});
</script>
</head>

<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<!--Begin 所在收货地区 Begin-->
			<span class="s_city_b">
				<span class="fl">送货至：</span>
				<span class="s_city">
					<span>四川</span>
					<div class="s_city_bg">
						<div class="s_city_t"></div>
						<div class="s_city_c">
							<h2>请选择所在的收货地区</h2>
							<table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0"
								cellpadding="0">
								<tr>
									<th>A</th>
									<td class="c_h">
										<span>安徽</span>
										<span>澳门</span>
									</td>
								</tr>
								<tr>
									<th>B</th>
									<td class="c_h">
										<span>北京</span>
									</td>
								</tr>
								<tr>
									<th>C</th>
									<td class="c_h">
										<span>重庆</span>
									</td>
								</tr>
								<tr>
									<th>F</th>
									<td class="c_h">
										<span>福建</span>
									</td>
								</tr>
								<tr>
									<th>G</th>
									<td class="c_h">
										<span>广东</span>
										<span>广西</span>
										<span>贵州</span>
										<span>甘肃</span>
									</td>
								</tr>
								<tr>
									<th>H</th>
									<td class="c_h">
										<span>河北</span>
										<span>河南</span>
										<span>黑龙江</span>
										<span>海南</span>
										<span>湖北</span>
										<span>湖南</span>
									</td>
								</tr>
								<tr>
									<th>J</th>
									<td class="c_h">
										<span>江苏</span>
										<span>吉林</span>
										<span>江西</span>
									</td>
								</tr>
								<tr>
									<th>L</th>
									<td class="c_h">
										<span>辽宁</span>
									</td>
								</tr>
								<tr>
									<th>N</th>
									<td class="c_h">
										<span>内蒙古</span>
										<span>宁夏</span>
									</td>
								</tr>
								<tr>
									<th>Q</th>
									<td class="c_h">
										<span>青海</span>
									</td>
								</tr>
								<tr>
									<th>S</th>
									<td class="c_h">
										<span>上海</span>
										<span>山东</span>
										<span>山西</span>
										<span class="c_check">四川</span>
										<span>陕西</span>
									</td>
								</tr>
								<tr>
									<th>T</th>
									<td class="c_h">
										<span>台湾</span>
										<span>天津</span>
									</td>
								</tr>
								<tr>
									<th>X</th>
									<td class="c_h">
										<span>西藏</span>
										<span>香港</span>
										<span>新疆</span>
									</td>
								</tr>
								<tr>
									<th>Y</th>
									<td class="c_h">
										<span>云南</span>
									</td>
								</tr>
								<tr>
									<th>Z</th>
									<td class="c_h">
										<span>浙江</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</span>
			</span>
			<!--End 所在收货地区 End-->
			<script type="text/javascript" src="front/js/logout.js"></script>
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
					<a href="${pageContext.request.contextPath }/trolley/findByUser.action">我的购物车</a>
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
									<li>
										<a href="#">客户服务</a>
									</li>
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
									<li>
										<a href="#">网站导航</a>
									</li>
									<li>
										<a href="#">网站导航</a>
									</li>
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
				<span class="fr">|&nbsp;<a href="home/home.action">首页&nbsp;<img src="front/images/home.png" align="absmiddle" /></a></span>
			</span>
		</div>
	</div>
	<div class="top">
		<div class="logo">
			<a href="Index.html">
				<img src="front/images/logo.png" />
			</a>
		</div>
		<div class="search">
			<form>
				<input type="text" value="" class="s_ipt" />
				<input type="submit" value="搜索" class="s_btn" />
			</form>
			<span class="fl">
				<a href="#">咖啡</a>
				<a href="#">iphone 6S</a>
				<a href="#">新鲜美食</a>
				<a href="#">蛋糕</a>
				<a href="#">日用品</a>
				<a href="#">连衣裙</a>
			</span>
		</div>
		<div class="i_car">
			<div class="car_t">
				购物车 [
				<span>3</span>
				]
			</div>
			<div class="car_bg">
				<!--Begin 购物车未登录 Begin-->
				<div class="un_login">
					还未登录！
					<a href="Login.html" style="color:#ff4e00;">马上登录</a>
					查看购物车！
				</div>
				<!--End 购物车未登录 End-->
				<!--Begin 购物车已登录 Begin-->
				<ul class="cars">
					<c:forEach items="${trolleyItem}" var="items">
						<li id="pli">
							<div class="img">
								<a href="#">
									<img src="front/images/car1.jpg" width="58" height="58" />
								</a>
							</div>
							<div class="name">
								<a href="#">${items.xhproduct.pname}</a>
							</div>
							<div class="price">
								<font color="#ff4e00"><span>￥</span>${items.xhproduct.psale}</font>
								<span>X</span>${items.tronum}</div>
						</li>
					</c:forEach>
				</ul>
				<div class="price_sum">
					共计&nbsp; <font color="#ff4e00">￥</font>
					<span>1058</span>
				</div>
				<div class="price_a">
					<a href="#">去购物车结算</a>
				</div>
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
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav1.png" />
								</span>
								<span class="fl">进口食品、生鲜</span>
							</div>
							<div class="zj">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav2.png" />
								</span>
								<span class="fl">食品、饮料、酒</span>
							</div>
							<div class="zj" style="top:-40px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力2</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav3.png" />
								</span>
								<span class="fl">母婴、玩具、童装</span>
							</div>
							<div class="zj" style="top:-80px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力3</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav4.png" />
								</span>
								<span class="fl">家居、家庭清洁、纸品</span>
							</div>
							<div class="zj" style="top:-120px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力4</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav5.png" />
								</span>
								<span class="fl">美妆、个人护理、洗护</span>
							</div>
							<div class="zj" style="top:-160px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力5</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav6.png" />
								</span>
								<span class="fl">女装、内衣、中老年</span>
							</div>
							<div class="zj" style="top:-200px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力6</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav7.png" />
								</span>
								<span class="fl">鞋靴、箱包、腕表配饰</span>
							</div>
							<div class="zj" style="top:-240px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力7</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav8.png" />
								</span>
								<span class="fl">男装、运动</span>
							</div>
							<div class="zj" style="top:-280px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力8</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav9.png" />
								</span>
								<span class="fl">手机、小家电、电脑</span>
							</div>
							<div class="zj" style="top:-320px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力9</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
						<li>
							<div class="fj">
								<span class="n_img">
									<span></span>
									<img src="front/images/nav10.png" />
								</span>
								<span class="fl">礼品、充值</span>
							</div>
							<div class="zj" style="top:-360px;">
								<div class="zj_l">
									<div class="zj_l_c">
										<h2>零食 / 糖果 / 巧克力10</h2>
										<a href="#">坚果</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">巧克力</a>
										|
										<a href="#">口香糖</a>
										|
										<a href="#">海苔</a>
										|
										<a href="#">鱼干</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">蜜饯</a>
										|
										<a href="#">红枣</a>
										|
										<a href="#">牛肉干</a>
										|
										<a href="#">蜜饯</a>
										|
									</div>
								</div>
								<div class="zj_r">
									<a href="#">
										<img src="front/images/n_img1.jpg" width="236" height="200" />
									</a>
									<a href="#">
										<img src="front/images/n_img2.jpg" width="236" height="200" />
									</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!--End 商品分类详情 End-->
			<ul class="menu_r">
				<li>
					<a href="Index.html">首页</a>
				</li>
				<li>
					<a href="Food.html">美食</a>
				</li>
				<li>
					<a href="Fresh.html">生鲜</a>
				</li>
				<li>
					<a href="HomeDecoration.html">家居</a>
				</li>
				<li>
					<a href="SuitDress.html">女装</a>
				</li>
				<li>
					<a href="MakeUp.html">美妆</a>
				</li>
				<li>
					<a href="Digital.html">数码</a>
				</li>
				<li>
					<a href="GroupBuying.html">团购</a>
				</li>
			</ul>
			<div class="m_ad">中秋送好礼！</div>
		</div>
	</div>
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
					<span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')">
						<img src="front/images/close.gif" />
					</span>
				</div>
				<div class="notice_c">

					<table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td>您确定要把该商品移除购物车吗？</td>
						</tr>
						<tr height="50" valign="bottom">
							<td>
								<a onclick="delete_cart()" class="b_sure">确定</a>
								<a <%-- href="${pageContext.request.contextPath }/" --%> class="b_close">取消</a>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
		<!--End 弹出层-删除商品 End-->


		<!--Begin Footer Begin -->
		<div class="b_btm_bg bg_color">
			<div class="b_btm">
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b1.png" width="62" height="62" />
						</td>
						<td>
							<h2>正品保障</h2>
							正品行货 放心购买
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b2.png" width="62" height="62" />
						</td>
						<td>
							<h2>满38包邮</h2>
							满38包邮 免运费
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b3.png" width="62" height="62" />
						</td>
						<td>
							<h2>天天低价</h2>
							天天低价 畅选无忧
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b4.png" width="62" height="62" />
						</td>
						<td>
							<h2>准时送达</h2>
							收货时间由你做主
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="b_nav">
			<dl>
				<dt>
					<a href="#">新手上路</a>
				</dt>
				<dd>
					<a href="#">售后流程</a>
				</dd>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">订购方式</a>
				</dd>
				<dd>
					<a href="#">隐私声明</a>
				</dd>
				<dd>
					<a href="#">推荐分享说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">配送与支付</a>
				</dt>
				<dd>
					<a href="#">货到付款区域</a>
				</dd>
				<dd>
					<a href="#">配送支付查询</a>
				</dd>
				<dd>
					<a href="#">支付方式说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">会员中心</a>
				</dt>
				<dd>
					<a href="#">资金管理</a>
				</dd>
				<dd>
					<a href="#">我的收藏</a>
				</dd>
				<dd>
					<a href="#">我的订单</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">服务保证</a>
				</dt>
				<dd>
					<a href="#">退换货原则</a>
				</dd>
				<dd>
					<a href="#">售后服务保证</a>
				</dd>
				<dd>
					<a href="#">产品质量保证</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">联系我们</a>
				</dt>
				<dd>
					<a href="#">网站故障报告</a>
				</dd>
				<dd>
					<a href="#">购物咨询</a>
				</dd>
				<dd>
					<a href="#">投诉与建议</a>
				</dd>
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
				<div class="b_er_c">
					<img src="front/images/er.gif" width="118" height="118" />
				</div>
				<img src="front/images/ss.png" />
			</div>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018 尤洪商城网 All Rights Reserved.
				复制必究 , Technical Support: Dgg Group <br /> <img src="front/images/b_1.gif" width="98"
					height="33" /><img src="front/images/b_2.gif" width="98" height="33" /><img
					src="front/images/b_3.gif" width="98" height="33" /><img src="front/images/b_4.gif" width="98"
					height="33" /><img src="front/images/b_5.gif" width="98" height="33" /><img
					src="front/images/b_6.gif" width="98" height="33" />
			</div>
		</div>
		<!--End Footer End -->
	</div>
	<script type="text/javascript" src="front/js/logout.js"></script>

	<script type="text/javascript">
		function mul(id, num) {
			if (num < 1) {
				alert("别再减了，亲！");
				return;
			} else {
				var num1 = num - 1;
					$.ajax({
						url : "${pageContext.request.contextPath}/trolley/modifyTrolley.action?id="
								+ id + "&num=" + num1,
						type : "GET",
						success : function(result) {
							showTotal();
							if (result.code == 100) {
								window.location.href = "${pageContext.request.contextPath}/trolley/findByUser.action";
							}
						}
					});
			}
		}

		function add(id, num) {
			var num1 = num + 1;
			$
					.ajax({
						url : "${pageContext.request.contextPath}/trolley/modifyTrolley.action?id="
								+ id + "&num=" + num1,
						type : "GET",
						success : function(result) {
							showTotal();
							if (result.code == 100) {
								window.location.href = "${pageContext.request.contextPath}/trolley/findByUser.action";

							}
						}
					});
		};

		/*删除  */
		function delete_cart() {
			var troid = $("#inputroid").val();
			$
					.ajax({
						url : "${pageContext.request.contextPath}/trolley/deleteTrolleyForFront.action?id="
								+ troid,
						type : "GET",
						success : function(result) {
							alert(result.code);
							if (result.code == 100) {
								window.location.href = "${pageContext.request.contextPath}/trolley/findByUser.action";
							}
						}
					});
		};

		/*结算  */
		function settlement() {
			var ids = Array();
			$("input[type=checkbox][name=checkboxBtn]:checked").each(
					function(index, domEle) {
						ids.push($(domEle).val());
						$("#itemids").val(ids);
						$("#totals").val($("#total").text());
						$("#submitOrder").submit();
					});
		}

		function showTotal() {
			var text;
			var total = 0;
			$("input[type=checkbox][name=checkboxBtn]:checked").each(
					function(index, domEle) {

						var id = $(domEle).val();
						console.log(id);
						text = $("#sub" + id).text();
						console.log(text);
						total += Number(text);
					});
			$("#total").text(total);
		}
		function selectedAll(obj) {
			//应该根据复选框的状态去设置子选框的状态
			$("input[type=checkbox][name=checkboxBtn]").each(
					function(index, ele) {
						//$(ele).attr("checked",$(obj).attr("checked"));
						ele.checked = obj.checked;
					});
			showTotal();
		}

		/* 实现全选 */
		function initCheckBox() {

			$("input[type=checkbox][name=checkboxBtn]")
					.click(
							function() {
								var all = $("input[type=checkbox][name=checkboxBtn]").length;//所有条目的个数
								var selected = $("input[type=checkbox][name=checkboxBtn]:checked").length;
								var selectAll = $("#selectAll");
								if (all == selected) {
									selectAll.prop("checked", true);
								} else if (selected == 0) {
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
