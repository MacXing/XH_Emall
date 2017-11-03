<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员积分管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
            <h5>会员积分管理</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="table_data_tables.html#">选项1</a>
                    </li>
                    <li><a href="table_data_tables.html#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <table class="table table-striped table-bordered table-hover dataTables-example" style="text-align:center">
                <thead>
                    <tr>
                        <th class="text-center">会员编号</th>
                        <th class="text-center">会员姓名</th>
                        <th class="text-center">会员电话</th>
                        <th class="text-center">消费总额</th>
                        <th class="text-center">会员积分</th>
                        <th class="text-center">修改积分</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${xhusers }" var="user">
				  		<tr>
					   		<td>${user.userid }</td>
					   		<td>${user.username }</td>
					   		<td>${user.userphone }</td>
					   		<td>${user.usermoney }</td>
					   		<td>${user.userintegral }</td>
					   		<td>					   		
	          				<button class="btn btn-success btn-rounded" onclick="btnalter(${user.userid })"
	          						type="button" data-toggle="modal" data-target="#alterintegral">
	          					<i class="glyphicon glyphicon-plus"></i>
	          					<i class="glyphicon glyphicon-pencil"></i>
	          					<i class="glyphicon glyphicon-minus"></i>	          				
	          				</button>
	              			</td>							    		
						</tr>
					</c:forEach>
                 </tbody>
			</table>                                                   
        </div>
        
        <!-- 修改积分模态框------------------------------------------------------------ -->
        <div class="modal inmodal" id="alterintegral" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">
             	<span aria-hidden="true">×</span>
             	<span class="sr-only">关闭</span>
             </button>
             <!-- <i class="fa fa-laptop modal-icon"></i> -->
             <h4 class="modal-title">积分操作</h4>
             <br>
             <center>
             <table class="table table-bordered text-center">
             <thead>
             	<tr>
             		<th class="text-center">会员编号</th>
             		<th class="text-center">会员姓名</th>
             		<th class="text-center">现有积分</th>
             	</tr>
             </thead>
             <tbody>
     			<tr>
     				<td><span id="idal"></span></td>
     				<td><span id="nameal"></span></td>
             		<td><span id="integralal"></span></td>
     			</tr>
     		</tbody>
             </table> 	                
             </center>                                   
         </div>
            <form id="alterform">
            <small class="font-bold">                                    
                <div class="modal-body">                                      	
                	<div class="form-group">                                        	                                        	                                  
                		<input type="hidden" name="userid" id="useridal" value="">
                		<input type="text" name="userintegral" placeholder="请输入积分并在以下按钮选择需要的操作" class="form-control">                                        	
                	</div>                                        	
                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button> -->
                    <!-- 增加按钮 --> 
                    <button class="btn btn-primary btn-circle" type="button" id="add">
                    <i class="glyphicon glyphicon-plus"></i>
                    </button>
                    <!-- 减少按钮 --> 
                    <button class="btn btn-danger btn-circle" type="button" id="cut">
                    <i class="glyphicon glyphicon-minus"></i>
                    </button>  
                    <!-- 修改按钮 -->                                        
                    <button class="btn btn-warning btn-circle" type="button" id="alter">
                    <i class="glyphicon glyphicon-pencil"></i>
                    </button>
                </div>                                    
            </small>
            </form>                                    
        </div>
       	<small class="font-bold"></small>
        </div>
        <small class="font-bold"></small>
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
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    
	<!-- 在模态框中显示信息------------------------------------------------------------ -->
	<script type="text/javascript">
		function btnalter(userid){		
			$.ajax({
				url:"${pageContext.request.contextPath}/sales/queryUserById.action?userid="+userid,
				type:"GET",
				success:function(result){
					$("#useridal").attr("value", result.userid);	
					$("#idal").html(result.userid);		
					$("#nameal").html(result.username);						
					$("#integralal").html(result.userintegral);			
				}			
			});	
		}	
	</script>
	
	<!-- 将模态框中输入的数据提交并返回（修改）------------------------------------------------------------ -->
	<script type="text/javascript"> 		
		$("#alter").on("click",function(){
		//function alter(){
			//console.log(654);
			$.ajax({					
			   url:"${pageContext.request.contextPath}/sales/updateIntegral.action",
			   type:"POST",				   
			   //data : JSON.stringify($("#alterform").serializeObject()),
			   data:$("#alterform").serialize(),
			   //contentType:"application/json",
			   success:function(result){
				   window.location.href="${pageContext.request.contextPath}/sales/queryUsersIntegral.action";
			   }
			});
			//console.log(65465465465);			
		});		
	</script>
	
	<!-- 将模态框中输入的数据提交并返回（增加）------------------------------------------------------------ -->
	<script type="text/javascript"> 		
		$("#add").on("click",function(){
			$.ajax({					
			   url:"${pageContext.request.contextPath}/sales/addUserIntegral.action",
			   type:"POST",				   
			   //data : JSON.stringify($("#alterform").serializeObject()),
			   data:$("#alterform").serialize(),
			   //contentType:"application/json",
			   success:function(result){
				   window.location.href="${pageContext.request.contextPath}/sales/queryUsersIntegral.action";
			   }
			});
			//console.log(65465465465);			
		});		
	</script>
	
	<!-- 将模态框中输入的数据提交并返回（减少）------------------------------------------------------------ -->
	<script type="text/javascript">
		$("#cut").on("click",function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/sales/cutUserIntegral.action",
				type:"POST",
				data:$("#alterform").serialize(),
				success:function(result){
					window.location.href="${pageContext.request.contextPath}/sales/queryUsersIntegral.action";
				}
			});
		});
	</script>
	
</body>

</html>