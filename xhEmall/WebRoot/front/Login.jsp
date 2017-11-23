<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">

<title>登录</title>

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
			<span class="fr">
				<span class="fl">
					<c:if test="${current_user == null }">
					你好，请
					<a href="front/Login.jsp">登录</a>
					&nbsp;|
					<a href="front/Regist.jsp" style="color:#ff4e00;">免费注册</a>
					</c:if>
					&nbsp;|
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
	<!--End Header End-->
	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<a href="home/home.action">
					<img src="front/images/logo.png" />
				</a>
			</div>
			<div class="gw" >
				<img src="front/images/gw.gif" width="350" height="100" />
			</div>
		</div>
		<div class="login">
			 <div class="log_img">
				<img src="front/images/login1.png" width="355" height="370" />
			</div> 
			<div class="log_c">
				<table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0"
					cellpadding="0">
					<tr height="50" valign="top">
						<td width="55">&nbsp;</td>
						<td>
							<span class="fl" style="font-size:24px;">登录</span>
							<span class="fr">
								还没有商城账号，
								<a href="front/Regist.jsp" style="color:#ff4e00;">立即注册</a>
							</span>
						</td>
					</tr>
					<tr height="70">
						<td>帐号</td>
						<td>
							<input type="text" value="" class="l_user" id="userphone" placeholder="手机号" />
						</td>
					</tr>
					<tr height="70">
						<td>密&nbsp; &nbsp; 码</td>
						<td>
							<input type="password" value="" class="l_pwd" id="password" placeholder="用户密码" />
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="font-size:12px; padding-top:20px;">
							<span style="font-family:'宋体';" class="fl">
								<label class="r_rad">
									<input type="checkbox" />
								</label>
								<label class="r_txt">请保存我这次的登录信息</label>
							</span>
							<span class="fr">
								<a href="front/Forget_Login.jsp" style="color:#ff4e00;">忘记密码</a>
							</span>
						</td>
					</tr>
					<tr height="60">
						<td>&nbsp;</td>
						<td>
							<button class="log_btn" id="login_btn">登录</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!--End Login End-->
	<!--Begin Footer Begin-->
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
	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	<script type="text/javascript" src="front/js/logout.js"></script>
	<script>
		$("#login_btn").click(function() {
			var userphone = $("#userphone").val();
			var userpassword = $("#password").val();
			var ii = layer.load();
			$.ajax({
				url : "user/login.action",
				type : "POST",
				data : {
					"userphone" : userphone,
					"userpassword" : userpassword
				},
				success : function(result) {
					console.log(result);
					if (result.status == 0) {
						layer.close(ii);
						layer.msg(result.msg);
						window.location.href = "home/home.action";
					} else {
						layer.close(ii);
						layer.msg(result.msg);
					}
				}
			});
		});
	</script>

</body>
</html>
