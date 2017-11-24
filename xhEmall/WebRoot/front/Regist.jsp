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

<title>注册</title>

<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />
<link type="text/css" rel="stylesheet" href="front/css/btn.css"  />

<title>尤洪</title>
</head>
<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<span class="fr">
			<span class="fl">
				<c:if test="${current_user.userid == null }">
					你好，请
					<a href="front/Login.jsp" style="color:#ff4e00;"">登录</a>
					&nbsp;|&nbsp;
					<a href="front/Regist.jsp">免费注册</a>
					&nbsp;
				</c:if>
				<c:if test="${current_user.userid != null}">
					欢迎您，<a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
					&nbsp;|&nbsp;
					<a class="logout">退出登录</a>
					&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid}">我的订单</a>
					&nbsp;|
					<a href="${pageContext.request.contextPath }/trolley/findByUser.action">我的购物车</a>
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
       		<span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
       		<span class="fr">|&nbsp;<a href="home/home.action">首页&nbsp;<img src="front/images/home.png" align="absmiddle" /></a></span>
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
		<div class="regist">
			<div class="log_img">
				<img src="front/images/login1.png" width="355" height="370" />
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
							<input type="text" value="" class="l_ipt" placeholder="验证码" id="message"/>
							<input type="button" class="layui-btn layui-btn-primary" value ="免费获取验证码" id="msgbtn" onclick="settime(this)"/>
							<!-- <button class="layui-btn layui-btn-primary" id="msgbtn" onclick="javascriot:settime(this)">免费获取验证码</button> -->
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
	<jsp:include page="/front/foot.jsp"/>
	<!--End Footer End -->
	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	
	<script>
		$("#regist_btn").click(function (){
			//var username = $("#username").val();
			var userphone = $("#userphone").val();
			var userpassword = $("#userpassword").val();
			var message = $("#message").val();
			//var useremail = $("#useremail").val();
			var ii = layer.load();
			$.ajax({
				url : "user/register.action",
				type : "POST",
				data : {
					"userphone" : userphone,
					"userpassword" : userpassword,
					"message" : message
				},
				success : function(result){
					if(result.status == 0){
						layer.close(ii);
						layer.msg(result.msg);
						window.location.href = "${pageContext.request.contextPath}/front/Login.jsp";
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
		//$("#msgbtn").click(function (){
			//settime($("#msgbtn"));
			/* var phone = $("#userphone").val();
			$.ajax({
				url : "user/message.action?phone=" + phone,
				success : function(result){
					if(result.code == 100){
						settime($("#msgbtn"));
					} else {
						settime($("#msgbtn"));
					}
				}
			}); */
		//});
		var countdown = 60;
	    function settime(obj) {
	    	var phone = $("#userphone").val();
	    	$.ajax({
	    		url: "user/message.action?phone=" + phone,
	    		success: function (result){
	    			if(result.code == 100){
	    				begin(obj);
	    			} else {
	    				layer.msg("发送失败");
	    			}
	    		}
	    	});
	        
	    }
	    function begin(obj) {
	    	if (countdown == 0) {
	            obj.removeAttribute("disabled");
	            obj.value = "免费获取验证码";
	            countdown = 60;
	            return;
	        } else {
	            obj.setAttribute("disabled", true);
	            obj.value = "重新发送(" + countdown + ")";
	            countdown--;
	        }
	        setTimeout(function() {
	        	begin(obj);
	        }, 1000);
	    }
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
	<!-- <script type="text/javascript" src="layui/layui.all.js"></script> -->
</body>
</html>

