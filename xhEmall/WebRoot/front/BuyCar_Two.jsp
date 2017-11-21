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

<title>My JSP 'BuyCar_Two.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link type="text/css" rel="stylesheet" href="front/css/style.css" />
<!--[if IE 6]>
    <script src="front/js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->

<script type="text/javascript" src="resource/js/jquery.min.js"></script>
<script type="text/javascript" src="front/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="front/js/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="front/js/menu.js"></script>

<script type="text/javascript" src="front/js/n_nav.js"></script>

<script type="text/javascript" src="front/js/select.js"></script>

<script type="text/javascript" src="front/js/num.js">
	var jq = jQuery.noConflict();
</script>

<script type="text/javascript" src="front/js/shade.js"></script>

<title>尤洪</title>
</head>

<body>
	<!--Begin Header Begin-->
	<jsp:include page="/front/head.jsp" />
	<!--End Menu End-->
	<div class="i_bg">
		<div class="content mar_20">
			<img src="front/images/img2.jpg" />
		</div>

		<!--Begin 第二步：确认订单信息 Begin -->
		<div class="content mar_20">
			<div class="two_bg">
				<div class="two_t">
					<span class="fr">
						<a href="#">修改</a>
					</span>
					商品列表
				</div>
				<table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="car_th" width="550">商品名称</td>
						<td class="car_th" width="140">属性</td>
						<td class="car_th" width="150">购买数量</td>
						<td class="car_th" width="130">小计</td>
						<td class="car_th" width="140">返还积分</td>
					</tr>
					<c:forEach items="${items}" var="items">
						<tr id="ilist">
							<td>
								<div class="c_s_img">
									<img src="${pageContext.request.contextPath}${items.xhproduct.pimg}" width="73" height="73" />
								</div>
								${items.xhproduct.pname}
							</td>
							<td align="center">
								<span>单位:</span>
								<span>${items.xhproduct.punit}</span>
							</td>
							<td align="center">${items.tronum}</td>
							<td align="center" style="color:#ff4e00;">
								<span>￥</span>${items.subTotal}</td>
							<td align="center">${items.xhproduct.psale}<span>R</span>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
							商品总价：
							<span style="color:#ff4e00;">￥</span>
							<span style="color:#ff4e00;">${total}</span>
							；返还积分
							<span style="color:#ff4e00;" id="itotal">${total}</span>
							<span style="color:#ff4e00;">R</span>
						</td>
					</tr>
				</table>

				<div class="two_t">
					<span class="fr">
						<a href="${pageContext.request.contextPath }/frontOrder/queryAddressById.action?userid=${current_user.userid }">修改</a>
					</span>
					收货人信息
				</div>
				<table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="p_td">收货人姓名：</td>
						<td id="addusername">${ua.addUserName }</td>
						<td class="p_td">联系方式：</td>
						<td id="addphone">${ua.addPhone }</td>
					</tr>
					<tr>
						<td class="p_td">配送区域：</td>
						<td>
							<span id="addcountry">${ua.addCountry}</span><span id="addprovince">${ua.addProvice }</span>
							<span id="addcity">${ua.addCity }</span><span id="adddistrict">${ua.addDistrict }</span>
						</td>
						<td class="p_td">邮政编码：</td>
						<td id="addcode">${ua.addCode }</td>
					</tr>
					<tr>
						<td class="p_td">详细地址：</td>
						<td id="addaddress">${ua.addAddress }</td>
					</tr>
				</table>
							
				<div class="two_t">配送方式</div>
				<table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="car_th" width="80"></td>
						<td class="car_th" width="200">名称</td>
						<td class="car_th" width="370">订购描述</td>
						<td class="car_th" width="150">费用</td>
					</tr>
					<c:forEach items="${expresslist}" var="express">
						<tr>
							<td align="center">
								<input type="hidden" value="${express.shoppingid}" id="shoppingid"/>
								<input type="radio" name="ch" checked="checked" value="${express.shoppingid}"/>
							</td>
							<td align="center" style="font-size:14px;">
								<b>${express.shoppingname}</b>
							</td>
							<td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
							<td align="center">￥15.00</td>
						</tr>
						<tr>
							<td colspan="6">
								<!-- <span class="fr"><label class="r_rad"><input type="checkbox" name="baojia" /></label><label class="r_txt">配送是否需要保价</label></span> -->
							</td>
						</tr>
					</c:forEach>
				</table>

				<div class="two_t">支付方式</div>
				<ul class="pay radio">
					<li class="checked">
						支付宝
						<div class="ch_img"></div>
					</li>
					<li>
						微信
						<div class="ch_img"></div>
					</li>
				</ul>
				<table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right">
							该订单完成后，您将获得 <font color="#ff4e00">${total}</font> 积分 <br /> 商品总价: <font color="#ff4e00"
								id="totalfee" value="${total}"><span>￥</span>${total}</font> + 配送费用: <font color="#ff4e00"
								id="exfee" test=""><span>￥</span>15.00</font>
						</td>
					</tr>
					<tr height="70">
						<td align="right">
							<b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">${total}￥</span>
								<span style="font-size:22px; color:#ff4e00;" id="paytotal"></span></b>
						</td>
					</tr>
					<tr height="70">
						<td align="right">
							<button id="suborder">
								确认订单
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!--End 第二步：确认订单信息 End-->


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
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var totalfee = $("#totalfee").attr("value");
			var paytotal = Number(totalfee) + Number(15);
			$("#paytotal").text(paytotal);

		});
		 $("#suborder").click(function (){
			var shoppingid = $("input[type=radio][name=ch]:checked").val();
			var addusername = $("#addusername").html();
			var addphone = $("#addphone").html();
			var addcountry = $("#addcountry").html();
			var addprovince = $("#addprovince").html();
			var addcity = $("#addcity").html();
			var adddistrict = $("#adddistrict").html();
			var addcode = $("#addcode").html();
			var addaddress = $("#addaddress").html();
			$.ajax({
				url: "frontOrder/addOrder.action",
				type: "POST",
				//contentType:"application/json", 
				data: {
					"spids": shoppingid,
					"userID" : ${current_user.userid},
					"addUserName": addusername,
					"addPhone": addphone,
					"addCountry": addcountry,
					"addProvice": addprovince,
					"addCity": addcity,
					"addDistrict": adddistrict,
					"addCode": addcode,
					"addAddress": addaddress,
					"id": "${id}"
				},
				success: function(result){
					window.location.href = "front/BuyCar_Three.jsp";					
				}
			});
		});
	</script>
</body>
</html>
