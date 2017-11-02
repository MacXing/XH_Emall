<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会员</title>
    
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
	 	<%
        	String message=(String)request.getAttribute("message");
        	if(message==null){
        		message="";
        	}
     	%>
    <div class="row">
        <div class="col-md-18">
            <div class="container">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>添加会员</h5>
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
                        <form class="form-horizontal m-t" id="add" enctype="multipart/form-data">
                            <div class="col-md-12">                           
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">会员等级：</label>                            	    
                                    <div class="col-sm-9">
                                        <input name="gradeid" type="text" class="form-control" placeholder="请输入ID">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="username" class="form-control" placeholder="请输入姓名">
                                    </div>
                                </div>                                                               
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">密码：</label>
                                    <div class="col-sm-9">
                                        <input type="password" name="userpassword" class="form-control" placeholder="请输入密码">
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
                                        <input type="date" name="userbirthday" class="form-control" placeholder="请输入生日" id="erro">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userphone" class="form-control" placeholder="请输入电话号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮箱：</label>
                                    <div class="col-sm-9">
                                        <input type="email" name="useremail" class="form-control" placeholder="请输入邮箱">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地址：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="useraddress" class="form-control" placeholder="请输入地址">
                                    </div>
                                </div>                        
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">访问数：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="uservisitcount" class="form-control" placeholder="请输入访问数">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">家庭电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userhomephone" class="form-control" placeholder="请输入家庭电话">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">消费金额：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="usermoney" class="form-control" placeholder="请输入消费金额">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">会员积分：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="userintegral" class="form-control" placeholder="会员积分">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">上传头像：</label>
                                    <div class="col-sm-4">                                   
                                    	选择图片：<img width="80px" height="100px" id="img" onclick="showPic()">
                                        <input type="file" name="userphotoload" class="form-control" placeholder="修改头像" id="file">                                                                         	
                                    </div>
                                </div>                              
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute1" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute2" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                    
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute3" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                 
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute4" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute5" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute6" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">
                            	 <font color="red"><%=message %></font>
                                <div class="col-sm-12 col-sm-offset-3">
                                	<input type="button" value="添加会员" class="btn btn-primary" onclick="addUser()">
            	                    <input type="button" value="取消" class="btn btn-white" onclick="javascript:window.location.href='${pageContext.request.contextPath }/user/queryAllUsers.action'">
                                    <!-- <button class="btn btn-primary" type="submit">添加会员</button>
                                    <button class="btn btn-white" id="back">取消</button> -->
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

	<script>

	function addUser(){
		var formData = new FormData($("#add")[0]);
		$.ajax({
		cache: true,
		type: "POST",
		data:formData,
		url:"${pageContext.request.contextPath }/user/addUser.action",
		async: false,
		cache: false,  
	    contentType: false,  
	    processData: false,
		success: function(result) {
			  if(result.code!=100){	
				    alert("增加成功！");
				    window.location.href="user/queryAllUsers.action";
			   }else{
				  alert("增加失败！");
				  window.location.href="user/queryAllUsers.action";
			   } 		
		}
		});
		}  
	
	/*显示图片*/
	function showPic(){
		 var pic = $("#file").get(0).files[0];
		 $("img").prop("src" , window.URL.createObjectURL(pic));

		}
	
	
	/*设置提示*/
	
	</script>

    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="resource/js/plugins/validate/messages_zh.min.js"></script>
    <script src="resource/js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
