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
<base href="<%=basePath%>" />

<title>会员中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="front/css/style.css" />

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
				<table border="0" class="acc_tab" style="width:870px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_l">
							<h5>用户ID：</h5>
						</td>
						<td id="userid">${user.userid }</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>用户姓名：</h5>
						</td>
						<td id="username">
							<font style="font-family:'楷体','楷体_GB2312';font-size: 16px">${user.username }</font>
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>用户生日：</h5>
						</td>
						<td id="userbirthday">
							<fmt:formatDate value="${user.userbirthday }" type="date" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>用户性别：</h5>
						</td>
						<td>
							<c:if test="${user.usersex==1}">
								<font style="font-family:'楷体','楷体_GB2312';font-size: 16px">男</font>
							</c:if>
							<c:if test="${user.usersex eq 0}">
								<font style="font-family:'楷体','楷体_GB2312';font-size: 16px">女</font>
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>电 话：</h5>
						</td>
						<td id="userphone">${user.userphone }</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>地 址：</h5>
						</td>
						<td id="useraddress">
							<font style="font-family:'楷体','楷体_GB2312';font-size: 16px">${user.useraddress }</font>
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>家庭电话：</h5>
						</td>
						<td id="userhomephone">${user.userhomephone }</td>
					</tr>
					<tr>
						<td class="td_l">
							<h5>邮 箱：</h5>
						</td>
						<td id="useremail">${user.useremail }</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>注册时间：</h5>
						</td>
						<td id="userlogintime">
							<fmt:formatDate value="${user.userlogintime }" type="date" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">
							<h5>最后登录时间：</h5>
						</td>
						<td id="userlasttime">
							<fmt:formatDate value="${user.userlasttime }" type="date" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td class="td_l">
							<h5>访问数：</h5>
						</td>
						<td id="uservisitcount">${user.uservisitcount }</td>
					</tr>
				</table>


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
		/* function btn1(){
		var id=2;
			   $.ajax({
				   url:"${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id="+id,
				   type:"GET",
				   success:function(result){
						   console.log(result);
						   build_table(result);
				   }   
			   });
			 }
		
		 function build_table(result){
		 	$("#userid").html(result.userid);
		 	$("#gradeid").html(result.xhgrade.gradeid);
		 	$("#gradename").html(result.xhgrade.gradename);
		 	$("#gradecount").html(result.xhgrade.gradecount);
		 	$("#username").html(result.username);
		 	$("#userpassword").html(result.userpassword);
		 	$("#usersex").html(result.usersex);
		 	$("#userbirthday").html(fmtDate(result.userbirthday));
		 	$("#userphone").html(result.userphone);
		 	$("#useremail").html(result.useremail);
		 	$("#useraddress").html(result.useraddress);
		 	$("#userlogintime").html(fmtDate(result.userlogintime));
		 	$("#userlasttime").html(fmtDate(result.userlasttime));
		 	$("#userlastip").html(fmtDate(result.userlastip));
		 	$("#uservisitcount").html(result.uservisitcount);
		 	$("#userhomephone").html(result.userhomephone);
		 	$("#userphoto").attr("src","${pageContext.request.contextPath }/userphoto/"+result.userphoto);
		 	$("#usermoney").html(result.usermoney);		 	
		 	$("#userintegral").html(result.userintegral);
		 	
		 	if(result.usersex==1){
		 		$("#usersex").html("男");
		 	}else{
		 		$("#usersex").html("女");
		 	}
		 } */

		/* 时间格式转换 */
		function fmtDate(obj) {
			var date = new Date(obj);
			var y = 1900 + date.getYear();
			var m = "0" + (date.getMonth() + 1);
			var d = "0" + date.getDate();
			var h = "0" + date.getHours();
			var f = "0" + date.getMinutes();
			var s = "0" + date.getSeconds();
			return y + "-" + m.substring(m.length - 2, m.length) + "-"
					+ d.substring(d.length - 2, d.length) + " "
					+ h.substring(h.length - 2, h.length) + ":"
					+ f.substring(f.length - 2, f.length) + ":"
					+ s.substring(s.length - 2, s.length);
		}
	</script>

	<script type="text/javascript" src="front/js/logout.js"></script>

</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
