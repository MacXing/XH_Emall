<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	--> 
	<link rel="stylesheet" type="text/css" href="resource/css/loginstyle.css">
   <script type="text/javascript">
		function change(){//通过a标签的href属性调用此方法
			var img =document.getElementById("img");
			img.src = "/xhEmall/image/imageCode.action?a=" + new Date().getTime();
		}
	</script>
  </head>
  
  <body>
   <form action="${ pageContext.request.contextPath}/admin/checkAdmin.action" method="get">
     <div class="login">
        <div class="logol-d">
         <div class="logol">
         <span ><font color="blue" size="4.4em">登录账号</font></span>
         </div>
         
         </div> 
       <div>
       <div class="login-user">
         <input class="login-input" type="text" name="username" placeholder="手机号/邮箱">
          </div><br>
          <img class="login-uimage"  src="resource/img/f2.png"/>
         <div class="login-pwds">
         <input class="login-pass" type="password" name="password"placeholder="密码" >
         </div><br>
         <img class="login-pimage"  src="resource/img/f1.jpg"/>
         <div class="login-yz">
         <a class="login-hyza a" href="javascript:change()">看不清</a>
         <input class="login-yzborder"type="text" name="code"  placeholder="验证码">
         <img class="login-yzborder1" id="img"  src="${pageContext.request.contextPath}/image/imageCode.action"/>
         <input class="submit"type="submit" value="登录">
         </div>
           <a class="register" href="${pageContext.request.contextPath}/jsp/front/sign.jsp">立即注册</a> 
      </div>
      </div>
      </form>
  </body>
</html>