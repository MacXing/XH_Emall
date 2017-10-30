<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改会员信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="shortcut icon" href="favicon.ico">
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
  </head>
  
  <body>
<div class="container">
    <div class="row">
        <div class="col-md-18">
            <div class="container">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改会员信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_editors.html#">选项1</a>
                                </li>
                                <li><a href="form_editors.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="alert alert-info">
                          
                        </div>
                        <form role="form" class="form-horizontal m-t" action="${pageContext.request.contextPath }/user/updateUser.action" method="post" >
                            <div class="col-md-12">                           
                            	<div class="form-group">                            	    
                                    <div class="col-sm-9">
                                        <input name="userid" value="${user.userid }" type="hidden" class="form-control" placeholder="请输入ID">
                                    </div>
                                </div>
                                <div class="form-group">                            	    
                                    <div class="col-sm-9">
                                        <input name="gradeid" value="${user.gradeid }" type="hidden" class="form-control" placeholder="请输入ID">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="username" value="${user.username }" class="form-control" placeholder="请输入姓名">
                                    </div>
                                </div>                                                               
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">密码：</label>
                                    <div class="col-sm-9">
                                        <input type="password" name="userpassword" value="${user.userpassword }" class="form-control" placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">性别：</label>                          
                                    <div class="col-sm-9">
                                    	<input type="radio"name="usersex"id="sex"value="1"<c:if test="${user.usersex>=1&&user.usersex<=200}">checked</c:if>/>男&nbsp;&nbsp;
                                    	<input type="radio"name="usersex"id="sex"value="0"<c:if test="${user.usersex>200||user.usersex eq 0}">checked</c:if>/>女
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">生日：</label>
                                    <div class="col-sm-9">
                                        <input type="date" name="userbirthday" value="${user.userbirthday }" class="form-control" placeholder="请输入生日">
                                    原出生年月：<fmt:formatDate value="${user.userbirthday }" type="date" pattern="yyyy-MM-dd"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userphone" value="${user.userphone }" class="form-control" placeholder="请输入电话号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮箱：</label>
                                    <div class="col-sm-9">
                                        <input type="email" name="useremail" value="${user.useremail }" class="form-control" placeholder="请输入邮箱">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地址：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="useraddress" value="${user.useraddress }" class="form-control" placeholder="请输入地址">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">注册时间：</label>
                                    <div class="col-sm-9">
                                        <input type="date" name="userlogintime" value="${user.userlogintime }" class="form-control" placeholder="请输入地址">
                                        原注册时间：<fmt:formatDate value="${user.userlogintime }" type="date" pattern="yyyy-MM-dd"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">最后登录时间：</label>
                                    <div class="col-sm-9">
                                        <input type="date" name="userlasttime" value="${user.userlogintime }" class="form-control" placeholder="请输入家庭电话">
                                        最后登录时间：<fmt:formatDate value="${user.userlogintime }" type="date" pattern="yyyy-MM-dd"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">最后登录IP：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userlastip" value="${user.userlastip }" class="form-control" placeholder="请输入家庭电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">访问数：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="uservisitcount" value="${user.uservisitcount }" class="form-control" placeholder="请输入家庭电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">家庭电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userhomephone" value="${user.userhomephone }" class="form-control" placeholder="请输入家庭电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">消费金额：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="usermoney" value="${user.usermoney }" class="form-control" placeholder="请输入家庭电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">修改头像：</label>
                                    <div class="col-sm-9">
                                        <input type="file" name="userphoto" value="${user.userphoto }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute1" value="${user.attribute1 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute2" value="${user.attribute2 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                    
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute3" value="${user.attribute3 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                 
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute4" value="${user.attribute4 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute5" value="${user.attribute5 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute6" value="${user.attribute6 }" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">
                                <div class="col-sm-12 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">保存修改</button>
                                    <button class="btn btn-white" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/updateUser.action'">取消</button>
                                </div>
                            </div>
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

        </div>
     
    </div>
</div>

    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="resource/js/plugins/validate/messages_zh.min.js"></script>
    <script src="resource/js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
