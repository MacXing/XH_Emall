<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

<style type="text/css">
.pages1 {
	overflow: hidden;
	color: #888888;
	padding: 20px 10px;
	text-align: right;
	font-size: 6px;
	font-family: "宋体";
	margin-top: 20px;
}

.pages1 a {
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	color: #666666;
	font-size: 16px;
	text-align: center;
	display: inline-block;
	padding: 0 12px;
	margin: 0 4px;
	border: 1px solid #cccccc;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.pages1 a:hover,.pages1 a.cur {
	color: #FFF;
	background-color: #ff4e00;
	border: 1px solid #ff4e00;
}

.pages1 a.p_pre:hover {
	background-color: #eaeaea;
	color: #555555;
	border: 1px solid #cccccc;
}
</style>

</head>
<body>
	<jsp:include page="/front/head2.jsp" />

	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<div class="m_left">
				<div class="left_n">管理中心</div>
				<div class="left_m">
					<div class="left_m_t t_bg1">订单中心</div>
					<ul>
						<li>
							<a href="Member_Order.html" class="now">我的订单</a>
						</li>
						<li>
							<a href="frontOrder/queryAddressById.action?userid=${current_user.userid }">收货地址</a>
						</li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg2">会员中心</div>
					<ul>          
	                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">用户信息</a></li>
	                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForUpdate.action?id=${current_user.userid }">修改信息</a></li>
	                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${current_user.userid }">我的留言</a></li>
	                    <li><a href="${pageContext.request.contextPath }/userComment/queryCommentById.action?id=${current_user.userid }">我的评论</a></li>
                    	<li><a href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id=${current_user.userid }">我的收藏</a></li>
                    </ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg3">账户中心</div>
					<ul>
						<li>
							<a href="front/Member_Safe.jsp">账户安全</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="m_right">
				<p></p>
				<div class="two_bg">
					<div class="two_t">
						<span class="fr">
							<a href="#">修改</a>
						</span>
						&nbsp;&nbsp;&nbsp;&nbsp;商品列表
					</div>
					<table border="0" class="car_tab" cellspacing="0" cellpadding="0">
						<tr>
							<td class="car_th" width="5%">商品名称</td>
							<td class="car_th" width="5%">属性</td>
							<td class="car_th" width="2%">购买数量</td>
							<td class="car_th" width="2%">小计</td>
							<td class="car_th" width="2%">返还积分</td>
						</tr>
						<c:forEach items="${ogList}" var="items">
							<tr id="ilist">
								<td>
									<div class="c_s_img">
										<img src="${pageContext.request.contextPath}${items.product.pimg}" width="73" height="73" />
									</div>
									${items.product.pname}
								</td>
								<td align="center">
									<span>单位:</span>
									<span>${items.product.punit}</span>
								</td>
								<td align="center">${items.pNum}</td>
								<td align="center" style="color:#ff4e00;">
									<span>${items.pNum*items.product.psale }￥</span>
								</td>
								<td align="center">
									<span>${items.pNum*items.product.psale / 10 }R</span>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="pages1">
					<c:if test="${pageInfo.hasPreviousPage==true }">
						<a
							href="${pageContext.request.contextPath }/frontOrder/queryOrderDetail.action?pageNum=${pageInfo.pageNum-1}&orderid=${orderid }">
							<font style="font-size: 1px">上一页</font>
						</a>
					</c:if>
					<c:if test="${pageInfo.hasPreviousPage==false }">
						<a>
							<font style="font-size: 1px">上一页</font>
						</a>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="n">
						<a
							href="${pageContext.request.contextPath }/frontOrder/queryOrderDetail.action?orderid=${orderid }&pageNum=${n}">
							<font style="font-size: 1px">${n}</font>
						</a>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage==true }">
						<a
							href="${pageContext.request.contextPath }/frontOrder/queryOrderDetail.action?pageNum=${pageInfo.pageNum+1}&orderid=${orderid }">
							<font style="font-size: 1px">下一页</font>
						</a>
					</c:if>
					<c:if test="${pageInfo.hasNextPage==false }">
						<a>
							<font style="font-size: 1px">下一页</font>
						</a>
					</c:if>
				</div>
			</div>
		</div>
		<!--End 用户中心 End-->
		<!--Begin Footer Begin -->
		<div class="b_btm_bg b_btm_c">
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
	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>
</html>


