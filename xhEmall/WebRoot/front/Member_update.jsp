<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>修改信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

<script src="resource/js/jquery.min.js?v=2.1.4"></script>

<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
<script src="resource/js/content.min.js?v=1.0.0"></script>
<script src="resource/js/plugins/validate/jquery.validate.min.js"></script>
<script src="resource/js/plugins/validate/messages_zh.min.js"></script>
<script src="resource/js/demo/form-validate-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script type="text/javascript" src="resource/js/validate.js"></script>

</head>

<body>
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
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${user.userid }">用户信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUserByIdForUpdate.action?id=${user.userid }">修改信息</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${user.userid }">我的留言</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userComment/queryCommentById.action?id=${current_user.userid }">我的评论</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id=${current_user.userid }">我的收藏</a>
						</li>
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
				<div class="m_des">
					<table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td width="115">
								<img id="userphoto" width="90" height="90" src="userphoto/${user.userphoto }" />
							</td>
							<td>
								<div class="m_user" id="username">${user.username }</div>
								<div class="m_notice">
									<span>
										<i>用户中心公告！</i>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>会员等级：</td>
							<td id="gradename">${user.xhgrade.gradename }</td>
						</tr>
						<tr>
							<td>等级条件：</td>
							<td id="gradecount">${user.xhgrade.gradecount }</td>
						</tr>
					</table>
				</div>

				<div class="mem_t">资产信息</div>
				<table border="0" class="mon_tab" style="width:870px; margin-bottom:20px;" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="33%">
							用户等级：
							<span id="gradename">${user.xhgrade.gradename }</span>
						</td>
						<td width="33%">
							消费金额：
							<span id="usermoney">${user.usermoney }</span>
						</td>
						<td width="33%">
							会员积分：
							<span id="userintegral">${user.userintegral }</span>
						</td>
					</tr>
					<tr>
						<td>
							账户余额：
							<span>￥200元</span>
						</td>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							订单提醒： <font style="font-family:'宋体';">待付款(<span>0</span>) &nbsp; &nbsp; &nbsp; &nbsp;
								待收货(<span>2</span>) &nbsp; &nbsp; &nbsp; &nbsp; 待评论(<span>1</span>)
							</font>
						</td>
					</tr>
				</table>

				<div class="mem_t">账号信息</div>
				<form role="form" id="update" method="post" enctype="multipart/form-data">
					<table border="0" class="mon_tab" style="width:870px; margin-bottom:20px;" cellspacing="0"
						cellpadding="0">
						<tr>
							<td>
								<div>
									<input id="userid" name="userid" value="${user.userid }" type="hidden">
								</div>
							</td>
						</tr>
						<tr>
							<td width="40%">
								姓名：
								<span style="color:#555555;">
									<input type="text" id="username" name="username" value="${user.username }">
								</span>
							</td>
							<td width="40%">
								性别：
								<span style="color:#555555;">
									<input type="radio" name="usersex" id="sex" value="1"
										<c:if test="${user.usersex==1}">checked</c:if> />
									男&nbsp;&nbsp;
									<input type="radio" name="usersex" id="sex" value="0"
										<c:if test="${user.usersex eq 0}">checked</c:if> />
									女
								</span>
							</td>
						</tr>
						<tr>
							<td width="40%">
								生日：
								<span style="color:#555555;">
									<i class="fa fa-calendar"> <input type="date" name="userbirthday"
											value="${user.userbirthday }"> 原出生年月：<fmt:formatDate
											value="${user.userbirthday }" type="date" pattern="yyyy-MM-dd" />
									</i>
								</span>
							</td>
							<td width="40%">
								家庭电话：
								<span style="color:#555555;">
									<input type="text" name="userhomephone" value="${user.userhomephone }">
								</span>
							</td>
						</tr>
						<tr>
							<td width="40%">
								电话：
								<span style="color:#555555;">
									<input type="text" id="userphone" name="userphone" value="${user.userphone }">
								</span>
							</td>
							<td width="40%">
								<tr>
									<td>
										家庭地址：
										<select class="jj" name="province" id="provinceId" >
											<option>${user.province }</option>
										</select>
									</td>
								</tr>
							</td>
						</tr>
						<tr>
							<td>
								<span style="color:#555555;">
									<%-- <input type="text" id="useraddress" name="useraddress" value="${user.useraddress }"> --%>
									<textarea id="useraddress" rows="5" cols="50" name="useraddress" data-provide="markdown"
										style="resize: none; display: block;font-family:'楷体','楷体_GB2312';font-size: 16px">${user.useraddress }</textarea>
								</span>
							</td>
						</tr>
						</td>
						</tr>
						<tr>
							<td width="40%">
								邮箱：
								<span style="color:#555555;">
									<input type="email" id="useremail" name="useremail" value="${user.useremail }">
								</span>
							</td>
							<td width="40%">
								头像：
								<span style="color:#555555;">
									<div>
										<input type="file" name="file" placeholder="" id="file">
										<input type="image" name="userphoto" value="${user.userphoto }">
										<br> <img width="90px" height="90px" id="img1" src="userphoto/${user.userphoto }"
											onclick="showPic()">
									</div>
								</span>
							</td>
						</tr>
					</table>
					<center>
						<div>
							<input type="button" id="btn_id" value="保存修改" class="btn_tj">
							<input type="button" value="取消" class="btn btn-white"
								onclick="javascript:window.location.href='${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${user.userid }'">
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
		<jsp:include page="/front/foot.jsp" />
		<!--End Footer End -->
	</div>

	<script type="text/javascript">
		$.ajax({
	 		type:"GET",
	 		url:"${pageContext.request.contextPath}/order/getProvincelist.action",
	 		success:function(result){    			
	 			$.each(result.extend.provincelist,function(index,item){
	 				 //var option=$("<option value='"+item.provinceid+"'></option>").append(item.province);
	 				 var option = $("<option></option>").attr("value",item.provinceid).append(item.province);
	 				 option.appendTo("#provinceId");     				 
	 			});
	 			//获取城市 
	 			$("#provinceId").change(function(){
	 				$.ajax({
	     	     		type:"GET",
	     	     		url:"${pageContext.request.contextPath}/order/getCityByProvinceId.action?id="+$("#provinceId").val(),    		
	     	     		success:function(result){
	     	     			$.each(result.extend.citylist,function(index,item){
	     	     				 var option = $("<option></option>").attr("value",item.cityid).append(item.city);
	     	     				 option.appendTo("#cityId");    	     				
	     	     			});
	     	     		}
	     	     	});
	 			});				
	 		}
	 	});
		$("#btn_id")
				.on(
						"click",
						function() {
							var userid = $("#userid").val();
							var action = "";
							var form = $("#file").val().length;
							var formData = new FormData($("#update")[0]);
							if (form == 0) {
								action = "updateUser.action";
							} else {
								action = "updateUserAndFile.action";
							}
							$
									.ajax({
										cache : true,
										type : "POST",
										url : "${pageContext.request.contextPath }/userCenter/"
												+ action,
										data : formData,
										contentType : false,
										processData : false,
										success : function(result) {
											if (result.code == 100) {
												alert("修改成功！");
												window.location.href = "userCenter/queryUserByIdForDetail.action?id="
														+ userid;
											} else {
												alert("修改失败！");
												window.location.href = "userCenter/queryUserByIdForDetail.action?id="
														+ userid;
											}
										}
									});
						});
	</script>

	<script type="text/javascript">
		/*显示图片*/
		function showPic() {
			var pic = $("#file").get(0).files[0];
			$("#img1").prop("src", window.URL.createObjectURL(pic));
		}
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>
</html>
