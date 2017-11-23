<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>收货地址</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />
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
					<a href="front/Regist.jsp" style="color:#ff4e00;">免费注册</a>
					</c:if>
					<c:if test="${current_user != null}">
					欢迎您，<a
							href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
					&nbsp;|&nbsp;
					<a class="logout">退出登录</a>
					&nbsp;|&nbsp;
					</c:if>
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
	<div class="m_top_bg">
		<div class="top">
			<div class="m_logo">
				<a href="home/home.action">
					<img src="front/images/logo1.png" />
				</a>
			</div>
			<div class="m_search">
				<form>
					<input type="text" value="" class="m_ipt" />
					<input type="submit" value="搜索" class="m_btn" />
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
	</div>
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<div class="m_left">
				<div class="left_n">管理中心</div>
				<div class="left_m">
					<div class="left_m_t t_bg1">订单中心</div>
					<ul>
						<li>
							<a
								href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid }">我的订单</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/frontOrder/queryAddressById.action?userid=${current_user.userid }">收货地址</a>
						</li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg2">会员中心</div>
					<ul>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">用户信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForUpdate.action?id=${current_user.userid }">修改信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${current_user.userid }">我的留言</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userComment/queryCommentById.action?id=${current_user.userid }">我的评论</a>
						</li>
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
				<div class="mem_tit">
					<span>收货地址</span>
					<div style="float:right;" id="addAddressbtn">
						<button>添加地址</button>
					</div>
				</div>
				<c:forEach items="${addList }" var="address">
					<div class="address">
						<div>
							<button class="btn_tj deleteAdd" value="${address.addID }">
							删除						
							</button>
						</div>
						<table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;"
							cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="2" style="font-size:14px; color:#ff4e00;">${address.addUserName }</td>
								<input type="hidden" value="${address.addID }" id="addID" />
							</tr>
							<tr>
								<td align="right" width="80">收货人姓名：</td>
								<td>${address.addUserName }</td>
							</tr>
							<tr>
								<td align="right">配送区域：</td>
								<td>${address.addCountry}${address.addProvice }${address.addCity }${address.addDistrict }</td>
							</tr>
							<tr>
								<td align="right">详细地址：</td>
								<td>${address.addAddress }</td>
							</tr>
							<tr>
								<td align="right">联系方式：</td>
								<td>${address.addPhone }</td>
							</tr>
							<tr>
								<td align="right">邮政编码：</td>
								<td>${address.addCode }</td>
							</tr>
						</table>
						<p align="right">
							<c:if test="${address.isDefault == 0 }">
								<button class="isdefault" style="color:#ff4e00;" value="${address.addID }">设为默认</button>
								&nbsp; &nbsp; &nbsp; &nbsp;
							</c:if>
							<c:if test="${address.isDefault == 1 }">
								<button style="color:#ff4e00;">默认地址</button>
								&nbsp; &nbsp; &nbsp; &nbsp;
							</c:if>
							<button style="color:#ff4e00; " value="${address.addID }" class="modifybtn">编辑</button>
							&nbsp; &nbsp; &nbsp; &nbsp;
						</p>
					</div>
				</c:forEach>
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
		<div id="modify" class="hiddendiv">
			<table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">
				<tr>
					<td width="135" align="right">配送地区</td>
					<td colspan="3" style="font-family:'宋体';">
						<select class="jj" name="country" style="background-color:#f6f6f6;">
							<option>中国</option>
						</select>
						<select class="jj" name="province" id="provinceId">
							<option value="0" selected="selected">请选择...</option>
						</select>
						<select class="jj" name="city" id="cityId">
							<option value="0" selected="selected">请选择...</option>
						</select>
						<select class="jj" name="area" id="areaId">
							<option value="0" selected="selected">请选择...</option>
						</select>
						（必填）
					</td>
				</tr>
				<tr>
					<td align="right">收货人姓名</td>
					<td style="font-family:'宋体';">
						<input type="text" class="add_ipt" id="addUserName" />
						（必填）
					</td>
				</tr>
				<tr>
					<td align="right">详细地址</td>
					<td style="font-family:'宋体';">
						<input type="text" class="add_ipt" id="addAddress" />
						（必填）
					</td>
		
				</tr>
				<tr>
					<td align="right">邮政编码</td>
					<td style="font-family:'宋体';">
						<input type="text" class="add_ipt" id="addCode" />
						（必填）
					</td>
				</tr>
				<tr>
					<td align="right">手机</td>
					<td style="font-family:'宋体';">
						<input type="text" class="add_ipt" id="addPhone" />
						（必填）
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript" src="front/js/menu.js"></script>
	<script type="text/javascript" src="front/js/select.js"></script>
	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	<script type="text/javascript" src="front/js/logout.js"></script>

	<script>
		$(".modifybtn")
				.on(
						'click',
						function() {
							var addID = $(this).val();
							var ii = layer.load();
							$
									.ajax({
										url : "frontOrder/queryAddInfoById.action?addID="
												+ addID,
										success : function(result) {
											if (result.status == 0) {
												$("#addUserName")
														.attr(
																"value",
																result.data.addUserName);
												$("#addAddress").attr("value",
														result.data.addAddress);
												$("#addCode").attr("value",
														result.data.addCode);
												$("#addPhone").attr("value",
														result.data.addPhone);
												var userID = result.data.userID;
												layer.close(ii);
												layer
														.open({
															type : 1,
															btn : [ '关闭', '更新' ],
															btn1 : function() {
																layer
																		.closeAll();
															},
															btn2 : function() {
																var oo = layer
																		.load();
																var addUserName = $(
																		"#addUserName")
																		.val();
																var addCode = $(
																		"#addCode")
																		.val();
																var addPhone = $(
																		"#addPhone")
																		.val();
																var addAddress = $(
																		"#addAddress")
																		.val();
																var addDistrict = $(
																		"#areaId")
																		.find(
																				"option:selected")
																		.text();
																var addProvice = $(
																		"#provinceId")
																		.find(
																				"option:selected")
																		.text();
																var addCity = $(
																		"#cityId")
																		.find(
																				"option:selected")
																		.text();

																$
																		.ajax({
																			url : "frontOrder/updateAddressById.action",
																			type : "POST",
																			data : {
																				"addUserName" : addUserName,
																				"addAddress" : addAddress,
																				"addCode" : addCode,
																				"addPhone" : addPhone,
																				"addDistrict" : addDistrict,
																				"addProvice" : addProvice,
																				"addCity" : addCity,
																				"addID" : addID,
																				"userID" : userID
																			},
																			success : function(
																					result) {
																				if (result.status == 0) {
																					layer
																							.closeAll();
																					layer
																							.confirm(
																									result.msg,
																									{
																										btn : [ '确定' ]
																									},
																									function() {
																										self.location
																												.reload();
																									});
																				} else {
																					layer
																							.close(oo);
																					layer
																							.confirm(
																									result.msg,
																									{
																										btn : [ '确定' ]
																									},
																									function() {
																										self.location
																												.reload();
																									});
																				}
																			}
																		});
															},
															area : [ 'auto',
																	'340px' ],
															shadeClose : true, //点击遮罩关闭
															content : $('#modify')
														});
												//self.location.reload();
											} else {
												layer.close(ii);
												layer.msg(result.msg);
											}
										}
									});
						});
		$(".deleteAdd").click(function() {
			var addID = $("#addID").val();
			var ii = layer.load();

			$.ajax({
				url : "frontOrder/deleteAddressById.action?addID=" + addID,
				success : function(result) {
					if (result.status == 0) {
						layer.close(ii);
						self.location.reload();
					} else {
						layer.close(ii);
						layer.msg(result.msg);
					}
				}
			});
		});
		$(".isdefault").click(function() {
			var addID = $(this).val();
			var userID = ${current_user.userid };
			//var userID = $(this).parent().parent().find("input[type='checkbox']").val();
			var ii = layer.load();
			$.ajax({
				url : "frontOrder/updateDefaultById.action",
				type : "POST",
				data : {
					"addID" : addID,
					"userID" : userID
				},
				success : function(result) {
					if (result.status == 0) {
						layer.close(ii);
						layer.confirm(result.msg, {
							btn : [ '确定' ]
						}, function() {
							self.location.reload();
						});
					} else {
						layer.close(ii);
						layer.confirm(result.msg, {
							btn : [ '确定' ]
						}, function() {
							self.location.reload();
						});
					}
				}
			});
		});
		
		$.ajax({
     		type:"GET",
     		url:"${pageContext.request.contextPath}/order/getProvincelist.action",
     		success:function(result){    			
     			$.each(result.extend.provincelist,function(index,item){
     				 //var option=$("<option value='"+item.provinceid+"'></option>").append(item.province);
     				 var option = $("<option></option>").attr("value",item.provinceid).append(item.province);
     				 option.appendTo("#provinceId");     				 
     			});
     			//获取城市 
     			$("#provinceId").change(function(){
     				$.ajax({
         	     		type:"GET",
         	     		url:"${pageContext.request.contextPath}/order/getCityByProvinceId.action?id="+$("#provinceId").val(),    		
         	     		success:function(result){
         	     			$("#cityId > option[value != 0]").remove();
         	     			$("#areaId > option[value != 0]").remove();
         	     			$.each(result.extend.citylist,function(index,item){
         	     				 //var option=$("<option value='"+item.cityid+"'></option>").append(item.city);
         	     				 //$("#cityId > option[value != 0]").remove();
         	     				 var option = $("<option></option>").attr("value",item.cityid).append(item.city);
         	     				 option.appendTo("#cityId");    	     				
         	     			});
         	     			 //获取地区
         	     			 $("#cityId").change(function(){
         	     				$.ajax({
             	     	     		type:"GET",
             	     	     		url:"${pageContext.request.contextPath}/order/getAreaByCityId.action?id="+$("#cityId").val(),    		
             	     	     		success:function(result){
             	     	     			$("#areaId > option[value != 0]").remove();
             	     	     			//$("#areaId > option[value != 0]").remove();
             	     	     			$.each(result.extend.arealist,function(index,item){
             	     	     				 var option=$("<option value='"+item.areaid+"'></option>").append(item.area);
             	     	     				 option.appendTo("#areaId");
             	     	     			});    	     	     		
             	     	     		}
             	     	     	});
         	     			 });	     				
         	     		}
         	     	});
     			});				
     		}
     	});
		
		$("#addAddressbtn").click(
				function() {
					layer.open({
						type : 1,
						btn : [ '关闭', '添加' ],
						btn1 : function() {
							layer.closeAll();
						},
						btn2 : function() {
							var a = layer.load();
							var addUserName = $("#addUserName").val();
							var addCode = $("#addCode").val();
							var addPhone = $("#addPhone").val();
							var addAddress = $("#addAddress").val();
							var addDistrict = $("#areaId").find(
									"option:selected").text();
							var addProvice = $("#provinceId").find(
									"option:selected").text();
							var addCity = $("#cityId").find("option:selected")
									.text();

							$.ajax({
								url : "frontOrder/addAddress.action",
								type : "POST",
								data : {
									"addUserName" : addUserName,
									"addAddress" : addAddress,
									"addCode" : addCode,
									"addPhone" : addPhone,
									"addDistrict" : addDistrict,
									"addProvice" : addProvice,
									"addCity" : addCity,
									"userID" : ${current_user.userid}
								},
								success : function(result) {
									if (result.status == 0) {
										layer.close(a);
										layer.confirm(result.msg, {
											btn : [ '确定' ]
										}, function() {
											self.location.reload();
										});
									} else {
										layer.close(a);
										layer.confirm(result.msg, {
											btn : [ '确定' ]
										}, function() {
											self.location.reload();
										});
									}
								}
							});
						},
						area : [ 'auto', '340px' ],
						shadeClose : true, //点击遮罩关闭
						content : $('#modify')
					});
				});
		$(function (){
			$(".hiddendiv").hide();
		});
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>

</html>

