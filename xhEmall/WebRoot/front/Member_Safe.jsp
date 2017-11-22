<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>账户安全</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

</head>
<body>
	<!--Begin Header Begin-->
	<jsp:include page="/front/head2.jsp" />
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
							<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid }">我的订单</a>
						</li>
						<li>
							<a href="Member_Address.html">收货地址</a>
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
							<a href="Member_Safe.html" class="now">账户安全</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="m_right">
				<p></p>
				<div class="mem_tit">账户安全</div>
				<div class="m_des">
					<table border="0" style="width:880px;" cellspacing="0" cellpadding="0">
						<tr height="45">
							<td width="80" align="right">原手机 &nbsp; &nbsp;</td>
							<td>
								<input type="text" value="" class="add_ipt" style="width:180px;" id="phoneold"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="45">
							<td align="right">新手机 &nbsp; &nbsp;</td>
							<td>
								<input type="text" value="" class="add_ipt" style="width:180px;" id="phonenew"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="50">
							<td>&nbsp;</td>
							<td>
								<input type="submit" value="确认修改" class="btn_tj" id="phonemodify"/>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="m_des">
					<table border="0" style="width:880px;" cellspacing="0" cellpadding="0">
						<tr height="45">
							<td width="80" align="right">原密码 &nbsp; &nbsp;</td>
							<td>
								<input type="password" value="" class="add_ipt" style="width:180px;" id="pwdold"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="45">
							<td align="right">新密码 &nbsp; &nbsp;</td>
							<td>
								<input type="password" value="" class="add_ipt" style="width:180px;" id="pwdnew"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="50">
							<td>&nbsp;</td>
							<td>
								<input type="submit" value="确认修改" class="btn_tj" id="pwdmodify"/>
							</td>
						</tr>
					</table>
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

	<script>
		$("#pwdmodify").click(function (){
			var pwdold = $("#pwdold").val();
			var pwdnew = $("#pwdnew").val();
			var ii = layer.load();
			$.ajax({
				url : "user/restPassword.action",
				data : {
					"passwordNew" : pwdnew,
					"passwordOld" : pwdold
				},
				type : "POST",
				success : function(result){
					console.log(result);
					layer.close(ii);
					layer.msg(result.msg);
				}
			});
		});
		$("#phonemodify").click(function (){
			var phoneold = $("#phoneold").val();
			var phonenew = $("#phonenew").val();
			var ii = layer.load();
			$.ajax({
				url : "user/restPhone.action",
				data : {
					"userphoneNew" : phonenew,
					"userphoneOld" : phoneold
				},
				type : "POST",
				success : function(result){
					console.log(result);
					layer.close(ii);
					layer.msg(result.msg);
				}
			});
		});
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>

</html>

