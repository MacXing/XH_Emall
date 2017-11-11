<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addAd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${pageContext.request.contextPath}/resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/content.min.js?v=1.0.0"></script>
	<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${pageContext.request.contextPath}/resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/resource/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">

  </head>
  
  <body>
    <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>增加广告</h5>
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
                        <form id="myform" method="post" action="${pageContext.request.contextPath}/ad/insertAd.action" class="form-horizontal" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告位置：</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="addposition" name="addposition">
                                    
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告标题：</label>
                                <div class="col-md-3 ">
                                 <input id="pprice" type="text" class="form-control" name="pprice">   
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告描述：</label>

                                <div class="col-sm-10">
                                    <input id="pdesc" type="text" class="form-control" name="pdesc"> <span class="help-block m-b-none">广告说明，50字内说明广告信息。</span>
                                    
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告链接：</label>
                                <div class="col-md-3">
                                    <input id="psale" type="text" class="form-control" name="psale">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                             
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告图片：</label>
                                <div class="col-md-3">
                                    <div id="file-pretty">
			                            <div class="form-group">
			                                <input type="file" id="file" class="form-control" name="file" onchange="showPic()"/>
			                               		
									 		<img class="img-rounded" id="img" width="150" height="150"> 	
			                            </div>  
		                            </div>
                                </div>  
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告创建日期：</label>
                                   <div class="col-md-3" id="file-pretty">
			                           <input id="pprice" type="text" class="form-control" name="pprice" value="">
			                       </div>                                
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" id="btn_id">保存内容</button>
                                    <!-- <button class="btn btn-white" id="return">返回</button> -->
                                    <input type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="resource/js/validate.js"></script>

	<script type="text/javascript">
		$("#btn_id")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											pprice : "notEmpty",
											pdesc : "notEmpty",
											psale : "notEmpty",
										
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun : function addorder() {
										 alert("验证成功");
											}

									});
						});
    </script>
    
     <script type="text/javascript">
      $(function(){
        $.ajax({
          url:"${pageContext.request.contextPath}/ad/queryAllAdsList.action",
          type:"GET",
          success:function(result){
            $.each(result.extend.allAdsList,function(index,item){
                 var option3=$("<option value='"+item.adid+"'></option>").append(item.position.positionName);
                 option3.appendTo(addposition);
            });
           }
        });
      });
      
    </script>
  </body>
</html>
