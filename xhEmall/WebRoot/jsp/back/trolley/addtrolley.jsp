<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/H-ui.min.css" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/iconfont.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/skin.css" id="skin" /> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/addtorlley/font-awesome.min.css" />


    </head>
    <body>
	  <article class="cl pd-20">
	<form action="${pageContext.request.contextPath}/trolley/addTrolley.action" method="post" class="form form-horizontal">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
			<span class="c-red">*</span>用户</label>
			<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${xhtrolley.userid }" placeholder="" id="userID" name="userid" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="myselect">
					
				</select>
				<input type="text" class="input-text" value="${xhtrolley.pid}"  name="pid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品数量</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="tronum" value="${xhtrolley.tronum}" >
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input type="submit" class="btn btn-success radius" id="trolley-save" name="添加" value="添加"/>
			</div>
		</div>
	</form>
</article>
	  
<script type="text/javascript">

</script>

   
 	</body>
</html>