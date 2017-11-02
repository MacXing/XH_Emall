<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>H+ 后台主题UI框架 - 数据表格</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<link href="resource/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="resource/css/animate.min.css" rel="stylesheet">
<link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							管理员 <small>分类，查找</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link">
								<i class="fa fa-chevron-up"></i>
							</a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
								<i class="glyphicon glyphicon-plus"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<a id="addadmin">添加管理员</a>
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
									<th>选择</th>
									<th>编号</th>
									<th>管理员照片</th>
									<th>管理员帐号</th>
									<th>联系电话</th>
									<th>邮箱</th>
									<th>注册时间</th>
									<th>最后登录时间</th>
									<th>最后登录IP</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adminList }" varStatus="status" var="admin">
									<tr class="gradeX">
										<td>
											<input type="checkbox" name="id" value="${admin.adminid }">
										</td>
										<td>${status.index + 1}</td>
										<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath }/upload/${admin.adminphoto }" title="">
					                            <img style="width:100px;height:80px"; src="${pageContext.request.contextPath }/upload/${admin.adminphoto }" />
					                        </a>
							    		</td>
										<td>${admin.adminname }</td>
										<td>${admin.adminphone }</td>
										<td>${admin.adminemail }</td>
										<td>${admin.adminlogintime }</td>
										<td>${admin.adminlasttime }</td>
										<td>${admin.adminlastip }</td>
										<td class="text-center">
											<button class="btn btn-danger btn-sm demo4">
												<span class="glyphicon glyphicon-trash"></span>
											</button>

											&nbsp;
											<button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
												data-target="#myModal5">
												<a class="requestdate" href="javascript:requestdata('${admin.adminid }');">
													<span class="glyphicon glyphicon-pencil"></span>
												</a>

											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>选择</th>
									<th>编号</th>
									<th>管理员照片</th>
									<th>管理员帐号</th>
									<th>联系电话</th>
									<th>邮箱</th>
									<th>注册时间</th>
									<th>最后登录时间</th>
									<th>最后登录IP</th>
									<th>操作</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">ADMIN更新</h4>
								<!-- <small class="font-bold">这里可以显示副标题。 -->
							</div>
							<div class="modal-body">
								<div class="ibox-content">
									<form class="form-horizontal m-t" id="signupForm">
										<div>
											<input type="hidden" name="adminid" id="adminid">
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" value="10">帐号：</label>
											<div class="col-sm-8">
												<input id="adminname" name="adminname" minlength="2" type="text" class="form-control"
													required="" aria-required="true">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">密码：</label>
											<div class="col-sm-8">
												<input id="adminpwd" name="adminpassword" class="form-control" type="password">
											</div>
										</div>
										<!-- <div class="form-group">
											<label class="col-sm-3 control-label">确认密码：</label>
											<div class="col-sm-8">
												<input id="confirm_password" name="confirm_password"
													class="form-control" type="password">
												<span class="help-block m-b-none">
													<i class="fa fa-info-circle"></i> 请再次输入您的密码
												</span>
											</div>
										</div> -->
										<div class="form-group">
											<label class="col-sm-3 control-label">联系电话：</label>
											<div class="col-sm-8">
												<input id="adminPhone" name="adminphone" class="form-control" type="text"
													aria-required="true" aria-invalid="false" class="valid">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">E-mail：</label>
											<div class="col-sm-8">
												<input id="email" type="email" class="form-control" name="adminemail" required=""
													aria-required="true">
											</div>
										</div>
										<!-- <div class="form-group">
											<label class="col-sm-3 control-label">管理员头像：</label>
											<div class="col-sm-8">
												<input id="adminPhoto" name="adminPhoto"
													class="form-control" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">说明：</label>
											<div class="col-sm-8">
												<textarea id="describe" name="describe"
													class="form-control" required=""
													aria-required="true"></textarea>
											</div>
										</div> -->
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-white" data-dismiss="modal" id="close">关闭</button>
								<button type="button" class="btn btn-primary sbmt">保存</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="resource/js/content.min.js?v=1.0.0"></script>
	<script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="resource/js/admin/back-admin.js"></script>
	<script src="resource/layer/layer.js"></script>
	<script>
	$.fn.serializeObject = function () {  
	    var o = {};  
	    var a = this.serializeArray();  
	    $.each(a, function () {  
	        if (o[this.name]) {  
	            if (!o[this.name].push) {  
	                o[this.name] = [o[this.name]];  
	            }  
	            o[this.name].push(this.value || '');  
	        } else {  
	            o[this.name] = this.value || '';  
	        }  
	    });  
	    return o;  
	}; 
	
	$("#addadmin").on("click", function (){
	    layer.open({
	        type: 2,
	        area: ['600px', '650px'],
	        
	        //area: ['600px', '360px'],
	        shadeClose: true, //点击遮罩关闭
	        content: 'jsp/back/admin/MyJsp.jsp'
	    });
	});

	
	function requestdata(id){
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/getAdmin.action?id="+id,
			type : "GET",
			success : function(result){
				console.log(result);
				setdata(result);
			}
		});
	}
	function setdata(result){
		$("#adminid").attr("value",result.adminid);
		$("#adminname").attr("value",result.adminname);
		$("#adminpwd").attr("value", result.adminpassword);
		$("#adminPhone").attr("value", result.adminphone);
		$("#email").attr("value", result.adminemail);
	/* 			$("#describe").attr("value", result.describe);
		$("#adminPhoto").attr("value", result.adminPhoto);
			$("#adminlogintime").attr(result.adminlogintime);
		$("#adminlasttime").attr(result.adminlasttime);
		$("#adminlastip").attr(result.adminlastip); */
		//var formdata = new FormData($("#signupForm"));
		
	}
	$(".sbmt").click(function (){
		//var id = $(this).parent().find("input[type='checkbox']").val();
		//var formdata = new FormData($("#signupForm"));
		//console.log("test");
		//console.log();

		$.ajax({
			url : "${pageContext.request.contextPath }/admin/modifyAdmin.action",
			type : "POST",
			data : JSON.stringify($("#signupForm").serializeObject()),
			contentType:"application/json", 
			success : function(result){
				if(result){
					swal({
						title : "提示",
						text : "更新成功！！"},
						function(){
							setTimeout(function () { $("#close").click(); self.location.reload();}, 300);
						}
					);
				} else {
					swal({
						title : "提示",
						text : "更新失败！！",
						confirmButtonColor : "#F00"
					});
				}
				
			}
		});
	});
	$(".demo4").click(
			function() {
				var id = $(this).parent().parent().find(
						"input[type='checkbox']").val();
				// $(this).parent().parent().attr("class", "del");
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
							url : "admin/deleteAdminById.action?id=" + id
						});
						swal({title : "删除成功！", 
							  text : "您已经永久删除了这条信息。",
							  type : "success"},
							  function(){
							      self.location.reload();
							  }
						);
						// $(".del").remove();
					} else {
						swal("已取消", "您取消了删除操作！", "error");
					}
				})
			});
	</script>
</body>

</html>