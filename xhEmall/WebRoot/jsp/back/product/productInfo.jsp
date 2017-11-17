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
    
    <title>商品信息</title>
    
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
                        <h5>图片资料</h5>
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
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block" id="fix"><i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;点击修改</button>
                                    </div>
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
                        <h5>商品信息</h5>
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
	                                        <a class="alert-link"">商品品牌：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="brand"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品描述：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pdesc"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品定价：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pprice"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品售价：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="psale"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品图片详细：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pimgdetail"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品添加时间：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="paddtime"></span>
					                   </div>
					                   <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品修改时间：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pupdatetime"></span>
					                   </div>
					                    <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品大小：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="psize"></span>
					                   </div>
					                    <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品规格：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="punit"></span>
					                   </div>
					                    <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品打折：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pdiscount"></span>
					                   </div>
					                    <div class="alert alert-success alert-dismissable">
	                                        <a class="alert-link"">商品是否参加积分：</a>
					                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
					                        <span id="pintegral"></span>
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
		   url:"${pageContext.request.contextPath }/product/queryProductById.action?id="+getID(),
		   type:"GET",
		   success:function(result){
				   	console.log(result);
				   	/* $("#pid").val(result.pid); */
	    			$("#pname").html(result.pname);
	    			$("#pdesc").html(result.pdesc);
	    			$("#pprice").html(result.pprice);
	    			$("#psale").html(result.psale);
	    			$("#paddtime").html(fmtDate(result.paddtime));
	    			$("#pimgdetail").html(result.pimgdetail);
	    			$("#psize").html(result.psize);
	    			$("#punit").html(result.punit);
	    			$("#pdiscount").html(result.pdiscount);
	    			$("#brand").html(result.brand.brandname);
	    			$("#img").attr("src","${pageContext.request.contextPath}"+result.pimg);
	    			$("#pupdatetime").html(fmtDate(result.pupdatetime));
	    			if(result.pIntegral==0){
	    				$("#pintegral").html("否");
	    			}else{
	    				$("#pintegral").html("是");
	    			}
		   }   
	   }); 	
    });
    	
   
    </script>
<script type="text/javascript">
	$("#fix").on("click",function(){
		window.location.href="${pageContext.request.contextPath }/jsp/back/product/updateProduct.jsp?id="+getID();
	});
	
	$("#return").on("click",function(){
		window.location.href="${pageContext.request.contextPath }/product/queryAllProducts.action";
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
