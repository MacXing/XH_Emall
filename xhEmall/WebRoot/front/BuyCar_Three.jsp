<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'BuyCar_Three.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

<script type="text/javascript" src="front/front/front/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="front/front/js/menu.js"></script>

<script type="text/javascript" src="front/front/js/n_nav.js"></script>

<script type="text/javascript" src="front/front/js/num.js">
	var jq = jQuery.noConflict();
</script>

<script type="text/javascript" src="front/front/js/shade.js"></script>

<title>尤洪</title>
</head>

<body>
	<!--Begin Menu Begin-->
	<jsp:include page="/front/head2.jsp"/>
	<!--End Menu End-->
	<div class="i_bg">
		<div class="content mar_20">
			<img src="front/images/img3.jpg" />
		</div>
		<!--Begin 第三步：提交订单 Begin -->
		<div class="content mar_20">
			<!--Begin 支付宝支付 Begin -->
			<div class="warning">
				<table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
					<tr height="35">
						<td style="font-size:18px;">
							感谢您在本店购物！您的订单已提交成功，请记住您的订单号: <font color="#ff4e00">${orderinfo.orderid }</font>
						</td>
					</tr>
					<tr>
						<td
							style="font-size:14px; font-family:'宋体'; padding:10px 0 20px 0; border-bottom:1px solid #b6b6b6;">
							您选定的配送方式为: <font color="#ff4e00">${orderinfo.shoppingname }</font>； &nbsp; &nbsp;
							您选定的支付方式为: <font color="#ff4e00">${orderinfo.payPrice }</font>；
							&nbsp; &nbsp;您的应付款金额为: <font color="#ff4e00">￥${orderinfo.payfee }</font>
						</td>
					</tr>
					<tr>
						<td style="padding:20px 0 30px 0; font-family:'宋体';">
							支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br /> 支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制。<br />
							<a href="#" style="color:#ff4e00;">立即在线申请</a>
						</td>
					</tr>
					<tr>
						<td>
							<div class="btn_u" style="margin:0 auto; padding:0 20px; width:120px;">
								<a href="${pageContext.request.contextPath}/Pay/viewOrder.action?orderid=${orderinfo.orderid }">立即使用支付宝支付</a>
							</div>
							<a href="#">首页</a>
							&nbsp; &nbsp;
							<a href="#">用户中心</a>
						</td>
					</tr>
				</table>
			</div>
			<!--Begin 支付宝支付 Begin -->

		</div>
		<!--End 第三步：提交订单 End-->


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
		<jsp:include page="/front/foot.jsp"/>
		
		<!--End Footer End -->
</div>
	<script type="text/javascript" src="front/js/logout.js"></script>

</body>
</html>
