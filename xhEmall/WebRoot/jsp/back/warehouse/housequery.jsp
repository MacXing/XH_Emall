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
    
    <title>仓库管理</title>
    
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
    <link href="resource/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
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
            <h5>仓库管理</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a id="refresh">
           			<i class="fa fa-refresh"></i>
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
                </a><table class="table table-striped table-bordered table-hover dataTables-example text-center">
                <thead>
                    <tr>
                        <th class="text-center">仓库编号</th>
                        <th class="text-center">仓库名称</th>
                        <th class="text-center">仓库地址</th>
                        <th class="text-center">仓库负责人</th>
                        <th class="text-center">负责人电话</th>
                        <th class="text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${xhrepertories }" var="repertory">
	                <tr>
	                	<td>${repertory.repid }</td>
	                	<td>${repertory.repname }</td>
	                	<td>${repertory.repaddress }</td>
	                	<td>${repertory.repadmin }</td>
	                	<td>${repertory.repphone }</td>
	                	<td><button class="btn btn-success btn-circle" onclick="alter(${repertory.repid })" type="button" data-toggle="modal" data-target="#alterintegral">
                    		<i class="glyphicon glyphicon-pencil"></i>
                    		</button>
                    		<button class="btn btn-danger btn-circle" onclick="deletebtn(${repertory.repid })" type="button" id="delete">
                   			<i class="glyphicon glyphicon-trash"></i>
                   			</button>
                    	</td>
	                </tr>                	
                </c:forEach>
                </tbody>                         
            </table>
            </div>
        </div>
        <div class="ibox-content">
            
        </div>
        
        <!-- 修改信息模态框 -->
        <div class="modal inmodal" id="alterintegral" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content animated bounceInRight col-sm-16">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">
	            	<span aria-hidden="true">×</span>
	            	<span class="sr-only">关闭</span>
	            </button>
	            <!-- <i class="fa fa-laptop modal-icon"></i> -->
	            <h4 class="modal-title">修改仓库信息</h4>                                                         
	        </div>	        
	        <!-- <small class="font-bold"> --> 
	        <form class="form-horizontal" id="alterform">                                   
            <div class="modal-body">
            	<input type="hidden" name="repid" id="id" value="">                                      	 				
				<div class="form-group">
					<label class=" control-label">仓库名：</label>						
					<input type="text" name="repname"
						   id="name" class="form-control" value="">						
				</div>
				<div class="form-group">
					<label class=" control-label">仓库地址：</label>						
					<input type="text" name="repaddress"
						   id="address" class="form-control" value="">						
				</div>
				<div class="form-group">
					<label class=" control-label">负责人电话：</label>						
					<input type="text" name="repphone"
						   id="phone" class="form-control" value="">						
				</div>
				<div class="form-group">
					<label class=" control-label">仓库负责人：</label>						
					<input type="text" name="repadmin"
						   id="admin" class="form-control" value="">						
				</div>									                                       	
            </div>
            <div class="modal-footer">
            	<div class="form-group" align=center>
				<div style="width:300px">
					<button class="btn btn-primary btn-rounded btn-block demo2"
						type="button" id="alter">
					<i class="fa fa-check"></i> 确认修改
					</button>
				</div>
				</div>    
            </div>                                    	       
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
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="resource/js/validate.js"></script>
 
	 <script>
	 	 $("#alter").click(function (){
		
			var val = new validate({
			
				rules:{
					name:"notEmpty",   
					address:"notEmpty",
					phone:"mobile",
					admin:"notEmpty", 	
				},
				/*submitFun里面为检验成功后要执行的方法*/
				submitFun:function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/updateRepertory.action",
				type : "POST",
				data : $("#alterform").serialize(),
				success:function(result){
					window.location.href="${pageContext.request.contextPath}/repertory/queryAllRepertory.action";
				}
			});			
			}
	});
	});
	
	</script>
    
    
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	
	<!-- 刷新页面 -->
	<script type="text/javascript">
		$("#refresh").on("click",function(){
			window.location.href="${pageContext.request.contextPath}/repertory/queryAllRepertory.action";
		});
	</script>
	
	<!-- 将信息传给修改模态框 -->
	<script type="text/javascript">
		function alter(repid){
			$.ajax({
				url:"${pageContext.request.contextPath}/repertory/queryRepertoryById.action?repid="+repid,
				type:"GET",				
				success:function(result){
					$("#id").attr("value",repid);
					$("#name").val(result.repname);	
					$("#address").val(result.repaddress);		
					$("#phone").val(result.repphone);						
					$("#admin").val(result.repadmin);			
				}
			});
		}
	</script>
	
	<!-- 修改信息 -->
	<!-- <script type="text/javascript">
		$("#alter").on("click",function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/updateRepertory.action",
				type : "POST",
				data : $("#alterform").serialize(),
				success:function(result){
					window.location.href="${pageContext.request.contextPath}/repertory/queryAllRepertory.action";
				}
			});
		});
	</script> -->
	
	<!-- 删除操作 -->
	<script type="text/javascript">
		function deletebtn(repid){			
				swal({
					title : "您确定要删除这条信息吗",
					text : "删除后将无法恢复，请谨慎操作！",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "是的，我要删除！",
					cancelButtonText : "让我再考虑一下…",
					closeOnConfirm : false,
					closeOnCancel : false
				}, function(isConfirm) {
					if (isConfirm) {
						$.ajax({
							url:"${pageContext.request.contextPath}/repertory/deleteRepertory.action?repid="+repid,
							type:"GET",
						});
						swal({title : "删除成功！", 
							  text : "您已经永久删除了这条信息。",
							  type : "success"},
							  function(){
							      self.location.reload();
							  }
						);						
					}else {
						swal("已取消", "您取消了删除操作！", "error")
					}
				})
			}
	</script>
	
</body>

</html>
