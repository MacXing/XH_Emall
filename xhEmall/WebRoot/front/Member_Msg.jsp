<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>修改留言</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link type="text/css" rel="stylesheet" href="front/css/style.css" />

<script src="resource/js/jquery.min.js?v=2.1.4"></script>

<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
<script src="resource/js/content.min.js?v=1.0.0"></script>
<script src="resource/js/plugins/validate/jquery.validate.min.js"></script>
<script src="resource/js/plugins/validate/messages_zh.min.js"></script>
<script src="resource/js/demo/form-validate-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script type="text/javascript" src="resource/js/validate.js"></script>
<script type="text/javascript" src="resource/layer/layer.js"></script>
<script type="text/javascript" src="front/js/logout.js"></script>

</head>

<body>
	<!--Begin Header Begin-->
	<jsp:include page="/front/head2.jsp" />
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<div class="m_left">
				<div class="left_n">管理中心</div>
				<div class="left_m">
					<div class="left_m_t t_bg1">订单中心</div>
					<ul>
						<li>
							<a
								href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid }">我的订单</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/frontOrder/queryAddressById.action?userid=${current_user.userid }">收货地址</a>
						</li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg2">会员中心</div>
					<ul>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">用户信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForUpdate.action?id=${current_user.userid }">修改信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${current_user.userid }">我的留言</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userComment/queryCommentById.action?id=${current_user.userid }">我的评论</a>
						</li>
						<li><a href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id=${current_user.userid }">我的收藏</a></li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg3">账户中心</div>
					<ul>
						<li>
							<a href="front/Member_Safe.jsp">账户安全</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="m_right">
				<p></p>
				<div class="mem_tit">我的留言</div>
				<form id="update" method="post">
					<table border="0" style="width:880px; margin-top:20px;" cellspacing="0" cellpadding="0">
						<input type="hidden" name="msgid" id="msgid" value="${msg.msgid }" />
						<input type="hidden" name="userid" id="userid" value="${msg.users.userid }" />
						<tr height="45">
							<td width="80" align="right">留言类型 &nbsp; &nbsp;</td>
							<td>
								<label class="r_rad">
									<input type="checkbox" name="type" checked="checked" />
								</label>
								<label class="r_txt">留言</label>
								<label class="r_rad">
									<input type="checkbox" name="type" />
								</label>
								<label class="r_txt">投诉</label>
								<label class="r_rad">
									<input type="checkbox" name="type" />
								</label>
								<label class="r_txt">询问</label>
								<label class="r_rad">
									<input type="checkbox" name="type" />
								</label>
								<label class="r_txt">售后</label>
								<label class="r_rad">
									<input type="checkbox" name="type" />
								</label>
								<label class="r_txt">求购</label>
							</td>
						</tr>
						<tr height="45">
							<td align="right">姓名 &nbsp; &nbsp;</td>
							<td>
								<input type="text" name="username" value="${msg.users.username }" class="add_ipt"
									style="width:290px;" />
							</td>
						</tr>
						<tr valign="top" height="110">
							<td align="right">留言内容 &nbsp; &nbsp;</td>
							<td style="padding-top:5px;">
								<textarea class="add_txt" name="msgtxt" style="font-family:'楷体','楷体_GB2312';font-size: 16px">${msg.msgtxt }</textarea>
							</td>
						</tr>
					</table>
					<center>
						<div>
							<input type="button" id="btn_id" value="保存修改" class="btn_tj">
							<input type="button" value="取消" class="btn btn-white"
								onclick="javascript:window.location.href='${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${msg.users.userid }'">
						</div>
					</center>
				</form>
			</div>
		</div>
		<!--End 用户中心 End-->
		<!--Begin Footer Begin -->
		<div class="b_btm_bg b_btm_c">
			<div class="b_btm">
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b1.png" width="62" height="62" />
						</td>
						<td>
							<h2>正品保障</h2>
							正品行货 放心购买
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b2.png" width="62" height="62" />
						</td>
						<td>
							<h2>满38包邮</h2>
							满38包邮 免运费
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b3.png" width="62" height="62" />
						</td>
						<td>
							<h2>天天低价</h2>
							天天低价 畅选无忧
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b4.png" width="62" height="62" />
						</td>
						<td>
							<h2>准时送达</h2>
							收货时间由你做主
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="/front/foot.jsp"/>
		<!--End Footer End -->
	</div>

	<script type="text/javascript">
		$("#btn_id")
				.on(
						"click",
						function() {
							var userid = $("#userid").val();
							var formData = new FormData($("#update")[0]);
							$
									.ajax({
										cache : true,
										type : "POST",
										url : "${pageContext.request.contextPath }/userCenter/updateMessage.action",
										data : formData,
										contentType : false,
										processData : false,
										success : function(result) {
											if (result.code == 100) {
												alert("修改成功！");
												window.location.href = "userCenter/queryUsermessageById.action?id="
														+ userid;
											} else {
												alert("修改失败！");
												window.location.href = "userCenter/queryUsermessageById.action?id="
														+ userid;
											}
										}
									});
						});
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>

</html>
</html>
