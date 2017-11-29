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
	<jsp:include page="/front/foot.jsp"/>
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
						/* window.location.reload(); */
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
