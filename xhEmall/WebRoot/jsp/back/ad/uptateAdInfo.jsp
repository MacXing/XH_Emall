<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryAdInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script src="resource/js/jquery.min.js"></script>
    <script src="resource/js/bootstrap.min.js"></script>
    <script src="resource/js/content.min.js"></script>
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="resource/js/demo/peity-demo.min.js"></script>
   
	<link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css" rel="stylesheet">
    <base target="_blank">
  </head>
  
  <body  class="gray-bg">
  <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>广告基本信息</h5>
                        <button  id="btn_id" class="btn btn-primary" type="button"  style="margin-left: 328px;width: 100px;" >修改广告信息</button>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>                 
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    
                         <div class="ibox-content" style=" float: left; width:400px;">
                            <div class="form-group">
                              <div class="ibox-content no-padding border-left-right">
                            <img alt="image" style="width: 280px ;margin-left:45px;" class="img-responsive" src="img/profile_big.jpg">
                           </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                           </div> 
                           <form id="myform" method="post" action="" enctype="multipart/form-data">
                          <div class="ibox-content" style="float:right; margin-top: -357px;margin-right: 1px;width: 660px;" >   
                            <div class="form-group">
                              <div class="ibox-content no-padding border-left-right">
                                <label class="col-sm-2 control-label">广告标题：</label>
                                <div class="col-md-6">
                                   <input id="pprice" type="text" class="form-control" name="pprice" value="${oneAd.adname}">
                                </div>
                                </div>
                            </div>
                            <br>
                            <div class="hr-line-dashed"></div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告描述：</label>
                                <div class="col-sm-10 ">
                                 <input id="pprice1" type="text" class="form-control" name="pprice" value="${oneAd.adtxt}">  
                                </div>
                            </div>
                            <br>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告位置：</label>

                                <div class="col-md-6">
                                    <input id="pdesc" type="text" class="form-control" name="pdesc" value="${oneAd.position.positionName}"> 
                                    
                                </div>
                            </div>
                            <br>
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                                <label class="col-sm-2 control-label">点击数：</label>
                                <div class="col-md-6">
                                    <input id="pdesc1" type="text" class="form-control" name="pdesc" value="${oneAd.adclick}"/>
                                    
                                </div>
                            </div>
                            <br>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">广告链接：</label>
                                <div class="col-md-6">
                                    <input id="psale" type="text" class="form-control" name="psale" value="${oneAd.adlink}">
                                </div>
                            </div>
                            <br>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">创建日期：</label>
                                   <div class="col-md-6" id="file-pretty">
			                           <input id="pprice" type="text" class="form-control" name="pprice" value="${oneAd.adtime}">
			                       </div>                                
                            </div>
                            <br>
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                                <label class="col-sm-2 control-label">广告日期：</label>
                                   <div class="col-md-6" id="file-pretty">
			                           <input id="pprice" type="text" class="form-control" name="pprice" value="${oneAd.adstarttime}">-
			                           <input id="pprice" type="text" class="form-control" name="pprice" value="${oneAd.adendtime}">
			                       </div>                                
                            </div>
                            <br>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <input type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
   
           
     <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>   
      <script type="text/javascript" src="resource/js/validate.js"></script>

	<script type="text/javascript">
		$("#btn_id")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											pprice : "notEmpty",
											pprice1 : "notEmpty",
											pdesc : "notEmpty",
											pdesc1 : "notEmpty",
											psale : "notEmpty",
										
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun : function addorder() {
										 alert("验证成功");
											}

									});
						});
    </script>
  </body>
</html>
