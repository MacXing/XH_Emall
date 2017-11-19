<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>快递列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="resource/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

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
						<h5>
							快递信息 <small>查找</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link" onclick="userorderhome()"> <i
								class="glyphicon glyphicon-home"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i
								class="glyphicon glyphicon-plus"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a data-toggle="modal" data-target="#myModal">添加快递列表</a>
								</li>
							</ul>
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>快递编号</th>
									<th>快递编码</th>
									<th>快递名称</th>
									<th>快递描述</th>
									<th>是否支持货到付款</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="table_data">
								<c:forEach items="${expresslist }" varStatus="status"
									var="expresslist">
									<tr class="gradeX">
										<td>${expresslist.shoppingid }</td>
										<td>${expresslist.shoppingcode }</td>
										<td>${expresslist.shoppingname }</td>
										<td>${expresslist.shoppingdesc }</td>
										<td><c:if test="${expresslist.enable==1}">是</c:if> <c:if
												test="${expresslist.enable eq 0}">否</c:if></td>
										<td class="text-center"><a
											onclick="btn1(${expresslist.shoppingid })"
											data-toggle="modal" data-target="#myModel1"
											style="color:#000"><span
												class="glyphicon glyphicon-search"></span></a> &nbsp;&nbsp;

											<button type="button"
												class="btn btn-danger btn-circle btn-outline"
												onclick="btn2(${expresslist.shoppingid })">
												<i class="fa fa-times"></i>
											</button> &nbsp;&nbsp; <a onclick="btn3(${expresslist.shoppingid })"
											style="color:#000" data-toggle="modal"
											data-target="#myModal2"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>快递编号</th>
									<th>快递编码</th>
									<th>快递名称</th>
									<th>快递描述</th>
									<th>是否支持货到付款</th>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加快递列表</h4>
				</div>
				<div class="modal-body">
					<form id="add" enctype="multipart/form-data"
						class="form-horizontal m-t">
						<div class="form-group">
							<label class="col-sm-3 control-label">快递编码：</label>
							<div class="col-sm-9">
								<input type="text" id="shoppingcode11" name="shoppingcode"
									class="form-control" placeholder="请输入快递编码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">快递名称：</label>
							<div class="col-sm-9">
								<input type="text" id="shoppingname11" name="shoppingname"
									class="form-control" placeholder="请输入快递名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">快递描述：</label>
							<div class="col-sm-9">
								<input type="text" id="shoppingdesc11" name="shoppingdesc"
									class="form-control" placeholder="请输入快递描述">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">支持货到付款：</label>
							<div class="col-sm-9">
								<input type="radio" name="enable" id="enable" value="1"
									<c:if test="${}">checked</c:if> />是&nbsp;&nbsp; <input
									type="radio" name="enable" id="enable" value="0"
									<c:if test="${}">checked</c:if> />否
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">上传图片：</label>
							<div class="col-sm-4">
								选择图片：<img width="80px" height="100px" id="img"
									onclick="showPic()"> <input type="file" name="file"
									id="file" class="form-control">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="btn_add" class="btn btn-primary"
					>提交添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="modal fade" id="myModel1" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">查看详细信息</h4>
				</div>
				<div class="modal-body">
					<div class="ibox-content">
						<table class="table table-bordered">
							<tbody id="mytable">
								<tr>
									<td>快递编号</td>
									<td id="shoppingid"></td>
									<td>快递编码</td>
									<td id="shoppingcode"></td>
								</tr>
								<tr>
									<td>快递名称</td>
									<td id="shoppingname"></td>
									<td>快递描述</td>
									<td id="shoppingdesc"></td>
								</tr>
								<tr>
									<td>是否支持货到付款</td>
									<td id="enable1"></td>
									<td>快递图片</td>
									<td><img width="80px" height="100px" id="shoppingimg"></td>
								</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改快递</h4>
				</div>
				<div class="modal-body">
					<form id="update" enctype="multipart/form-data"
						class="form-horizontal m-t">
						<div class="form-group">
							<label class="col-sm-3 control-label">快递编号：</label>
							<div class="col-sm-9">
								<input type="hidden" name="shoppingid" id="shoppingid1"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">快递编码：</label>
							<div class="col-sm-9">
								<input type="text" name="shoppingcode" id="shoppingcode1"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">快递名称：</label>
							<div class="col-sm-9">
								<input type="text" name="shoppingname" id="shoppingname1"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">快递描述：</label>
							<div class="col-sm-9">
								<input type="text" name="shoppingdesc" id="shoppingdesc1"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">支持货到付款：</label>
							<div class="col-sm-9">
								<input type="radio" name="enable" id="enable2" value="1" />是&nbsp;&nbsp;
								<input type="radio" name="enable" id="enable2" value="0" />否
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">上传图片：</label>
							<div class="col-sm-4">
								选择图片：<img width="80px" height="100px" id="img1" onclick="showPic1()"> 
									<input type="file" name="file" id="file1" class="form-control">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="btn_update" class="btn btn-primary"
						onclick="update()">提交修改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="resource/js/content.min.js?v=1.0.0"></script>
	<script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="resource/js/validate.js"></script>

	<script type="text/javascript">
		$("#btn_add").click(function(){
		var val = new validate(
				{
					rules : {
						shoppingid11 : "numberEnglish",
						shoppingcode11 : "numberEnglish",
						shoppingname11 : "notEmpty",
						shoppingdesc11 : "notEmpty",
					},
					/*submitFun里面为检验成功后要执行的方法*/
					submitFun : function addExp() {
						var action = "";
						var form = $("#file").val().length;
						var formData = new FormData($("#add")[0]);
						if(form==0){			 
							action="addExpress.action";
						}else{
							 action="insertExpressAndFile.action";
						}
								$.ajax({
									cache : true,
									type : "POST",
									data : formData,
									url : "${pageContext.request.contextPath }/exp/"+action,
									/* async: false,
									cache: false,   */
									contentType : false,
									processData : false,
									success : function(result) {
										if (result.code != 100) {
											alert("增加成功！");
											window.location.href = "${pageContext.request.contextPath }/order/queryAllOrderController.action";
										} else {
											alert("增加失败！");
											window.location.href = "${pageContext.request.contextPath }/order/queryAllOrderController.action";
										}
									}
								});
					}

				});
			});

		$("#btn_update")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											shoppingid1 : "numberEnglish",
											shoppingcode1 : "numberEnglish",
											shoppingname1 : "notEmpty",
											shoppingdesc1 : "notEmpty",
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun : function update() {
											var action = "";
											var form = $("#file1").val().length;
											var formData = new FormData($("#update")[0]);
											if(form==0){			 
												action="updateExpress.action";
											}else{
												 action="updateExpressAndFile.action";
											}											
													$.ajax({
														cache : true,
														type : "POST",
														data : formData,
														url : "${pageContext.request.contextPath }/exp/"+action,
														contentType : false,
														processData : false,
														success : function(
																result) {
															if (result.code == 100) {
																alert("修改成功！");
																window.location.href = "exp/queryAllExpress.action";
															} else {
																alert("修改失败！");
																window.location.href = "exp/queryAllExpress.action";
															}
														}
													});
										}

									});
						});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(".dataTables-example").dataTable();
							var oTable = $("#editable").dataTable();
							oTable
									.$("td")
									.editable(
											"../example_ajax.php",
											{
												"callback" : function(sValue, y) {
													var aPos = oTable
															.fnGetPosition(this);
													oTable.fnUpdate(sValue,
															aPos[0], aPos[1])
												},
												"submitdata" : function(value,
														settings) {
													return {
														"row_id" : this.parentNode
																.getAttribute("messageList.msgid"),
														"column" : oTable
																.fnGetPosition(this)[2]
													}
												},
												"width" : "90%",
												"height" : "100%"
											})
						});
		function fnClickAddRow() {
			$("#editable").dataTable()
					.fnAddData(
							[ "Custom row", "New row", "New row", "New row",
									"New row" ])
		};
	</script>

	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
		
	</script>

	<script>
		/*查询留言详细信息  */
		function btn1(id) {
			$.ajax({
				url : "${pageContext.request.contextPath }/exp/queryExpByIdForDetail.action?id="+id,
				type : "GET",
				success : function(result) {
					console.log(result);
					build_table(result);
				}
			});
		}

		function build_table(result) {
			$("#shoppingid").html(result.shoppingid);
			$("#shoppingcode").html(result.shoppingcode);
			$("#shoppingname").html(result.shoppingname);
			$("#shoppingdesc").html(result.shoppingdesc);
			$("#shoppingimg").attr("src","${pageContext.request.contextPath }/shoppingphoto/"+ result.shoppingimg);

			if (result.enable == 1) {
				$("#enable1").html("是");
			} else {
				$("#enable1").html("否");
			}
		}
	</script>

	<script type="text/javascript">
		/* 点击删除 */
		function btn2(id) {
			if (!confirm("您确定要删除该留言信息记录吗？")) {
				return false;
			} else {
				$.ajax({
				url : "${pageContext.request.contextPath }/exp/deleteExpress.action?id="+id,
				type : "delete",
				success : function(result) {
					alert("删除成功！");
					window.location.href = "${pageContext.request.contextPath }/exp/queryAllExpress.action";
				}

			});
						
			}
		}

		/*点击修改*/
		function btn3(id) {
			$.ajax({
				url : "${pageContext.request.contextPath }/exp/queryExpByIdForDetail.action?id="+id,
			type : "GET",
			success : function(result) {
				console.log(result);
				build_table1(result);
			}
		});
					
		}

		function build_table1(result) {
			$("#shoppingid1").attr("value", result.shoppingid);
			$("#shoppingcode1").attr("value", result.shoppingcode);
			$("#shoppingname1").attr("value", result.shoppingname);
			$("#shoppingdesc1").attr("value", result.shoppingdesc);
			$("input[name=enable][value=" + result.enable + "]").attr("checked", true);
			$("#img1").attr("src","${pageContext.request.contextPath }/shoppingphoto/"+ result.shoppingimg);
		}

		/*显示图片*/
		function showPic() {
			var pic = $("#file").get(0).files[0];
			$("#img").prop("src", window.URL.createObjectURL(pic));
		}

		function showPic1() {
			var pic = $("#file1").get(0).files[0];
			$("#img1").prop("src", window.URL.createObjectURL(pic));
		}

		/*返回订单表*/
		function userorderhome() {
			window.location.href = "${pageContext.request.contextPath }/order/queryAllOrderController.action";
		}
	</script>
</body>

</html>
