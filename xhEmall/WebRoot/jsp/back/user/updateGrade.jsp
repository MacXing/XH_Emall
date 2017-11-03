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
    
    <title>修改等级列表信息</title>
    
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
                        <h5>修改等级列表信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="alert alert-info">
                          
                        </div>
                        <form role="form" class="form-horizontal m-t" id="update" method="post" enctype="multipart/form-data">
                            <div class="col-md-12">                           
                            	<div class="form-group">                             		                           	                               	    
                                    <div class="col-sm-9">                                                                           
                                        <input name="gradeid" value="${grade.gradeid }" type="hidden" class="form-control" placeholder="请输入ID">
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">等级名称：</label>                                	                  	                            	    
                                    <div class="col-sm-9">                                                                        	
                                        <input name="gradename" value="${grade.gradename }" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">  
                                	<label class="col-sm-3 control-label">等级条件：</label>                          	    
                                    <div class="col-sm-9">                                        
                                        <%-- <input name="gradecount" value="${grade.gradecount }" class="form-control"> --%>
                                        <textarea rows="5" cols="80" name="gradecount" value="${grade.gradecount }" data-provide="markdown" class="form-control" class="md-input" style="resize: none; display: block;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">
                            	 <font color="red"><%=message %></font>
                                <div class="col-sm-12 col-sm-offset-6">
                                	<input type="button" value="保存修改" class="btn btn-primary" onclick="doupdate()">
            	                    <input type="button" value="取消" class="btn btn-white" onclick="javascript:window.location.href='${pageContext.request.contextPath }/grade/queryallGrade.action'">                                    
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
	function doupdate(){
		var formData = new FormData($("#update")[0]);
		$.ajax({
		cache: true,
		type: "POST",
		url:"${pageContext.request.contextPath }/grade/modifyGradeList.action",
		data:formData,
		//data:$('#update').serialize(),	//要发送的是ajaxFrm表单中的数据
		async: false,
		cache: false,  
	    contentType: false,  
	    processData: false,
		success: function(result) {
			if(result.code!=100){				  	
			    alert("修改成功！");
			    window.location.href="grade/queryallGrade.action";
		   }else{
			  alert("修改失败！");
			  window.location.href="grade/queryallGrade.action";
		   } 	
		}
		});
		} 
	
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
