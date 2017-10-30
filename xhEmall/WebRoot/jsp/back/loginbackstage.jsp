<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link href="resource/css/login.min.css" rel="stylesheet" type="text/css">
	<link href="resource/css/style.min.css" rel="stylesheet" type="text/css">
	<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
		

  </head>
  
  <body class="signin">		
		<div class="signinpanel"  >	
		<div class="row">
			<div class="col-sm-5">
				
			<form method="post" action="${pageContext.request.contextPath }/admin/checkAdmin.action">
				<p class="m-t-md">后台登录</p>
				<input type="text" class="form-control uname " placeholder="用户名" name="adminname"/>
	            <input type="password" class="form-control pword m-b" placeholder="密码" name="adminpassword"/>
	            
	            
	            <input type="text" class="form-control verify " placeholder="请输入验证码" name="code"/>
	            <a href="javascript:change()"><img style="margin:-35px 0px 15px 0px; float:right;" id="img" alt="" src="${pageContext.request.contextPath }/image/imageCode.action"></a>	            
    			
	            <br />
	            <a href="#">忘记密码</a>
	           
	            <button class="btn btn-success btn-block">登录</button>
			</form>	
		</div>	
		</div>
        <div class="signup-footer">
            <div class="pull-left">            	
                &copy; 2017 CJ team copyright             
            </div>
        </div>
       </div>
<script type="text/javascript">
		function change(){//通过a标签的href属性调用此方法
			var img =  document.getElementById("img");
			img.src ="${pageContext.request.contextPath }/image/imageCode.action?a="+new Date().getTime();
		}
</script>
	</body>
	
</html>
