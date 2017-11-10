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
    
    <title>品牌管理</title>
    
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

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>品牌信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a data-toggle="modal" data-target="#myModel1" id="addBrand" class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
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
                                	<th class="text-center">ID</th>
                                    <th class="text-center">品牌名称</th>
                               		
                                	<th class="text-center">品牌描述</th>
                                
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${brands }" var="brand">
							    	<tr>
							    		<td>${brand.brandid }</td>
							    		<td>${brand.brandname }</td>
							    		<td>${brand.branddesc }</td>		    		
							    		<td class="text-center">							    			
							    			<a onclick="btn1(${brand.brandid })" data-toggle="modal" data-target="#myModel2" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			&nbsp;&nbsp; 							    			
							    			<a onclick="btn2(${brand.brandid })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${brand.brandid })" data-toggle="modal" data-target="#myModel3" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
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
   
    
    
    <%--隐藏窗口 1--%>
			
	<div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">添加品牌信息</h4>
		      </div>
		      <div class="modal-body"> 		        
                	<form class="form-horizontal m-t" id="myform1">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">品牌名11：</label>
                                <div class="col-sm-8">
                                    <input id="brandname1" name="brandname" minlength="2" type="text" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">描述11：</label>
                                <div class="col-sm-8">
                                    <textarea id="branddesc1" name="branddesc" class="form-control" datatype="s" required="" aria-required="true"></textarea>
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>		       
		         					<button type="button" class="btn btn-primary" id="btn_submit">Save</button>
                                </div>
                            </div>                     
                        </form>          
		      </div>
		    </div>
		  </div>
		</div>
		
		<!--
		 模态框二
		 -->
		
	<div class="modal fade" id="myModel2" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">查看品牌信息</h4>
		      </div>
		      <div class="modal-body"> 		        
		       	 <div class="ibox-content">

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>品牌名</th>
                                    <th>品牌描述</th>                                 
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="brand1"></td>
                                    <td id="brand2"></td>
                                    <td id="brand3"></td>                                   
                                </tr>
                               
                              
                            </tbody>
                        </table>
					<div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		
				    </div>
                    </div>
		      </div>
		 
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<!--
		 模态框三
		 -->
		 
		<div class="modal fade" id="myModel3" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">修改品牌信息</h4>
		      </div>
		      <div class="modal-body"> 		        
		      
                	<form class="form-horizontal m-t" id="myform3">
                	 		<div class="form-group">                          
                                <div class="col-sm-8">
                                    <input id="brandid3" name="brandid"  type="hidden" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">品牌名：</label>
                                <div class="col-sm-8">
                                    <input id="brandname3" name="brandname"  type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">描述：</label>
                                <div class="col-sm-8">
                                    <textarea id="branddesc3" name="branddesc" class="form-control"></textarea>
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>		       
		         					<button type="button" class="btn btn-primary" id="btn_fix">修改</button>
                                </div>
                            </div>                     
                        </form>          
		      </div>
		    </div>
		  </div>
		</div>
		
		
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="resource/js/plugins/validate/messages_zh.min.js"></script>
    <script type="text/javascript" src="resource/js/validate.js"></script>
	<script type="text/javascript">
		$("#btn_submit")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											brandname1 : "notEmpty",
											branddesc1 : "notEmpty",
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun : function(){
    		if(!confirm("您确定要添加品牌信息吗？")){
    			return false;
    		}else{
    			var brand= new FormData($("#myform1")[0]);
    			$.ajax({
    				url:"${pageContext.request.contextPath}/brand/insertBrand.action",
    				type:"POST",
    				data:brand,
    				contentType: false,  
    			    processData: false, 
    				success:function(result){
    					if(result.code==100){
    						alert("增加成功！");
    						window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
    					}else{
    						alert("增加失败！");
    					}
    				}
    			});
    		}
    	}
    	});
    	});
	</script>
	
	<script type="text/javascript">
		$("#btn_fix")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											brandname3 : "notEmpty",
											branddesc3 : "notEmpty",
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun : function(){
    		if(!confirm("您确定要修改品牌信息吗？")){
			return false;
		}else{
			var brand= new FormData($("#myform3")[0]);
			$.ajax({
				url:"${pageContext.request.contextPath}/brand/updateBrand.action",
				type:"POST",
				data:brand,
				contentType: false,  
			    processData: false, 
				success:function(result){
					if(result.code==100){
						alert("修改成功！");
						window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
					}else{
						alert("修改失败！");
					}
				}
			});
			}
			}
    	});
    	});
	</script>
	
    <script>
        $(document).ready(function(){ 
      	$("#myform").validate(); 
        $(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
    </script>
    
<!-- <script type="text/javascript">
    	$("#btn_submit").on("click",function(){
    		if(!confirm("您确定要添加品牌信息吗？")){
    			return false;
    		}else{
    			var brand= new FormData($("#myform1")[0]);
    			$.ajax({
    				url:"${pageContext.request.contextPath}/brand/insertBrand.action",
    				type:"POST",
    				data:brand,
    				contentType: false,  
    			    processData: false, 
    				success:function(result){
    					if(result.code==100){
    						alert("增加成功！");
    						window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
    					}else{
    						alert("增加失败！");
    					}
    				}
    			});
    		}
    	});
</script> -->
    
    <!-- 
    	单选删除按钮
     -->
<script type="text/javascript">
/*
刷新按钮
*/
$("#flash").on("click",function(){
 window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";  	
});


    /* 查看单个商品信息 */
    
   function btn1(id){
    	
	   $.ajax({
			   url:"${pageContext.request.contextPath }/brand/queryBrandById.action?id="+id,
			   type:"get",
			   success:function(result){
					  if(result.code==100){
						 $("#brand2").html(result.extend.brand.brandname);
						 $("#brand3").html(result.extend.brand.branddesc);
					     $("#brand1").html(result.extend.brand.brandid);				 
					  } 
			   }	 			   
		   });
  		  
    }

	/* 点击删除 */
	function btn2(id){
		if(!confirm("您确定要删除品牌信息吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/brand/deleteBrand.action?id="+id,
	 			   type:"delete",
	 			   success:function(result){
	 					  if(result.code==100){
	 						  alert("删除成功！");
	 						 window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
	 					  }else{
	 						  alert("删除失败！");
	 					  }	   
	 			   }	 			   
	 		   });
	 	   }
	}
	
	/**
	*点击修改
	*/
	function btn3(id){

	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/brand/queryBrandById.action?id="+id,
	 			   type:"get",
	 			   success:function(result){
	 					  if(result.code==100){
	 						 $("#brandname3").val(result.extend.brand.brandname);
							 $("#branddesc3").val(result.extend.brand.branddesc);
							 $("#brandid3").val(result.extend.brand.brandid);	 
	 					  } 
	 			   }	 			   
	 		   });
	}
 
   /**
	*点击修改
	*/
	/* $("#btn_fix").on("click",function(){
		if(!confirm("您确定要修改品牌信息吗？")){
			return false;
		}else{
			var brand= new FormData($("#myform3")[0]);
			$.ajax({
				url:"${pageContext.request.contextPath}/brand/updateBrand.action",
				type:"POST",
				data:brand,
				contentType: false,  
			    processData: false, 
				success:function(result){
					if(result.code==100){
						alert("修改成功！");
						window.location.href="${pageContext.request.contextPath }/brand/queryAllBrands.action";
					}else{
						alert("修改失败！");
					}
				}
			});
		}
	}); */
	
    </script>
</body>

</html>
