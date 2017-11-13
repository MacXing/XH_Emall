<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>H+ 后台主题UI框架 - 基本表单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resource/css/animate.min.css" rel="stylesheet">
<link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>新增仓库</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="dropdown-toggle" data-toggle="dropdown"
						href="form_basic.html#"> <i class="fa fa-wrench"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="form_basic.html#">选项1</a></li>
						<li><a href="form_basic.html#">选项2</a></li>
					</ul>
					<a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal" id="addform">
					<div class="form-group">
						<label class="col-sm-4 control-label">仓库名：</label>
						<div class="col-md-4">
							<input type="text" id="repname" name="repname" placeholder="请输入仓库名"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">仓库地址：</label>
						<div class="col-md-4">
							<input type="text" id="repaddress" name="repaddress" placeholder="请输入仓库地址"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">负责人电话：</label>
						<div class="col-md-4">
							<input type="text" id="repphone" name="repphone" placeholder="请输入负责人电话"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">仓库负责人：</label>
						<div class="col-md-4">
							<input type="text" id="repadmin" name="repadmin" placeholder="请输入仓库负责人"
								class="form-control">
						</div>
					</div>
					<div class="form-group" align=center>
						<div style="width:300px">
							<button class="btn btn-primary btn-rounded btn-block demo2"
								type="button" id="add">
								<i class="fa fa-check"></i> 确认增加
							</button>
						</div>
					</div>
				</form>				
			</div>
		</div>
	</div>
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/content.min.js?v=1.0.0"></script>
	<script src="resource/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="resource/js/validate.js"></script>
 
	 <script>
	 	 $("#add").click(function (){
		
			var val = new validate({
			
				rules:{
					repname:"notEmpty",   
					repaddress:"notEmpty",
					repphone:"mobile",
					repadmin:"notEmpty", 
					
					
				},
				/*submitFun里面为检验成功后要执行的方法*/
				submitFun:function(){
		$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addRepertory.action",
				type : "POST",
				data : $("#addform").serialize(),
			});
		
			
			 swal({
					title : "添加成功",
					text : "点击ok返回继续添加",
					type : "success"
				},
				function(isConfirm){
					window.location.href="${pageContext.request.contextPath}/jsp/back/warehouse/addhouse.jsp";
				}
			) 
			}	
				
			
			});
	});
	
	</script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			})
		});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

	<!-- <script type="text/javascript">
		$("#add").on("click",function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addRepertory.action",
				type : "POST",
				data : $("#addform").serialize(),
			});
		});
	</script>-->

	<!-- <script>
		$(document).ready(function() {
			$(".demo2").click(function() {
				swal({
					title : "添加成功",
					text : "点击ok返回继续添加",
					type : "success"
				},
				function(isConfirm){
					window.location.href="${pageContext.request.contextPath}/jsp/back/warehouse/addhouse.jsp";
				});
			});					
		});
	</script>  -->

</body>
</html>