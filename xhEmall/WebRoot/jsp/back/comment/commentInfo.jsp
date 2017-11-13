<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论信息</title>
    
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
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<link rel="stylesheet" type="text/css" href="resource/css/plugins/markdown/bootstrap-markdown.min.css" />

	
  </head>
  
  <body class="gray-bg">
		<div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>评论图片</h5>
                    </div>
                    <div>
                        <div class="ibox-content no-padding border-left-right">
                            <img alt="image" class="img-responsive" src="" id="img">
                        </div>
                        <div class="ibox-content profile-content">
                          
                            <div class="row m-t-lg">
    
                            </div>
                            <div class="user-button">
                                <div class="row">
                                   <!--  <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block" id="fix"><i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;点击修改</button>
                                    </div> -->
                                    <div class="col-sm-6">
                                        <input type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>评论信息</h5>
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
                        <div>
                            <div class="feed-activity-list">         
                                        <div class="alert alert-success alert-dismissable">
                                        	<a class="alert-link"">商品名称：</a>
				                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
				                            <span id="pname"></span>
				                        </div>
                                           
	                                    <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">会员名称：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="username"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">评论：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="commenttxt"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">评论时间：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="commenttime"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">服务等级：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="commentservice"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">物流等级：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="commentshopping"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">货物等级：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="commentgoods"></span>
					                   </div>
					                 
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
   
    
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/to-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.zh.js"></script>

 
    <script>
    
    $(function(){
    	
    	  $.ajax({
		   url:"${pageContext.request.contextPath }/comment/queryCommentById.action?id="+getID(),
		   type:"GET",
		   success:function(result){
				   	console.log(result);				   	
	    			$("#pname").html(result.extend.comment.product.pname);
	    			$("#username").html(result.extend.comment.users.username);
	    			$("#commenttxt").html(result.extend.comment.commenttxt);
	    			$("#commenttime").html(fmtDate(result.extend.comment.commenttime));
	    			$("#commentservice").html(result.extend.comment.commentservice);
	    			$("#commentshopping").html(result.extend.comment.commentshopping);
	    			$("#commentgoods").html(result.extend.comment.commentgoods);
	    			$("#img").attr("src","${pageContext.request.contextPath}/upload/"
	    					+result.extend.comment.commentimg);
		   }   
	   }); 	
    });
    	
   
    </script>
     
<script type="text/javascript">
function getID(){
	var Ohref=window.location.href;
	var arrhref=Ohref.split("?id=");
	var id = arrhref[1];
	return id;
}


/* 时间格式转换 */
function fmtDate(obj){
    var date =  new Date(obj);
    var y = 1900+date.getYear();
    var m = "0"+(date.getMonth()+1);
    var d = "0"+date.getDate();
    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
} 

</script>



</body>

</html>
