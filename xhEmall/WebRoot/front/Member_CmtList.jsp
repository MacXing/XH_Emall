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

<title>我的评论</title>

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
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<!--Begin 所在收货地区 Begin-->
			<span class="s_city_b">
				<span class="fl">送货至：</span>
				<span class="s_city">
					<span>四川</span>
					<div class="s_city_bg">
						<div class="s_city_t"></div>
						<div class="s_city_c">
							<h2>请选择所在的收货地区</h2>
							<table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0"
								cellpadding="0">
								<tr>
									<th>A</th>
									<td class="c_h">
										<span>安徽</span>
										<span>澳门</span>
									</td>
								</tr>
								<tr>
									<th>B</th>
									<td class="c_h">
										<span>北京</span>
									</td>
								</tr>
								<tr>
									<th>C</th>
									<td class="c_h">
										<span>重庆</span>
									</td>
								</tr>
								<tr>
									<th>F</th>
									<td class="c_h">
										<span>福建</span>
									</td>
								</tr>
								<tr>
									<th>G</th>
									<td class="c_h">
										<span>广东</span>
										<span>广西</span>
										<span>贵州</span>
										<span>甘肃</span>
									</td>
								</tr>
								<tr>
									<th>H</th>
									<td class="c_h">
										<span>河北</span>
										<span>河南</span>
										<span>黑龙江</span>
										<span>海南</span>
										<span>湖北</span>
										<span>湖南</span>
									</td>
								</tr>
								<tr>
									<th>J</th>
									<td class="c_h">
										<span>江苏</span>
										<span>吉林</span>
										<span>江西</span>
									</td>
								</tr>
								<tr>
									<th>L</th>
									<td class="c_h">
										<span>辽宁</span>
									</td>
								</tr>
								<tr>
									<th>N</th>
									<td class="c_h">
										<span>内蒙古</span>
										<span>宁夏</span>
									</td>
								</tr>
								<tr>
									<th>Q</th>
									<td class="c_h">
										<span>青海</span>
									</td>
								</tr>
								<tr>
									<th>S</th>
									<td class="c_h">
										<span>上海</span>
										<span>山东</span>
										<span>山西</span>
										<span class="c_check">四川</span>
										<span>陕西</span>
									</td>
								</tr>
								<tr>
									<th>T</th>
									<td class="c_h">
										<span>台湾</span>
										<span>天津</span>
									</td>
								</tr>
								<tr>
									<th>X</th>
									<td class="c_h">
										<span>西藏</span>
										<span>香港</span>
										<span>新疆</span>
									</td>
								</tr>
								<tr>
									<th>Y</th>
									<td class="c_h">
										<span>云南</span>
									</td>
								</tr>
								<tr>
									<th>Z</th>
									<td class="c_h">
										<span>浙江</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</span>
			</span>
			<!--End 所在收货地区 End-->
			<span class="fr">
				<span class="fl">
					<c:if test="${current_user == null }">
					你好，请
					<a href="front/Login.jsp">登录</a>
					&nbsp;
					<a href="Regist.html" style="color:#ff4e00;">免费注册</a>
					</c:if>
					<c:if test="${current_user != null}">
					欢迎您，<a
							href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
					&nbsp;|&nbsp;
					<a class="logout">退出登录</a>
					</c:if>

					&nbsp;|&nbsp;
					<a href="#">我的订单</a>
					&nbsp;|
					<a href="${pageContext.request.contextPath }/trolley/findByUser.action">我的购物车</a>
					&nbsp;|
				</span>
				<span class="ss">
					<div class="ss_list">
						<a href="#">收藏夹</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">我的收藏夹</a>
									</li>
									<li>
										<a href="#">我的收藏夹</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">客户服务</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">客户服务</a>
									</li>
									<li>
										<a href="#">客户服务</a>
									</li>
									<li>
										<a href="#">客户服务</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">网站导航</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">网站导航</a>
									</li>
									<li>
										<a href="#">网站导航</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</span>
				<span class="fl">|&nbsp;关注我们：</span>
				<span class="s_sh">
					<a href="#" class="sh1">新浪</a>
					<a href="#" class="sh2">微信</a>
				</span>
				<span class="fr">
					|&nbsp;
					<a href="home/home.action">
						首页&nbsp;<img src="front/images/home.png" align="absmiddle" />
					</a>
				</span>
			</span>
		</div>
	</div>
	<div class="m_top_bg">
		<div class="top">
			<div class="m_logo">
				<a href="home/home.action">
					<img src="front/images/logo1.png" />
				</a>
			</div>
			<div class="m_search">
				<form>
					<input type="text" value="" class="m_ipt" />
					<input type="submit" value="搜索" class="m_btn" />
				</form>
				<span class="fl">
					<a href="#">咖啡</a>
					<a href="#">iphone 6S</a>
					<a href="#">新鲜美食</a>
					<a href="#">蛋糕</a>
					<a href="#">日用品</a>
					<a href="#">连衣裙</a>
				</span>
			</div>
			<div class="i_car">
				<div class="car_t">
					购物车 [
					<span>3</span>
					]
				</div>
				<div class="car_bg">
					<!--Begin 购物车未登录 Begin-->
					<div class="un_login">
						还未登录！
						<a href="Login.html" style="color:#ff4e00;">马上登录</a>
						查看购物车！
					</div>
					<!--End 购物车未登录 End-->
					<!--Begin 购物车已登录 Begin-->
					<ul class="cars">
						<li>
							<div class="img">
								<a href="#">
									<img src="front/images/car1.jpg" width="58" height="58" />
								</a>
							</div>
							<div class="name">
								<a href="#">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a>
							</div>
							<div class="price">
								<font color="#ff4e00">￥399</font> X1
							</div>
						</li>
						<li>
							<div class="img">
								<a href="#">
									<img src="front/images/car2.jpg" width="58" height="58" />
								</a>
							</div>
							<div class="name">
								<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
							</div>
							<div class="price">
								<font color="#ff4e00">￥399</font> X1
							</div>
						</li>
						<li>
							<div class="img">
								<a href="#">
									<img src="front/images/car2.jpg" width="58" height="58" />
								</a>
							</div>
							<div class="name">
								<a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a>
							</div>
							<div class="price">
								<font color="#ff4e00">￥399</font> X1
							</div>
						</li>
					</ul>
					<div class="price_sum">
						共计&nbsp; <font color="#ff4e00">￥</font>
						<span>1058</span>
					</div>
					<div class="price_a">
						<a href="#">去购物车结算</a>
					</div>
					<!--End 购物车已登录 End-->
				</div>
			</div>
		</div>
	</div>
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
								href="${pageContext.request.contextPath }/order/queryOrderInfo.action?userid=${current_user.userid }">我的订单</a>
						</li>
						<li>
							<a
								href="${pageContext.request.contextPath }/order/queryAddressById.action?userid=${current_user.userid }">收货地址</a>
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
				<div class="mem_tit">我的评论</div>
				<div class="mem_tit">
					<input type="button" value="我要评论" onclick="addcmt()" class="btn_tj" />
				</div>
				<table border="0" class="order_tab" style="width:930px; text-align:left; margin-bottom:30px;"
					cellspacing="0" cellpadding="0">
					<c:forEach items="${comment }" varStatus="status" var="comment">
						<tr>
							<td>
								用户姓名：<font color="#ff4e00">${comment.users.username }</font>&nbsp; 商品编号：<font
									color="#ff4e00">${comment.product.pid }</font>&nbsp; 商品名称：<font color="#ff4e00">${comment.product.pname }</font>&nbsp;
								评论编号：<font color="#ff4e00">${comment.commentid }</font>&nbsp; 服务星评：<font color="#ff4e00">${comment.commentservice }</font>&nbsp;
								物流星评：<font color="#ff4e00">${comment.commentshopping }</font>&nbsp; 商品星评：<font
									color="#ff4e00">${comment.commentgoods }</font>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="add_txt" style="font-family:'楷体','楷体_GB2312';font-size: 16px">${comment.commenttxt }</textarea>
								</font> <img id="commentImg" width="90" height="90" src="commentImg/${comment.commentimg }" />
							</td>
						</tr>
						<tr>
							<td>
								评论时间:<font color="#ff4e00"><fmt:formatDate value="${comment.commenttime }"
										pattern="yyyy-MM-dd" /></font>&nbsp;
								<input type="button" onclick="btn1(${comment.commentid})" style="color:#fff" value="清空"
									class="btn_tj">
								&nbsp;
								
								<input type="button" onclick="btn2(${comment.commentid})" style="color:#fff" value="修改"
									class="btn_tj">
								&nbsp;
								
								<input type="button" onclick="btn3(${comment.commentid})" style="color:#fff" value="删除"
									class="btn_tj">
							</td>
						</tr>
					</c:forEach>

				</table>
				<div class="pages1">
					<c:if test="${pageInfo.hasPreviousPage==true }">
						<a
							href="${pageContext.request.contextPath }/userComment/queryCommentById.action?pageNum=${pageInfo.pageNum-1}&id=${current_user.userid}">
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
							href="${pageContext.request.contextPath }/userComment/queryCommentById.action?pageNum=${n}&id=${current_user.userid}">
							<font style="font-size: 1px">${n}</font>
						</a>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage==true }">
						<a
							href="${pageContext.request.contextPath }/userComment/queryCommentById.action?pageNum=${pageInfo.pageNum+1}&id=${current_user.userid}">
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
		<div class="b_nav">
			<dl>
				<dt>
					<a href="#">新手上路</a>
				</dt>
				<dd>
					<a href="#">售后流程</a>
				</dd>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">订购方式</a>
				</dd>
				<dd>
					<a href="#">隐私声明</a>
				</dd>
				<dd>
					<a href="#">推荐分享说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">配送与支付</a>
				</dt>
				<dd>
					<a href="#">货到付款区域</a>
				</dd>
				<dd>
					<a href="#">配送支付查询</a>
				</dd>
				<dd>
					<a href="#">支付方式说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">会员中心</a>
				</dt>
				<dd>
					<a href="#">资金管理</a>
				</dd>
				<dd>
					<a href="#">我的收藏</a>
				</dd>
				<dd>
					<a href="#">我的订单</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">服务保证</a>
				</dt>
				<dd>
					<a href="#">退换货原则</a>
				</dd>
				<dd>
					<a href="#">售后服务保证</a>
				</dd>
				<dd>
					<a href="#">产品质量保证</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">联系我们</a>
				</dt>
				<dd>
					<a href="#">网站故障报告</a>
				</dd>
				<dd>
					<a href="#">购物咨询</a>
				</dd>
				<dd>
					<a href="#">投诉与建议</a>
				</dd>
			</dl>
			<div class="b_tel_bg">
				<a href="#" class="b_sh1">新浪微博</a>
				<a href="#" class="b_sh2">腾讯微博</a>
				<p>
					服务热线：<br />
					<span>400-123-4567</span>
				</p>
			</div>
			<div class="b_er">
				<div class="b_er_c">
					<img src="front/images/er.gif" width="118" height="118" />
				</div>
				<img src="front/imagesss.png" />
			</div>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018 尤洪商城网 All Rights Reserved.
				复制必究 , Technical Support: Dgg Group <br /> <img src="front/images/b_1.gif" width="98"
					height="33" /><img src="front/images/b_2.gif" width="98" height="33" /><img
					src="front/images/b_3.gif" width="98" height="33" /><img src="front/images/b_4.gif" width="98"
					height="33" /><img src="front/images/b_5.gif" width="98" height="33" /><img
					src="front/images/b_6.gif" width="98" height="33" />
			</div>
		</div>
		<!--End Footer End -->
	</div>

	<script type="text/javascript">
		/* 点击清空 */
		function btn1(id) {
			if (!confirm("您确定要清空您的评论记录吗？")) {
				return false;
			} else {
				$
						.ajax({
							url : "${pageContext.request.contextPath }/userComment/cleanComment.action?id="
									+ id,
							type : "post",
							success : function(result) {
								if (result.code == 100) {
									alert("清空成功！");
									window.location.href = "${pageContext.request.contextPath }/userComment/queryCommentById.action?id="
											+ ${current_user.userid};
								} else {
									alert("清空失败！");
									window.location.href = "${pageContext.request.contextPath }/userComment/queryCommentById.action?id="
											+ ${current_user.userid};
								}
							}
						});
			}
		}

		/*点击修改*/
		function btn2(id) {
			window.location.href = "${pageContext.request.contextPath }/userComment/queryCmtByIdForUpdate.action?id="
					+ id;
		}

		/*点击添加*/
		function addcmt() {
			window.location.href = "front/Member_Cmtadd.jsp";
		}

		/* 点击删除*/
		function btn3(id) {
			if (!confirm("您确定要删除您的评论记录吗？")) {
				return false;
			} else {
				$
						.ajax({
							url : "${pageContext.request.contextPath }/userComment/deleteComment.action?id="
									+ id,
							type : "delete",
							success : function(result) {
								if (result.code == 100) {
									alert("删除成功！");
									window.location.href = "${pageContext.request.contextPath }/userComment/queryCommentById.action?id="
											+ ${current_user.userid};
								} else {
									alert("删除失败！");
									window.location.href = "${pageContext.request.contextPath }/userComment/queryCommentById.action?id="
											+ ${current_user.userid};
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
