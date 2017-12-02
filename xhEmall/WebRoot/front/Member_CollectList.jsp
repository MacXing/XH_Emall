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

<title>我的收藏</title>

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

<style type="text/css">
.pages1 {
	overflow: hidden;
	color: #888888;
	padding: 20px 10px;
	text-align: right;
	font-size: 6px;
	font-family: "宋体";
	margin-top: 20px;
}

.pages1 a {
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	color: #666666;
	font-size: 16px;
	text-align: center;
	display: inline-block;
	padding: 0 12px;
	margin: 0 4px;
	border: 1px solid #cccccc;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.pages1 a:hover,.pages1 a.cur {
	color: #FFF;
	background-color: #ff4e00;
	border: 1px solid #ff4e00;
}

.pages1 a.p_pre:hover {
	background-color: #eaeaea;
	color: #555555;
	border: 1px solid #cccccc;
}
</style>

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
				<p></p>
				<div class="mem_tit">我的收藏</div>
				
				<table border="0" class="order_tab" style="width:930px; text-align:left; margin-bottom:30px;"
					cellspacing="0" cellpadding="0">
					<c:forEach items="${collect }" varStatus="status" var="collect">
						<tr>
							<td>
								收藏编号：<font color="#ff4e00">${collect.collectid}</font>&nbsp;
								用户编号：<font color="#ff4e00">${collect.users.userid }</font>&nbsp;
								用户姓名：<font color="#ff4e00">${collect.users.username }</font>&nbsp; 
								商品编号：<font color="#ff4e00">${collect.product.pid }</font>&nbsp;
								<%-- <input type="hidden" name="pid" value="${collect.product.pid }" id="pid"/>  --%>
								<input type="button" onclick="addCar(${collect.product.pid })" style="color:#fff" value="加入购物车"
									class="btn_tj">				
							</td>
						</tr>
						<tr>						
							<td>
								<textarea class="add_txt" style="font-family:'楷体','楷体_GB2312';font-size: 16px">${collect.product.pname }</textarea>
								</font> <img id="collectImg" width="90" height="90" src="${pageContext.request.contextPath }${collect.product.pimg }" />
							</td>
						</tr>
						<tr>
							<td>
								收藏时间:<font color="#ff4e00"><fmt:formatDate value="${collect.collecttime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></font>&nbsp;
								<input type="button" onclick="btn1(${collect.collectid})" style="color:#fff" value="删除"
									class="btn_tj">
							</td>
						</tr>
					</c:forEach>

				</table>
				<div class="pages1">
					<c:if test="${pageInfo.hasPreviousPage==true }">
						<a
							href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?pageNum=${pageInfo.pageNum-1}&id=${current_user.userid}">
							<font style="font-size: 1px">上一页</font>
						</a>
					</c:if>
					<c:if test="${pageInfo.hasPreviousPage==false }">
						<a>
							<font style="font-size: 1px">上一页</font>
						</a>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="n">
						<a
							href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?pageNum=${n}&id=${current_user.userid}">
							<font style="font-size: 1px">${n}</font>
						</a>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage==true }">
						<a
							href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?pageNum=${pageInfo.pageNum+1}&id=${current_user.userid}">
							<font style="font-size: 1px">下一页</font>
						</a>
					</c:if>
					<c:if test="${pageInfo.hasNextPage==false }">
						<a>
							<font style="font-size: 1px">下一页</font>
						</a>
					</c:if>
				</div>
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

		/*点击添加购物车*/
		function addCar(pid) {
			
			$.ajax({
				url :"${pageContext.request.contextPath}/trolley/addTroItem.action?pid="+pid+"&pnum="+1+"&userid="+${current_user.userid },
				type : "post",
				success : function(result) {
					if (result.code == 100) {
						alert("添加成功！");
						window.location.href = "${pageContext.request.contextPath }/trolley/findByUserCart.action";
					} else {
						alert("添加失败！");
						window.location.href = "${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id="+${current_user.userid };
					}
				}
			});
		}

		/* 点击删除*/
		function btn1(id) {
			if (!confirm("您确定要删除您的收藏记录吗？")) {
				return false;
			} else {
				$.ajax({
					url : "${pageContext.request.contextPath }/userCollect/deleteCollect.action?id="+id,
					type : "delete",
					success : function(result) {
						if (result.code == 100) {
							alert("删除成功！");
							window.location.href = "${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id="+${current_user.userid };
						} else {
							alert("删除失败！");
							window.location.href = "${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id="+${current_user.userid };
						}
					}
				});
			}
		}
	</script>
	
	<script type="text/javascript" src="front/js/logout.js"></script>

</body>

</html>
</html>
