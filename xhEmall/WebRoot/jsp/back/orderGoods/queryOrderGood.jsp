<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>货物订单列表</title>

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
   <link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
   <base target="_blank">
<style>
    .layui-upload-img {
        width: 92px;
        height: 92px;
        margin: 0 10px 10px 0;
    }
    </style>
<base target="_blank">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							货物订单 <small>查找，删除</small>
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
									<a id="addOrderGood" data-toggle="modal" data-target="#myOGModal">添加货物订单</a>
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
									<th>商品号</th>
									<th>订单号</th>
									<th>商品名称</th>
									<th>商品定价</th>
									<th>商品售价</th>
									<th>购买数量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${OGList }" varStatus="status" var="og">
									<tr class="gradeX">
										<td>
											<input type="checkbox" name="id" value="${og.ogID }">
										</td>
										<td>${status.index + 1}</td>
							    		<td>${og.orderID }</td>
										<td>${og.pID }</td>
										<td>${og.product.pname }</td>
										<td>${og.product.pprice }</td>
										<td>${og.product.psale }</td>
										<td>${og.orderInfo.goodamount }</td>
										<td class="text-center">
											<button class="btn btn-danger btn-sm demo4">
												<span class="glyphicon glyphicon-trash"></span>
											</button>

											&nbsp;
											<button type="button" class="btn btn-primary btn-sm modify" data-toggle="modal" data-target="#modifymyOGModal">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>选择</th>
									<th>编号</th>
									<th>商品号</th>
									<th>订单号</th>
									<th>商品名称</th>
									<th>商品定价</th>
									<th>商品售价</th>
									<th>购买数量</th>
									<th>操作</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<div class="modal fade" id="myOGModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                    <h4 class="modal-title" id="myModalLabel">货物订单</h4>
				                </div>
				                <div class="modal-body">
				                    <form class="form-horizontal m-t" id="addorders">
				                        <div class="col-md-12">
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label">订单编号：</label>
				                                <div class="col-sm-9">
				                                    <input name="orderid" type="text" class="form-control orderid" id="addorderid" placeholder="请输入订单编号">
				                                	<div class="ordercue" style=" color:red; margin-top:10px;"></div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label">商品编号：</label>
				                                <div class="col-sm-9">
				                                    <input type="text" name="pid" class="form-control pid" id="addpid" placeholder="请输入商品编号">
				                                	<div class="pcue" style=" color:red; margin-top:10px;"></div>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="hr-line-dashed"></div>
				                        <div class="form-group draggable">
				                            <div class="col-sm-12 col-sm-offset-4">
				                                <button type="button" class="btn btn-default closemodel" data-dismiss="modal">关闭</button>
				                                <button type="button" id="btn_addog" class="btn btn-primary" onclick="addOG()">添加订单</button>
				                            </div>
				                        </div>
				                    </form>
				                </div>
				                <!-- /.modal-content -->
				            </div>
				            <!-- /.modal -->
				        </div>
				    </div>
				    <div class="modal fade" id="modifymyOGModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                    <h4 class="modal-title" id="myModalLabel">更新订单</h4>
				                </div>
				                <div class="modal-body">
				                    <form class="form-horizontal m-t" id="addorders">
				                        <div class="col-md-12">
				                        	<div>
				                        		<input type="hidden" id="newogid">
				                        	</div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label">订单编号：</label>
				                                <div class="col-sm-9">
				                                    <input name="orderid" type="text" class="form-control orderid" id="neworderid" placeholder="请输入订单编号">
				                                	<div class="ordercue" style=" color:red; margin-top:10px;"></div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label">商品编号：</label>
				                                <div class="col-sm-9">
				                                    <input type="text" name="pid" class="form-control pid" id="newpid" placeholder="请输入商品编号">
				                                	<div class="pcue" style=" color:red; margin-top:10px;"></div>
				                                </div>
				                            </div>
				                        </div>
				                        <div class="hr-line-dashed"></div>
				                        <div class="form-group draggable">
				                            <div class="col-sm-12 col-sm-offset-4">
				                                <button type="button" class="btn btn-default closemodel" data-dismiss="modal">关闭</button>
				                                <button type="button" id="btn_modifyog" class="btn btn-primary" onclick="modifyOG()">更新订单</button>
				                            </div>
				                        </div>
				                    </form>
				                </div>
				                <!-- /.modal-content -->
				            </div>
				            <!-- /.modal -->
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
    <script src="resource/layui/layui.js"></script>
    <script type="text/javascript" src="resource/js/validate.js"></script>
   
   <script type="text/javascript">
		$("#btn_addog")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											addorderid : "numberEnglish",
											addpid : "numberEnglish",
											
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun :function addOG(){
		var addorderid = $("#addorderid").val();
		var addpid = $("#addpid").val();
		$.ajax({
			url: "admin/addOrderGoodInfo.action",
			contentType:"application/json", 
			data: {
				"pid" : addpid,
				"orderid" : addorderid
			},
			success : function(result){
				if(result.status == 1){
					//console.log(result);
					layer.msg(result.msg);
				} 
				if(result.status == 0) {
					//console.log(result);
					$(".closemodel").click();
					layer.msg(result.msg);
					self.location.reload();
				}
			}
		});
	}
										

									});
						});
					//更新	
					$("#btn_modifyog")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											neworderid : "numberEnglish",
											newpid : "numberEnglish",
											
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun :function modifyOG(){
		var neworderid = $("#neworderid").val();
		var newpid = $("#newpid").val();
		var newogid = $("#newogid").val();
		alert(newogid);
	alert(neworderid);
	alert(newpid);
		$.ajax({
			url: "admin/updateOrderGoodInfo.action",
			contentType:"application/json", 
			data: {
				"ogID" : newogid,
				"pID" : newpid,
				"orderID" : neworderid
			},
			success : function(result){
				if(result.status == 1){
					//console.log(result);
					layer.msg(result.msg);
				} 
				if(result.status == 0) {
					//console.log(result);
					$(".closemodel").click();
					layer.msg(result.msg);
					self.location.reload();
				}
			}
		});
	}
										

									});
						});
						
	</script>
    
	<script>
	$(".modify").click(function (){
		var id = $(this).parent().parent().find("input[type='checkbox']").val();
		$.ajax({
			url: "admin/queryOrderGoodById.action?ogid=" + id,
			contentType:"application/json", 
			success : function(result){
				if(result.status == 0) {
					$("#newogid").attr("value", result.data.ogID);
					$("#neworderid").attr("value", result.data.orderID);
					$("#newpid").attr("value", result.data.pID);
				} else {
					layer.msg(result.msg);
				}
			}
		});
	});
	
	$(".orderid").blur(function(){
		var ordercueid = $(this).val();
		$.ajax({
			url: "admin/checkOrderId.action?orderid=" + ordercueid,
			contentType:"application/json", 
			success : function(result){
				if(result.status == 1){
					//console.log(result);
					$(".ordercue").html(result.msg);
				} 
				if(result.status == 0) {
					$(".ordercue").html("");
				}
			}
		});
	});
	$(".pid").blur(function(){
		var pcueid = $(this).val();
		$.ajax({
			url: "admin/checkProduceId.action?pid=" + pcueid,
			contentType:"application/json", 
			success : function(result){
				if(result.status == 1){
					//console.log(result);
					$(".pcue").html(result.msg);
				} 
				if(result.status == 0) {
					$(".pcue").html("");
				}
			}
		});
	});
	$(".demo4").click(
			function() {
				var ogid = $(this).parent().parent().find(
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
							url : "admin/deleteOrderGoodById.action?ogid=" + ogid,
							success : function(result){
								if(result.status == 0){
									swal({title : "删除成功！", 
										  text : "您已经永久删除了这条信息。",
										  type : "success"},
										  function(){
										      self.location.reload();
										  }
									);
								} else {
									swal("删除失败", "请再次操作", "error");
								}
							},
						});
						
						// $(".del").remove();
					} else {
						swal("已取消", "您取消了删除操作！", "error");
					}
				})
			});
	</script>
</body>

</html>