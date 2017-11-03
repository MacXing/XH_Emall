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
    
    <title>会员留言</title>
    
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
                        <h5>会员留言<small>查找</small></h5>
                        <div class="ibox-tools">
                        	<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a id="messagelist">会员留言列表</a>                                
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
                                    <th>姓名</th>                                  
                                    <th>留言时间</th>                                  
                                    <th>留言内容</th>                               	
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data">             
                                <c:forEach items="${message }" varStatus="status" var="message">
							    	<tr class="gradeX">
							    		<td>${message.users.userid }</td>
							    		<%-- <td>${message.msgid }</td>	 --%>						    		
							    		<td>${message.users.username }</td>							    									    							    		
							    		<td><fmt:formatDate value="${message.msginittime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							    		<td>${message.msgtxt }</td>							    			 
							    		<td class="text-center">
							    		    <a onclick="btn1(${message.users.userid})" data-toggle="modal" data-target="#myModel1" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			<%-- &nbsp;&nbsp; 							    			
							    			<a onclick="btn3(${user.userid })" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a> --%>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>                               	
                                	<th>编号</th>
                                    <th>姓名</th>                                  
                                    <th>留言时间</th>                                  
                                    <th>留言内容</th>                               	
                                    <th>操作</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">查看详细信息</h4>
		      </div>
		      <div class="modal-body"> 
		        
		        <div class="ibox-content">
			
                        <table class="table table-bordered">	                           
                            <tbody id="mytable">                    
                                <tr>
                                    <td>会员编号</td>
                                    <td id="userid"></td>
                                </tr>
                                <tr>
                                    <td>姓名</td>
                                    <td id="username"></td>
                                </tr>           
                                <tr>
                                	<td>留言时间</td>
                                    <td id="msginittime"></td>
                                 </tr>
      							<tr>
      								<td>留言内容</td>
                                    <td id="msgtxt" style="height:100px"></td>
      							</tr>
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
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("message.msgid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>

	<script>
	/*查询留言会员详细信息  */
		function btn1(id){
			   $.ajax({
				   url:"${pageContext.request.contextPath }/message/queryUsermessageByIdForDetail.action?id="+id,
				   type:"GET",
				   success:function(result){
						   console.log(result);
						   build_table(result);
				   }   
			   });
			 }
		
		 function build_table(result){
		 	$("#userid").html(result.users.userid);
		 	$("#username").html(result.users.username);
		 	$("#msginittime").html(fmtDate(result.msginittime));
		 	$("#msgtxt").html(result.msgtxt);
		 }
		  	
		 /* 时间格式转换 */
		 function fmtDate(obj){
			    var date =  new Date(obj);
			    var y = 1900+date.getYear();
			    var m = "0"+(date.getMonth()+1);
			    var d = "0"+date.getDate();
			    var h = "0"+date.getHours();
			    var f = "0"+date.getMinutes();
			    var s = "0"+date.getSeconds();
			    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length)
			    +" "+h.substring(h.length-2,h.length)+":"+f.substring(f.length-2,f.length)+":"+s.substring(s.length-2,s.length);
			} 
		 
		 /* 点击删除 */
			function btn2(id){
				if(!confirm("您确定要删除该会员的信息记录吗？")){
			 		   return false;
			 	   }else{
			 		   $.ajax({
			 			   url:"${pageContext.request.contextPath }/?id="+id,
			 			   type:"delete",
			 			   success:function(result){
			 					   /* alert("删除成功！"); */
			 					   window.location.href="";
			 			   }
			 			   
			 		   });
			 	   }
			}
		 
		 /*点击修改*/
			function btn3(id){
				window.location.href="${pageContext.request.contextPath }/?id="+id; 
			}
		 
		 /*点击添加*/
		 $("#messagelist").on("click", function(){
			 window.location.href="${pageContext.request.contextPath }/message/queryAllMessage.action";		    	
		    });
		 
	</script>
</body>

</html>
