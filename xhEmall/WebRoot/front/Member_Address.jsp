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

	<%-- <jsp:include page="/front/head2.jsp" /> --%>

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
		
			<jsp:include page="/front/foot.jsp" />
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

