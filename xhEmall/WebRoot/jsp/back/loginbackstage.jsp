<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'loginbackstage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="resource/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/css/login.min.css" rel="stylesheet" type="text/css">
<link href="resource/css/style.min.css" rel="stylesheet" type="text/css">
<link href="resource/loginback/bootstrapValidator.css" rel="stylesheet"
	type="text/css">


</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-5 col-md-offset-3">

				<form id="defaultForm" method="post"
						action="${pageContext.request.contextPath }/admin/checkAdmin.action">

					<p class="m-t-md">后台登录</p>
					<div class="form-group ">
						<input type="text" class="form-control uname  " placeholder="用户名"
							name="adminname" id="adminname" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control pword m-b"
							placeholder="密码" name="adminpassword" id="adminpassword" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control verify "
							placeholder="请输入验证码" name="code" id="code" /> <a
							href="javascript:change()"><img
							class="img-rounded  imgverify" id="img" alt=""
							src="${pageContext.request.contextPath }/image/imageCode.action"></a>
					</div>
					<br /> <a href="#" style="color:#fff">忘记密码</a>

					<button id="login" type="submit" class="btn btn-success btn-block">登录</button>
				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
		<div class="signup-footer col-md-5  ">
			<div class="pull-left  ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &copy; 2017 CJ team
				copyright</div>
		</div>
	</div>


	<script type="text/javascript" src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script type="text/javascript"
		src="resource/loginback/bootstrapValidator.js"></script>

	<script type="text/javascript">
		$(function() {
			//验证表单
			$("#defaultForm")
					.bootstrapValidator({
						message : 'This value is not valid',
						feedbackIcons : {
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {
							adminname : {
								message : 'The username is not valid',
								validators : {
									notEmpty : {
										message : '请输入用户名'
									},
									stringLength : {
										min : 3,
										max : 16,
										message : '用户名长度在3到16个字符'
									},
									
								}
							},
							adminpassword : {
								validators : {
									notEmpty : {
										message : '请输入密码'
									}
								}
							}

						}
					})
					//提交
					.on(
							function(e) {

								e.preventDefault();
								var ref = true;
								$
										.ajax({
											url : "${pageContext.request.contextPath }/admin/checkAdmin.action",
											type : "post",
											data : $("form").serialize(),
											dataType : "json",
											success : function(data) {
												if (data.status = "success") {
													ref = true;
												}

											}
										});
								return ref;
							});

		});
	</script>




	<script type="text/javascript">
		function change() {//通过a标签的href属性调用此方法
			var img = document.getElementById("img");
			img.src = "${pageContext.request.contextPath }/image/imageCode.action?a="
					+ new Date().getTime();
		}
	</script>
</body>

</html>
