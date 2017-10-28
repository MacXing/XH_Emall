<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index_v1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resource/css/animate.min.css" rel="stylesheet">
<link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-md-3" style="background-color: #ccc">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-3" style="background-color: #dcd">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-3" style="background-color: #ecf">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-3" style="background-color: #fca">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-2" style="background-color: #acb">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="background-color: #bcc">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="background-color: #ccd">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="background-color: #dce">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="background-color: #ecf">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="background-color: #fca">
					<div class="row">
						<div class="col-md-4">
							<span class="glyphicon glyphicon-picture btn-lg"></span>
						</div>
						<div class="col-md-8">
							<span><h3>测试数据</h3></span> <span><h3>测试数据</h3></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>系统信息</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_basic.html#">选项1</a></li>
								<li><a href="table_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content table-responsive">
						<!-- 系统信息数据开始 -->
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
								<tr>
									<th>#</th>
									<th>数据</th>
									<th>用户</th>
									<th>值</th>
								</tr>
							</tbody>
						</table>
						<!-- 系统信息数据结束 -->
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="ibox float-e-margins">这是底部测试数据</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="resource/js/content.min.js?v=1.0.0"></script>
	<script src="resource/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resource/js/demo/peity-demo.min.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
