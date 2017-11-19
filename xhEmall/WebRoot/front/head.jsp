<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
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
					<li>
						<div class="img">
							<a href="#">
								<img src="front/images/car1.jpg" width="58" height="58" />
							</a>
						</div>
						<div class="name">
							<a href="#">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥399</font> X1
						</div>
					</li>
					<li>
						<div class="img">
							<a href="#">
								<img src="front/images/car2.jpg" width="58" height="58" />
							</a>
						</div>
						<div class="name">
							<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥399</font> X1
						</div>
					</li>
					<li>
						<div class="img">
							<a href="#">
								<img src="front/images/car2.jpg" width="58" height="58" />
							</a>
						</div>
						<div class="name">
							<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
						</div>
						<div class="price">
							<font color="#ff4e00">￥399</font> X1
						</div>
					</li>
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
						<c:set var="i" value="-1" />
						<c:forEach items="${categoryList }" var="item">
							<c:if test="${item.catid!=1 }">
								<c:if test="${item.catgrade==1 }">
									<li>
										<c:set var="i" value="${i+1 }" />
										<div class="fj">
											<span class="n_img">
												<span></span>
												<img src="front/images/nav1.png" />
											</span>
											<span class="fl">${item.catname}</span>
										</div>
										<div class="zj" style="top:${-40*i}px;">
											<div class="zj_l">
												<div class="zj_l_c">
													<c:forEach items="${categoryList }" var="item2">
														<c:if test="${item2.parentid==item.catid&&item2.catgrade==2 }">
															<a
																href="${pageContext.request.contextPath}/home/queryproductsByCategory.action?catid=${item2.catid}">${item2.catname }</a>| 
                                    	</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="zj_r">
												<a href="#">
													<img src="front/images/n_img1.jpg" width="100" height="50" />
												</a>
												<a href="#">
													<img src="front/images/n_img2.jpg" width="100" height="50" />
												</a>
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
