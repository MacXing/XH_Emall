<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

<title>尤洪</title>
</head>
<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<span class="fr">
				<span class="fl">
					你好，请
					<a href="front/Login.jsp" style="color:#ff4e00;">登录</a>
					&nbsp;
					<a href="front/Regist.jsp">免费注册</a>
					&nbsp;
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
		</div>
		<div class="regist">
			<div class="log_img">
				<img src="front/images/l_img.png" width="611" height="425" />
			</div>
			<div class="reg_c">
				<table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0"
					cellpadding="0">
					<tr height="50" valign="top">
						<td width="95">&nbsp;</td>
						<td>
							<span class="fl" style="font-size:24px;">注册</span>
							<span class="fr">
								已有商城账号，
								<a href="front/Login.jsp" style="color:#ff4e00;">我要登录</a>
							</span>
						</td>
					</tr>
					<!-- <tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;
						</td>
						<td>
							<input type="text" value="" class="l_user" name="username" id="username"/>
						</td>
					</tr> -->
					<tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;手机 &nbsp;
						</td>
						<td>
							<input type="text" value="" class="l_tel" name="userphone" id="userphone"/>
						</td>
					</tr>
					<tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;密码 &nbsp;
						</td>
						<td>
							<input type="password" value="" class="l_pwd" name="userpassword" id="userpassword"/>
						</td>
					</tr>
					<!-- <tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;
						</td>
						<td>
							<input type="password" value="" class="l_pwd" name="conpassword" id="conpassword"/>
						</td>
					</tr> -->
					<!-- <tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;
						</td>
						<td>
							<input type="text" value="" class="l_email" name="useremail" id="useremail"/>
						</td>
					</tr> -->
					<!-- <tr height="50">
						<td align="right">邀请人会员名 &nbsp;</td>
						<td>
							<input type="text" value="" class="l_mem" />
						</td>
					</tr>
					<tr height="50">
						<td align="right">邀请人ID号 &nbsp;</td>
						<td>
							<input type="text" value="" class="l_num" />
						</td>
					</tr> -->
					<tr height="50">
						<td align="right">
							<font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;
						</td>
						<td>
							<input type="text" value="" class="l_ipt" />
							<a href="#" style="font-size:12px; font-family:'宋体';">换一张</a>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="font-size:12px; padding-top:20px;">
							<span style="font-family:'宋体';" class="fl">
								<label class="r_rad">
									<input type="checkbox" />
								</label>
								<label class="r_txt">我已阅读并接受《用户协议》</label>
							</span>
						</td>
					</tr>
					<tr height="60">
						<td>&nbsp;</td>
						<td>
							<button class="log_btn" id="regist_btn">注册</button>
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
			复制必究 , Technical Support: Dgg Group <br /> <img src="front/images/b_1.gif" width="98" height="33" /><img
				src="front/images/b_2.gif" width="98" height="33" /><img src="front/images/b_3.gif" width="98" height="33" /><img
				src="front/images/b_4.gif" width="98" height="33" /><img src="front/images/b_5.gif" width="98" height="33" /><img
				src="front/images/b_6.gif" width="98" height="33" />
		</div>
	</div>
	<!--End Footer End -->
	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	
	<script>
		$("#regist_btn").click(function (){
			//var username = $("#username").val();
			var userphone = $("#userphone").val();
			var userpassword = $("#userpassword").val();
			//var useremail = $("#useremail").val();
			var ii = layer.load();
			$.ajax({
				url : "user/register.action",
				type : "POST",
				data : {
					"userphone" : userphone,
					"userpassword" : userpassword
				},
				success : function(result){
					if(result.status == 0){
						layer.close(ii);
						layer.msg(result.msg);
						window.location.href = "front/Login.jsp";
					} else {
						layer.close(ii);
						layer.msg(result.msg);
					}
				}
			});
		});
		$("#userphone").blur(function (){
			var ii = layer.load();
			var str = $("#userphone").val();
			$.ajax({
				url : "user/checkValid.action",
				data : {
					"str" : str,
					"Type" : "userphone"
				},
				success : function(result){
					console.log(result);
					layer.close(ii);
					layer.msg(result.msg);
				}
			});
		});
	</script>
</body>
</html>

