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
    
    <title>商品管理</title>
    
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
                        <h5>商品信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a id="addProduct">添加商品</a>
                               
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                	<th>ID</th>
                                    <th>名称</th>
                                   <!--  <th>点击数</th>
                                    <th>描述</th> -->
                                    <th>定价</th>
                                    <th>售价</th>
                                   <!--  <th>图片</th>
                                    <th>详细图片</th> -->
                                   <!--  <th>添加时间</th>
                                    <th>修改时间</th>  -->
                                    <th>品牌</th>                           
                                    <th>大小</th>
                                    <th>单位</th>
                                    <th>折扣</th>
                                	<th>是否积分商品</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data">             
                             <c:forEach items="${products }" var="product">
							    	<tr>
							    		<td>${product.pid }</td>
							    		<td>${product.pname }</td>
							    		<%-- <td>${product.pclick }</td>
							    		<td>${product.pdesc }</td> --%>
							    		<td>${product.pprice }</td>
							    		<td>${product.psale }</td>
							    		<%-- <td>${product.pimg }</td>
							    		<td>${product.pimgdetail }</td> --%>
							    		<%-- <td><fmt:formatDate value="${product.paddtime }" type="date"/></td> 
							    		<td><fmt:formatDate value="${product.pupdatetime }" type="date"/></td> --%>
							    		<td>${product.brandid }</td>
							    		<td>${product.psize }</td>
							    		<td>${product.punit }</td>
							    		<td>${product.pdiscount }</td>
							    		<td>${product.pIntegral }</td>	
							    		<td class="text-center">
							    			
							    			<a onclick="btn1(${product.pid })" data-toggle="modal" data-target="#myModel1" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			&nbsp;&nbsp; 							    			
							    			<a onclick="btn2(${product.pid })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${product.pid })" data-toggle="modal" data-target="#myModel2"><span class="glyphicon glyphicon-pencil"></span></a>
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
    
    <%--隐藏窗口 --%>
		<div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">查看商品信息</h4>
		      </div>
		      <div class="modal-body"> 
		        
		        <div class="ibox-content">

                        <table class="table table-bordered" >	                           
                            <tbody id="mytable">
                                <tr>
                                    <td>ID</td>
                                    <td id="pid"></td>
                                    <td>添加时间</td>
                                    <td id="paddtime"></td>
                                </tr>
                                <tr>
                                    <td>商品名</td>
                                    <td id="pname"></td>
                                    <td>更新时间</td>
                                    <td id="pupdatetime"></td>
                                </tr>
                                <tr>
                                    <td>描述</td>
                                    <td id="pdesc"></td>
                                    <td>品牌</td>
                                    <td id="brandname"></td>
                                </tr>
                                 <tr>
                                    <td>定价</td>
                                    <td id="pprice"></td>
                                    <td>大小</td>
                                    <td id="psize"></td>
                                </tr>
                                 <tr>
                                    <td>售价</td>
                                    <td id="psale"></td>
                                    <td>单位</td>
                                    <td id="punit"></td>
                                </tr>
                                 <tr>
                                    <td>图片</td>
                                    <td id="pimg"></td>
                                    <td>是否打折</td>
                                    <td id="pdiscount"></td>
                                </tr>
                                 <tr>
                                    <td>图片详细</td>
                                    <td id="pimgdetail"></td>
                                    <td>是否积分</td>
                                    <td id="pintegral"></td>
                                </tr>   
                            </tbody>
                        </table>
                    </div>
		      </div>
		      <div class="modal-footer">		       
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    
    
    							<%-- <tr>
							    		<td>${product.pid }</td>
							    		<td>${product.pname }</td>
							    		<td>${product.pclick }</td>
							    		<td>${product.pdesc }</td>
							    		<td>${product.pprice }</td>
							    		<td>${product.psale }</td>
							    		<td>${product.pimg }</td>
							    		<td>${product.pimgdetail }</td>
							    		<td>${product.paddtime }</td>
							    		<td>${product.pupdatetime }</td>
							    		<td>${product.brandid }</td>
							    		<td>${product.psize }</td>
							    		<td>${product.punit }</td>
							    		<td>${product.pdiscount }</td>
							    		<td>${product.pIntegral }</td>	
							    		<td class="text-center"> 							    			
							    			<a myAttr="del_btn" style="color:#000"><span class="glyphicon glyphicon-trash del_btn"></span></a>
							    			&nbsp;&nbsp;
							    			<a data-toggle="modal" data-target="#myModel2"><span class="glyphicon glyphicon-pencil" ></span></a>
							    		</td> 						    									    									    		
							    	  </tr> 
							    	  
							    
							    	    
							    	  --%>
							    	  
	<!-- 						    	
     <script type="text/javascript">
	  function build_table(result){
		  $.each(result,function(index,item){
			  $("<tr></tr>").append($("<td></td>").append(item.pid)).appendTo($("#mytable"));
		  });
	  }
    </script>  -->
    
    
    <script>
        $(document).ready(function(){       	
        	$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>
    
    <!-- 
    	单选删除按钮
     -->
    <script type="text/javascript">
   /*  $("#").on("click",".del_btn",function(){
 	   var id=$(this).parents("tr").find("td:eq(0)").text();
 	   var name=$(this).parents("tr").find("td:eq(1)").text();
 	   if(!confirm("您确定要删除【"+name+"】商品的报名记录吗？")){
 		   return false;
 	   }else{
 		   $.ajax({
 			   url:"${pageContext.request.contextPath }/product/delectProduct.action?id="+id,
 			   type:"delete",
 			   success:function(result){
 					   /* alert("删除成功！");
 					   window.location.href="product/queryAllProducts.action";
 			   }
 			   
 		   });
 	   }
    }); */
    /* 查看单个商品信息 */
    
   function btn1(id){
  		   $.ajax({
  			   url:"${pageContext.request.contextPath }/product/queryProductById.action?id="+id,
  			   type:"GET",
  			   success:function(result){
  					   console.log(result);
  					   build_table(result);
  			   }   
  		   });
    }
    function build_table(result){
    	$("#pid").html(result.pid);
    	$("#brandid").html(result.brandid);
    	$("#pname").html(result.pname);
    	$("#pclick").html(result.pclick);
    	$("#pdesc").html(result.pdesc);
    	$("#pprice").html(result.pprice);
    	$("#pdesc").html(result.pdesc);
    	$("#psale").html(result.psale);
    	$("#pimg").html(result.pimg);
    	$("#pimgdetail").html(result.pimgdetail);
    	$("#paddtime").html(fmtDate(result.paddtime));
    	$("#pupdatetime").html(fmtDate(result.pupdatetime));
    	$("#psize").html(result.psize);
    	$("#punit").html(result.punit);
    	$("#pdiscount").html(result.pdiscount);
    	
    	if(result.pIntegral==1){
    		$("#pintegral").html("是");
    	}else{
    		$("#pintegral").html("否");
    	}
    	
    	$("#brandname").html(result.brand.brandname);
    }
    
 
    /* 时间格式转换 */
    function fmtDate(obj){
	    var date =  new Date(obj);
	    var y = 1900+date.getYear();
	    var m = "0"+(date.getMonth()+1);
	    var d = "0"+date.getDate();
	    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
	} 
    
	/* 点击删除 */
	function btn2(id){
		if(!confirm("您确定要删除商品的报名记录吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/product/delectProduct.action?id="+id,
	 			   type:"delete",
	 			   success:function(result){
	 					   /* alert("删除成功！"); */
	 					   window.location.href="product/queryAllProducts.action";
	 			   }
	 			   
	 		   });
	 	   }
	}
	
	/**
	*点击修改
	*/
		
	/**
	*点击跳转到增加页面
	*/
     $("#addProduct").on("click", function(){
    	$.ajax({
    		url:"${pageContext.request.contextPath }/brand/queryAllBrands.action",
    		type:"GET",
    		success:function(){
    			window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
    		}
    	});
    	
    }); 
    
    
    </script>
</body>

</html>
