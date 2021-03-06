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
    
    <title>导航栏管理</title>
    
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
                        <h5>轮播图信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a id="addNavbar">添加轮播图</a>
                               
                                </li>
                            </ul>
                            <a  id="flash">
                                <i class="fa fa-refresh"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead >
                                <tr>
                                	<th class="text-center">Id</th>
                                    <th class="text-center">轮播图名字</th>
                               		<th class="text-center">轮播图</th>
                                    <th class="text-center">添加时间</th> 
                                    <th class="text-center">是否展示</th>                                   
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${navbars }" var="item">
							    	<tr>
							    		<td>${item.bid }</td>
							    		<td>${item.bname }</td>				
							    		<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath}/${item.url}" title="">
					                            <img style="width:100px;height:80px"; src="${pageContext.request.contextPath}/${item.url}" />
					                        </a>
							    		</td>	
							    		<td><fmt:formatDate value="${item.bDate }" pattern="yyyy-MM-dd"/></td>
							    		
										<c:if test="${item.isshow==1 }">
											<td><a onclick="btn1(${item.bid },${item.isshow })"><li class="fa fa-check"></li></a></td>
										</c:if>
										
										<c:if test="${item.isshow==0 }">
											<td><a onclick="btn3(${item.bid },${item.isshow })"><li class="fa fa-close"></li></a></td>
										</c:if>
	    							    						   
							    		<td class="text-center">							    							    			
							    			<a onclick="btn2(${item.bid })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach> 
                            </tbody>                     
                        </table>
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
    
    <script>
        $(document).ready(function(){       	
        	$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
    </script>
    
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>
    
    <!-- 
    	单选删除按钮
     -->
    <script type="text/javascript">
	 /*
		刷新按钮
	*/
	$("#flash").on("click",function(){
		 window.location.href="${pageContext.request.contextPath }/navbar/queryAllNavbar.action";  	
	});

	/* 点击删除 */
	function btn2(id){
		if(!confirm("您确定要删除该商品图片吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/navbar/deleteNavbar.action?id="+id,
	 			   type:"GET",
	 			   success:function(result){
	 					   if(result.code==100){
	 						   alert("删除成功！");
	 						  window.location.href="navbar/queryAllNavbar.action";
	 					   }else{
	 						  alert("删除失败！");
	 					   }	  
	 			   }
	 			   
	 		   });
	 	   };
	}
	/**
	*点击跳转到增加页面
	*/
   $("#addNavbar").on("click", function(){
	   
	   window.location.href="${pageContext.request.contextPath }/jsp/front/navbar/addNavbar.jsp";
	   
    }); 
    
    
    </script>
    
    <script type="text/javascript">
    	function btn1(id,isshow){
    		$.ajax({
    			url:"${pageContext.request.contextPath }/navbar/updateNavbar.action?bid="+id+"&isshow="+isshow,
    			type:"GET",
    			success:function(){
    				window.location.href="${pageContext.request.contextPath }/navbar/queryAllNavbar.action";  	
    			}
    		});
    	}
    	
    	function btn3(id,isshow){
    		$.ajax({
    			url:"${pageContext.request.contextPath }/navbar/updateNavbar.action?bid="+id+"&isshow="+isshow,
    			type:"GET",
    			success:function(){
    				window.location.href="${pageContext.request.contextPath }/navbar/queryAllNavbar.action";  	
    			}
    		});
    	}
    </script>
</body>

</html>
