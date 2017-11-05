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
    <link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>分类信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a data-toggle="modal" data-target="#myModel1" id="addCategory" class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
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
                                    <th class="text-center">上级类名</th>
                                	<th class="text-center">分类名字</th>
                                	<th class="text-center">分类描述</th>
                                	<th class="text-center">是否展示</th>
                                	<th class="text-center">分类等级</th>
                                	<th class="text-center">分类排序</th>
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${categoryList }" var="item" >
	                             	 	                          
	                             			<tr>
									    		<td>${item.catid }</td>
									    		<td>${item.category.catname }</td>
									    		<td>${item.catname }</td>						   		
									    		<td>${item.catdesc }</td>
									    		<td>${item.isshow }</td>
									    		<td>${item.catgrade }</td>
									    		<td>${item.sortorder }</td>		    		
									    		<td class="text-center">							    										    			
									    			<a onclick="btn2(${item.catid  })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
									    			&nbsp;&nbsp;
									    			<a onclick="btn3(${item.catid  })" data-toggle="modal" data-target="#myModel3" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
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
		        <h4 class="modal-title" id="gridSystemModalLabel">添加分类信息</h4>
		      </div>
		      <div class="modal-body"> 		        
                	<form class="form-horizontal m-t" id="myform1" method="post" action="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类名称：</label>
                                <div class="col-sm-8">
                                    <input id="catname1" name="catname" minlength="2" type="text" class="form-control">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">上级分类名称：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="parentid" id="categorySelect">
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类描述：</label>
                                <div class="col-sm-8">
                                    <textarea id="catdesc1" name="catdesc" class="form-control" ></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类展示：</label>
                                <div class="col-sm-8">	                            
		                                    <div class="radio i-checks">
		                                        <label>
		                                            <input type="radio" name="isshow" value=0> <i></i>不展示</label>
		                                        <label>
		                                            <input type="radio" checked="" name="isshow" value=1> <i></i> 展示（选中）</label>
		                                    </div>	              
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
		 模态框三
		 -->
		 <div class="modal fade" id="myModel3" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">修改分类信息</h4>
		      </div>
		      <div class="modal-body"> 		        
                	<form class="form-horizontal m-t" id="myform3" method="post" action="">
                			<div class="form-group">
                                <label class="col-sm-3 control-label">ID：</label>
                                <div class="col-sm-8">
                                    <input id="catid3" name="catid" minlength="2" type="text" class="form-control">
                                </div>
                            </div>
                			
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类名称：</label>
                                <div class="col-sm-8">
                                    <input id="catname3" name="catname" minlength="2" type="text" class="form-control">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">上级分类名称：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="parentid" id="categorySelect">
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类描述：</label>
                                <div class="col-sm-8">
                                    <textarea id="catdesc3" name="catdesc" class="form-control" ></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分类展示：</label>
                                <div class="col-sm-8">	                            
		                                    <div class="radio i-checks">
		                                        <label>
		                                            <input type="radio" checkend="" name="isshow" value=0> <i></i>不展示</label>
		                                        <label>
		                                            <input type="radio" checked="" name="isshow" value=1> <i></i> 展示（选中）</label>
		                                    </div>	              
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>		       
		         					<button type="button" class="btn btn-primary" id="btn_fix">Save</button>
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
    <script src="resource/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
        		
        $(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
       	$(".i-checks").iCheck({
        		checkboxClass:"icheckbox_square-green",
        		radioClass:"iradio_square-green",
        		});
       	
       	
       	$.ajax({
			url:"${pageContext.request.contextPath}/category/queryAllCategoryForJson.action",
			type:"GET",
			success:function(result){
				if(result.code==100){
					console.log(result.extend.categoryList);
					$.each(result.extend.categoryList,function(index,item){					
								var option=$("<option value='"+item.catid+"'></option>").append(item.catname);
								option.appendTo(categorySelect);
					});  
				}
			}
		});
        		
    </script>
    
<script type="text/javascript">
	/**
	*点击添加分类按钮请请求分类信息并加载到select的option中
	**/
	$("#addCategory").on("click",function(){
		
	});

    $("#btn_submit").on("click",function(){
    	if(!confirm("您确定要添加分类信息吗？")){
    		return false;
   		}else{
   			var form = $("#myform1").serialize();
   			console.log(form);
   			$.ajax({
   				url:"${pageContext.request.contextPath}/category/insertCategory.action",
   				type:"post",
   				data:form,   		
   				success:function(result){
   					if(result.code==100){
   						alert("增加成功！");
   						window.location.href="${pageContext.request.contextPath}/category/queryAllCategory.action";
   					}else{
   						alert("增加失败！");
   					}
   				}
   			});
   			
    		}
    	});
</script>
    
    <!-- 
    	单选删除按钮
     -->
<script type="text/javascript">
/*
刷新按钮
*/
$("#flash").on("click",function(){
 window.location.href="${pageContext.request.contextPath }/category/queryAllCategory.action";  	
});

	/* 点击删除 */
	function btn2(id){
		if(!confirm("您确定要删除这个分类信息吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/category/deleteCategory.action?id="+id,
	 			   type:"delete",
	 			   success:function(result){
	 					  if(result.code==100){
	 						  alert("删除成功！");
	 						  window.location.href="${pageContext.request.contextPath }/category/queryAllCategory.action"; 
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
	 			   url:"${pageContext.request.contextPath }/category/queryCategoryById.action?id="+id,
	 			   type:"get",
	 			   success:function(result){
	 					  if(result.code==100){
	 						 $("#catid3").val(result.extend.category.catid);
							 $("#catname3").val(result.extend.category.catname);
							 $("#catdesc3").val(result.extend.category.catdesc);
							 $("#isshow3").val(result.extend.category.isshow);
							 $("#categorySelect").find("option:selected").val(result.extend.category.parentid);
	 					  } 
	 			   }	 			   
	 		   });
	}
 
   /**
	*点击修改
	*/
	$("#btn_fix").on("click",function(){
		if(!confirm("您确定要修改分类信息吗？")){
			return false;
		}else{
			var brand= new FormData($("#myform3")[0]);
			$.ajax({
				url:"${pageContext.request.contextPath}/category/updateCategory.action",
				type:"POST",
				data:brand,
				contentType: false,  
			    processData: false, 
				success:function(result){
					if(result.code==100){
						alert("修改成功！");
						window.location.href="${pageContext.request.contextPath }/category/updateCategory.action";
					}else{
						alert("修改失败！");
					}
				}
			});
		}
	});
	
    </script>
</body>

</html>
