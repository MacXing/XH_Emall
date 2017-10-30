<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询会员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <base target="_blank">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>会员信息 <small>查找</small></h5>
                        <div class="ibox-tools">
                        	<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="jsp/back/user/addUser.jsp">添加会员</a>                                
                                </li>
                            </ul>
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>                            
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                	<th>编号</th>
                                    <th>等级编号</th>
                                    <th>姓名</th>
                                    <th>密码</th>
                                    <th>性别</th>
                                   <!--  <th>生日</th>
                                    <th>电话号码</th>
                                    <th>邮箱</th>
                                	<th>地址</th>
                                    <th>注册时间</th>
                                    <th>最后登录时间</th>
                                    <th>最后登录IP</th>
                                    <th>访问数</th>
                                    <th>家庭电话</th>
                                    <th>会员头像</th>
                                    <th>消费金额</th> -->
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>             
                                <c:forEach items="${allUser }" varStatus="status" var="user">
							    	<tr class="gradeX">
							    		<td>${user.userid }</td>
							    		<td>${user.gradeid }</td>
							    		<td>${user.username }</td>
							    		<td>${user.userpassword }</td>
							    		<td>
							    			<c:if test="${user.usersex>=1&&user.usersex<=200}">男</c:if>
							    			<c:if test="${user.usersex>200||user.usersex eq 0}">女</c:if>
							    		</td>
							    		<%-- <td>
							    		<fmt:formatDate value="${user.userbirthday }" type="date" pattern="yyyy-MM-dd"/>
							    		</td>
							    		<td>${user.userphone }</td>
							    		<td>${user.useremail }</td>
							    		<td>${user.useraddress }</td>
							    		<td>
							    		<fmt:formatDate value="${user.userlogintime }" type="date" pattern="yyyy-MM-dd"/>
							    		</td>
							    		<td>
							    		<fmt:formatDate value="${user.userlasttime }" type="date" pattern="yyyy-MM-dd"/>
							    		</td>
							    		<td>${user.userlastip }</td>
							    		<td>${user.uservisitcount }</td>
							    		<td>${user.userhomephone }</td>
							    		<td>${user.userphoto }</td>
							    		<td>${user.usermoney }</td>	 --%>
							    		<td class="text-center">							    			
							    			<a href="${pageContext.request.contextPath }/user/deleteUser.action?id=${user.userid}" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a href="${pageContext.request.contextPath }/user/queryUserById.action?id=${user.userid}" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th>编号</th>
                                    <th>等级编号</th>
                                    <th>姓名</th>
                                    <th>密码</th>
                                    <th>性别</th>
                                    <th>生日</th>
                                    <!-- <th>电话号码</th>
                                    <th>邮箱</th>
                                	<th>地址</th>
                                    <th>注册时间</th>
                                    <th>最后登录时间</th>
                                    <th>最后登录IP</th>
                                    <th>访问数</th>
                                    <th>家庭电话</th>
                                    <th>会员头像</th>
                                    <th>消费金额</th> -->
                                    <th>操作</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>

</body>

</html>
