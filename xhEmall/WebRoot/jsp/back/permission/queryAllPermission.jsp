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
                        <h5>权限信息</h5>
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
                                	<th class="text-center">管理员ID</th>
                                    <th class="text-center">管理员名称</th>
                                	<th class="text-center">角色ID</th>
                                	<th class="text-center">角色名字</th>
                                	<th class="text-center">角色权限</th>
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${admin_role }" var="item">
							    	<tr>
							    		<td>${item.admin.adminid }</td>
							    		<td>${item.admin.adminname }</td>
							    		<td>${item.role.id }</td>
							    		<td>${item.role.rolename }</td>
							    		<td>${item.role.permission }</td>		    		
							    		<td class="text-center">							    			
							    										    			
							    			<a onclick="btn2(${item.admin.adminid },${item.role.id })" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${item.admin.adminid },${item.role.id })" data-toggle="modal" data-target="#myModel3" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
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
		        <h4 class="modal-title" id="gridSystemModalLabel">添加权限</h4>
		      </div>
		      <div class="modal-body"> 		        
                	<form class="form-horizontal m-t" id="myform1">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">管理员名称：</label>
                                <div class="col-sm-8">
                                     <div class="input-group">
			                                <select id="admin" data-placeholder="选择管理员..." class="chosen-select" style="width:350px;height:28px;" tabindex="2" name="adminid">
			                                	 
			                                </select>
			                        </div>   
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色：</label>
                                <div class="col-sm-8">
                                   	 <div class="input-group">
			                                <select id="role" data-placeholder="选择角色..." class="chosen-select" style="width:350px;height:28px;" tabindex="2" name="roleid">
			                                	 
			                                </select>
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
		        <h4 class="modal-title" id="gridSystemModalLabel">修改权限</h4>
		      </div>
		      <div class="modal-body"> 		        
                	<form class="form-horizontal m-t" id="myform3">
                			<div class="form-group"> 
                                <div class="col-sm-8">                              		                             
			                         <input type="hidden" id="arid" name="id" />			                          			           					
                                </div>
                            </div>
                            <div class="form-group"> 
                                <div class="col-sm-8">                              		                                   		                          
									<input type="hidden" id="adminid" name="adminid">
                       	    	</div>
                            </div>                			
                            <div class="form-group">
                                <label class="col-sm-3 control-label">管理员名称：</label>
                                <div class="col-sm-8">
                                    <input id="adminname" name="adminid" type="text" disabled="" class="form-control">
                                </div>                     
                           </div>
                           
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色：</label>
                                <div class="col-sm-8">
                                   	 <div class="input-group">
			                                <select id="role" name="roleid" data-placeholder="选择角色..." class="chosen-select" style="width:350px;height:28px;" tabindex="2" >
			                                	 
			                                </select>
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
  
    <script>
        $(document).ready(function(){ 
      	 
         $.ajax({
        	url:"${pageContext.request.contextPath}/role/queryAllAdmin.action",
        	type:"GET",
        	success:function(result){
        		$.each(result.extend.admins,function(index,item){
    				 var option=$("<option value='"+item.adminid+"'></option>").append(item.adminname);
    				 option.appendTo(admin);
    			});
        	}
        });	
        
        $.ajax({
        	url:"${pageContext.request.contextPath}/role/queryAllRole.action",
        	type:"GET",
        	success:function(result){
        		console.log(result);
        		$.each(result.extend.roles,function(index,item){
    				 var option=$("<option value='"+item.id+"'></option>").append(item.rolename);
    				 option.appendTo(role);
    			});
        	}
        }); 
        	
        $(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
    </script>
    
 <script type="text/javascript"> 
    	$("#btn_submit").on("click",function(){
    		if(!confirm("您确定要给该管理员添加权限吗？")){
    			return false;
    		}else{
    			var admin_role= new FormData($("#myform1")[0]);
    			$.ajax({
    				url:"${pageContext.request.contextPath}/role/insertRole.action",
    				type:"POST",
    				data:admin_role,
    				contentType: false,  
    			    processData: false, 
    				success:function(result){
    					if(result.code==100){
    						alert("增加成功！");
    						window.location.href="${pageContext.request.contextPath }/role/queryAllRoles.action";
    					}else{
    						alert(""+result.extend.msg+"");
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
 window.location.href="${pageContext.request.contextPath }/role/queryAllRoles.action";  	
});

	/* 点击删除 */
	function btn2(adminid,roleid){
		if(!confirm("您确定要删除该管理员的权限吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/role/deleteRole.action?adminid="+adminid+"&roleid="+roleid,
	 			   type:"delete",
	 			   success:function(result){
	 					  if(result.code==100){
	 						  alert("删除成功！");
	 						 window.location.href="${pageContext.request.contextPath }/role/queryAllRoles.action";
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
	function btn3(adminid,roleid){
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/role/queryAllRoleByAdminId.action?adminid="+adminid+"&roleid="+roleid,
	 			   type:"get",
	 			   success:function(result){
	 					  if(result.code==100){
	 						  console.log(result);
	 						 $("#arid").val(roleid);
	 						 $("#adminid").val(adminid);
	 						 $("#adminname").html(result.extend.ars.admin.adminname);
	 						 $("#role").find("option[='value"+result.extend.ars.role.roleid+"']").attr("selected",true);
	 						 /* $("#role").find("option:selected").text(result.extend.ars.role.rolename); */ 
	 					  } 
	 			   }	 			   
	 		   });
	}
 
   /**
	*点击修改
	*/
	$("#btn_fix").on("click",function(){
		if(!confirm("您确定要修改改管理员的权限吗？")){
			return false;
		}else{
			var role= new FormData($("#myform3")[0]);
			$.ajax({
				url:"${pageContext.request.contextPath}/role/updateRole.action",
				type:"POST",
				data:role,
				contentType: false,  
			    processData: false, 
				success:function(result){
					if(result.code==100){
						alert("修改成功！");
						window.location.href="${pageContext.request.contextPath }/role/queryAllRoles.action";
					}else{
						alert(result.extend.msg);
					}
				}
			});
		}
	});
	
    </script>
</body>

</html>
