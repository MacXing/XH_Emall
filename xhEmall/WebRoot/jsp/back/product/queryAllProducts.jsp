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
                            <thead >
                                <tr>
                                	<th class="text-center">ID</th>
                                    <th class="text-center">名称</th>
                               		<th class="text-center">图片</th>
                                    <th class="text-center">定价</th>
                                    <th class="text-center">售价</th>                           
                                    <th class="text-center">品牌</th>                           
                                    <th class="text-center">大小</th>
                                    <th class="text-center">单位</th>
                                    <th class="text-center">折扣</th>
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${products }" var="product">
							    	<tr>
							    		<td>${product.pid }</td>
							    		<td>${product.pname }</td>
							    		<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath }/upload/${product.pimg}" title="">
					                            <img style="width:100px;height:80px"; src="${pageContext.request.contextPath }/upload/${product.pimg}" />
					                        </a>
							    		</td>							    	
							    		<td>${product.pprice }</td>
							    		<td>${product.psale }</td>
							    		<td>${product.brand.brandname }</td>
							    		<td>${product.psize }</td>
							    		<td>${product.punit }</td>
							    		<td>${product.pdiscount }</td>
							    		
							    		<td class="text-center">
							    			
							    			<a onclick="btn1(${product.pid })" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			&nbsp;&nbsp; 							    			
							    			<a onclick="btn2(${product.pid })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${product.pid })"><span class="glyphicon glyphicon-pencil"></span></a>
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
    /* 查看单个商品信息 */
    
   function btn1(id){
    	
	   window.location.href="${pageContext.request.contextPath }/jsp/back/product/productInfo.jsp?id="+id;
  		  
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
	
	function btn3(id){ 		  
	 		window.location.href="${pageContext.request.contextPath }/jsp/back/product/updateProduct.jsp?id="+id;	   	 			 
	}	
	/**
	*点击跳转到增加页面
	*/
   $("#addProduct").on("click", function(){
    	/*  $.ajax({
    		url:"${pageContext.request.contextPath }/brand/queryAllBrands.action",
    		type:"GET",
    		success:function(){
    			window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
    		}
    	});  */
	   window.location.href="${pageContext.request.contextPath }/jsp/back/product/addProduct.jsp";
    }); 
    
    
    </script>
</body>

</html>
