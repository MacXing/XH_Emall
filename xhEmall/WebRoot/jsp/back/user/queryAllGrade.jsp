<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员等级列表</title>
    
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
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <base target="_blank">
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
                        <h5>会员等级信息 <small>查找</small></h5>
                        <div class="ibox-tools">
                        	<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a data-toggle="modal" data-target="#myModal">添加等级列表</a>                                
                                </li>
                            </ul>
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>                            
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                	<th>编号</th>
                                    <th>等级名称</th>                                  
                                    <th>等级条件</th>                                  
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data">             
                                <c:forEach items="${allGrade }" varStatus="status" var="grade">
							    	<tr class="gradeX">
							    		<td>${grade.gradeid }</td>							    		
							    		<td>${grade.gradename }</td>							    									    		
							    		<td>${grade.gradecount }</td>							    			 
							    		<td class="text-center">
							    		   <%--  <a onclick="btn1(${grade.gradeid})" data-toggle="modal" data-target="#myModel1" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			&nbsp;&nbsp; --%> 							    			
							    			<a onclick="btn2(${grade.gradeid})" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${grade.gradeid })" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th>编号</th>                                               
                                    <th>等级名称</th>
                                	<th>等级条件</th>                                   
                                    <th>操作</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 模态框（Modal） -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
         <%
        	String message=(String)request.getAttribute("message");
        	if(message==null){
        		message="";
        	}
         %>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加等级列表</h4>
            </div>
            <div class="modal-body">
            	<form id="addgrade" >
            		<label class="col-sm-3 control-label">等级名称：</label>                            	    
                    <div>
                        <input name="gradename" type="text" class="form-control" placeholder="请输入等级名称">
                    </div>                         	    
                    <div>
                    <label class="col-sm-3 control-label">等级条件：</label>
                    <div style="height:150px">
                         <!-- <input type="textarea" name="gradecount"class="form-control" placeholder="请输入等级条件" style="height:100px"> -->
                         <textarea rows="5" cols="74" name="gradecount" data-provide="markdown" class="md-input" style="resize: none; display: block;" placeholder="请输入等级条件"></textarea>
                    </div>
                    </div>               
            	</form>
            </div>
            <font color="red"><%=message %></font>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addgradetolist()">提交添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
  </div>
		
    
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>

	<script>
	/*查询商品详细信息  */
		function btn1(id){
			   $.ajax({
				   url:"${pageContext.request.contextPath }/grade/queryUserGradeByIdForDetail.action?id="+id,
				   type:"GET",
				   success:function(result){
						   console.log(result);
						   build_table(result);
				   }   
			   });
			 }
		
		 function build_table(result){
		 	$("#userid").html(result.userid);
		 	$("#gradeid").html(result.gradeid);
		 	$("#username").html(result.username);
		 	$("#usersex").html(result.usersex);
		 	$("#userbirthday").html(fmtDate(result.userbirthday));
		 	$("#userphone").html(result.userphone);
		 	$("#usermoney").html(result.usermoney);		 	
		 	$("#userintegral").html(result.userintegral);
		 	$("#gradename").html(result.xhgrade.gradename);
		 	$("#gradecount").html(result.xhgrade.gradecount);
		 	
		 	if(result.usersex==1){
		 		$("#usersex").html("男");
		 	}else{
		 		$("#usersex").html("女");
		 	}
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
				if(!confirm("您确定要删除该等级信息记录吗？")){
			 		   return false;
			 	   }else{
			 		   $.ajax({
			 			   url:"${pageContext.request.contextPath }/grade/deleteGradeList.action?id="+id,
			 			   type:"delete",
			 			   success:function(result){
			 					   /* alert("删除成功！"); */
			 					   window.location.href="grade/queryallGrade.action";
			 			   }
			 			   
			 		   });
			 	   }
			}
		 
		 /*点击修改*/
			function btn3(id){
				window.location.href="${pageContext.request.contextPath }/grade/queryByIdForUpdate.action?id="+id; 
			}
		 
		 /*modal框添加*/
		function addgradetolist(){
		var formData = new FormData($("#addgrade")[0]);
		$.ajax({
		cache: true,
		type: "POST",
		data:formData,
		url:"${pageContext.request.contextPath }/grade/addGradeList.action",
		async: false,
		cache: false,  
	    contentType: false,  
	    processData: false,
		success: function(result) {
			  if(result.code==100){	
				    alert("增加成功！");
				    window.location.href="${pageContext.request.contextPath }/grade/queryallGrade.action";
			   }else{
				  alert("增加失败！等级为空或等级已存在！");
				  window.location.href="${pageContext.request.contextPath }/grade/queryallGrade.action";
			   } 		
		}
		});
		}
	</script>
</body>

</html>
