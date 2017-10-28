<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	<link href="resource/css/login.min.css" rel="stylesheet" type="text/css">
	<link href="resource/css/style.min.css" rel="stylesheet" type="text/css">
	<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
	

  </head>
  
  <body class="signin">		
		<div class="signinpanel" >	
		<div class="row">
			<div class="col-sm-5">
			<form class=method="post" action="${pageContext.request.contextPath }/admin/checkAdmin.action">
				<p class="m-t-md">后台登录</p>
				<input type="text" class="form-control uname" placeholder="用户名" />
	            <input type="password" class="form-control pword m-b" placeholder="密码" />					
	            <a href="#">忘记密码</a>
	            <button class="btn btn-success btn-block">登录</button>
			</form>
			</div>
		</div>
		
		</div>
        <div class="signup-footer">
            <div class="pull-left">            	
                &copy; 2017 CJ team copyright             
            </div>
        </div>
        </div>
	</body>
</html>
