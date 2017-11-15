<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

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

<title>后台首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="shortcut icon" href="favicon.ico">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/animate.min.css" rel="stylesheet">
<link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow:hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span>
							<img alt="image" style="width:64px; hight:64px;" class="img-circle" src="${pageContext.request.contextPath }/upload/${sessionScope.admin.adminphoto }" />
						</span>
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<span class="clear">
								<span class="block m-t-xs">
									<strong class="font-bold">${sessionScope.admin.adminname }</strong>
								</span>
								<span class="text-muted text-xs block">
									${sessionScope.admin.rolename }<b class="caret"></b>
								</span>
							</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li>
								<a class="J_menuItem" href="form_avatar.html">修改头像</a>
							</li>
							<li>
								<a class="J_menuItem" href="profile.html">个人资料</a>
							</li>
							<li>
								<a class="J_menuItem" href="contacts.html">联系我们</a>
							</li>
							<li>
								<a class="J_menuItem" href="#">信箱</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="jsp/back/loginbackstage.jsp">安全退出</a>
							</li>
						</ul>
					</div>
					<div class="logo-element"><h5>孝康安老</h5></div>
				</li>

				<li>
					<a class="J_menuItem" href="jsp/back/index_v1.jsp" data-index="1">
						<i class="fa fa-home"></i>
						<span class="nav-label">主页</span>
					</a>
				</li>
				<!-- 高级管理 -->
			 	
			 	<shiro:hasAnyPermission name="root">
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-cutlery"></i>
						<span class="glyphicon-class">高级管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="#">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">管理员维护</span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/admin/queryAdminList.action">管理员列表</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/jsp/back/admin/addadmin.jsp">添加管理员</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-file"></i>
								<span class="glyphicon-class">日志维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="jsp/back/form_vallidate.jsp"
										data-index="0">添加日志</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">清除日志</a>
								</li>

							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-ok"></i>
								<span class="glyphicon-class">管理员权限管理</span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/role/queryAllRoles.action"
										data-index="0">权限管理</a>
								</li>
								
							</ul>
						</li>
					</ul>
				</li>
				
				</shiro:hasAnyPermission>
				<!-- 商品管理 -->
				
				<shiro:hasAnyPermission name="root,good">
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-gift"></i>
						<span class="glyphicon-class">商品管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-gift"></i>
								<span class="glyphicon-class">商品维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/product/queryAllProducts.action">商品列表</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/jsp/back/product/addProduct.jsp">添加商品</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/product/queryAllImages.action">查看商品图片</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/jsp/back/product/addImage.jsp">添加商品图片</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/category/categoryProduct.action">商品归类</a>
								</li>
						</ul>
					</li>
					<li>
						<a class="J_menuItem" href="${pageContext.request.contextPath }/category/queryAllCategory.action">
							<i class="glyphicon glyphicon-barcode"></i>
							<span class="glyphicon-class">商品分类</span>							
						</a>					
					</li>
					<li>
						<a class="J_menuItem" href="${pageContext.request.contextPath }/comment/queryAllComment.action">
							<i class="glyphicon glyphicon-comment"></i>
							<span class="glyphicon-class">会员评论</span>							
						</a>								
					</li>
					<li>
						<a class="J_menuItem" href="${pageContext.request.contextPath }/brand/queryAllBrands.action">
							<i class="glyphicon glyphicon-barcode"></i>
							<span class="glyphicon-class">商品品牌</span>							
						</a>							
					</li>
					<li>
						<a class="J_menuItem" href="${pageContext.request.contextPath }/product/queryAllProductsDelete.action">
							<i class="glyphicon glyphicon-trash"></i>
							<span class="glyphicon-class">商品回收站</span>
						</a>
					</li>
				</ul>
				</li>
				
				</shiro:hasAnyPermission>
				<!-- 报表管理 -->		
				<shiro:hasAnyPermission name="root,report,ceo">
				<li>
					<a href="#">
						<i class="fa fa fa-bar-chart-o"></i>
						<span class="nav-label">报表统计管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a class="J_menuItem" href="graph_echarts.html">流量分析</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_flot.html">客户统计</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_morris.html">订单统计</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_rickshaw.html">销售概括</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_peity.html">会员排行</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_sparkline.html">销售明细</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_metrics.html">搜索引擎</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_metrics.html">访问购买率</a>
						</li>
						<li>
							<a class="J_menuItem" href="graph_metrics.html">站外投放JS</a>
						</li>
					</ul>
				</li>
			
				</shiro:hasAnyPermission>
			
				<shiro:hasAnyPermission name="root,user">
				<li>
					<a href="mailbox.html">
						<i class="glyphicon glyphicon-user"></i>
						<span class="glyphicon-class">会员管理 </span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a class="J_menuItem" href="user/queryAllUsers.action">
								<i class="glyphicon glyphicon-search"></i>
								<span class="glyphicon-class">会员信息管理</span>
							</a>
						</li>
						<li>
							<a class="J_menuItem" href="grade/userGrade.action">
								<i class="glyphicon glyphicon-certificate"></i>
								<span class="glyphicon-class">会员等级维护 </span>
							</a>
						</li>
						<li>
							<a href="message/queryUsermessageController.action" class="J_menuItem">
								<i class="glyphicon glyphicon-text-width"></i>
								<span class="glyphicon-class">会员留言维护 </span>								
							</a>					
						</li>
					</ul>
				</li>
				</shiro:hasAnyPermission>
				<shiro:hasAnyPermission name="root,order">
				<!-- 订单管理 -->
				
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-list-alt"></i>
						<span class="glyphicon-class">订单管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="order/queryAllOrderController.action" class="J_menuItem">
								<i class="glyphicon glyphicon-file"></i>
								<span class="glyphicon-class">会员订单</span>								
							</a>					
						</li>
						<li>
							<a href="admin/queryAllOrderGoods.action" class="J_menuItem">
								<i class="glyphicon glyphicon-duplicate"></i>
								<span class="glyphicon-class">货物订单 </span>							
							</a>
						</li>						
					</ul>
				</li>
				</shiro:hasAnyPermission>
		
				<!-- 购物车管理 -->
				<shiro:hasAnyPermission name="root,good,order">
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-shopping-cart"></i>
						<span class="glyphicon-class">购物车管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">购物车维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/jsp/back/trolley/addtrolley.jsp">添加购物车</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/trolley/myTrolley.action">查询购物车信息</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				</shiro:hasAnyPermission>
				<!-- 文章管理 -->
				
				<shiro:hasAnyPermission name="root,user">
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-earphone"></i>
						<span class="glyphicon-class">推广管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">广告管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/jsp/back/ad/addAd.jsp">添加广告</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/ad/queryAllAdsList.action">广告信息列表</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/ad/queryStatueAllAds.action">移除投放广告</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath }/ad/queryNotSattueAllAds.action">添加投放广告</a>
								</li>
							</ul>
						</li>
						<li>
							<a class="J_menuItem" href="${pageContext.request.contextPath}/navbar/queryAllNavbar.action">
								<i class="glyphicon glyphicon-thumbs-up"></i>
								<span class="glyphicon-class">轮播图管理</span>
								<span class="fa arrow"></span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-thumbs-up"></i>
								<span class="glyphicon-class">商品推荐 </span>
								<span class="fa arrow"></span>
							</a>
						</li>
					</ul>
				</li>
				</shiro:hasAnyPermission>
				<!-- 促销管理 -->
				<shiro:hasAnyPermission name="root,user">
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-yen"></i>
						<span class="glyphicon-class">促销管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">积分商城商品管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/sales/queryAllNotIntegralProduct.action">添加积分商品</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/sales/queryAllIntegralProduct.action">移除积分商品</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">积分管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/sales/queryUsersIntegral.action">会员积分修改</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				</shiro:hasAnyPermission>
				<!-- 库存管理 -->
				
				<shiro:hasAnyPermission name="root,house">	
				
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-tasks"></i>
						<span class="glyphicon-class">库存管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">库存查询 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/repertory/queryStock.action">库存查询</a>
								</li>								
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">仓库管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/repertory/queryAllRepertory.action">仓库查询</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/jsp/back/warehouse/addhouse.jsp">增加仓库</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">进出货管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/repertory/queryAllOutput.action">出货查询</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/repertory/queryAllInput.action">进货查询</a>
								</li>
								<li>
									<a class="J_menuItem" href="${pageContext.request.contextPath}/repertory/queryAllProduct.action">进出货操作</a>
								</li>								
							</ul>
						</li>
					</ul>
				</li>
				</shiro:hasAnyPermission>	
			</ul>
			
		</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary" 
					href="${pageContext.request.contextPath}/jsp/back/index.jsp#">
						<i class="fa fa-bars"></i>
					</a>
					<form role="search" class="navbar-form-custom" method="post"
						action="search_results.html">
						<div class="form-group">
							<input type="text" placeholder="请输入您需要查找的内容 …"
								class="form-control" name="top-search" id="top-search">
						</div>
					</form>
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown hidden-xs">
						<a class="right-sidebar-toggle" aria-expanded="false">
							<i class="fa fa-tasks"></i> 主题
						</a>
					</li>
				</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
				<div class="page-tabs-content">
					<a href="javascript:;" class="active J_menuTab"
						data-id="jsp/back/index_v1.jsp">首页</a>
				</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作
						<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive">
							<a>定位当前选项卡</a>
						</li>
						<li class="divider"></li>
						<li class="J_tabCloseAll">
							<a>关闭全部选项卡</a>
						</li>
						<li class="J_tabCloseOther">
							<a>关闭其他选项卡</a>
						</li>
					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/logout.action" class="roll-nav roll-right J_tabExit">
					<i class="fa fa fa-sign-out"></i> 退出
				</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="jsp/back/index_v1.jsp" frameborder="0" data-id="jsp/back/index_v1.jsp"
					seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2014-2015
					<a href="http://www.zi-han.net/" target="_blank">zihan's blog</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">

				<ul class="nav nav-tabs navs-3">

					<li class="active">
						<a data-toggle="tab" href="#tab-1">
							<i class="fa fa-gear"></i> 主题
						</a>
					</li>
					<li class="">
						<a data-toggle="tab" href="#tab-2"> 通知 </a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-3"> 项目进度 </a>
					</li>
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu"
											class="onoffswitch-checkbox" id="collapsemenu">
										<label class="onoffswitch-label" for="collapsemenu">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar"
											class="onoffswitch-checkbox" id="fixednavbar">
										<label class="onoffswitch-label" for="fixednavbar">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout"
											class="onoffswitch-checkbox" id="boxedlayout">
										<label class="onoffswitch-label" for="boxedlayout">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-0"> 默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-1"> 蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-3"> 黄色/紫色主题 </a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--右侧边栏结束-->
		<!--mini聊天窗口开始-->
	</div>
	
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>
	<script src="resource/js/hplus.min.js?v=4.0.0"></script>
	<script type="text/javascript" src="resource/js/contabs.min.js"></script>
	<script src="resource/js/plugins/pace/pace.min.js"></script>
</body>
</html>
