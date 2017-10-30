<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
							<img alt="image" class="img-circle" src="resource/img/profile_small.jpg" />
						</span>
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<span class="clear">
								<span class="block m-t-xs">
									<strong class="font-bold">Beaut-zihan</strong>
								</span>
								<span class="text-muted text-xs block">
									超级管理员<b class="caret"></b>
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
								<a href="login.html">安全退出</a>
							</li>
						</ul>
					</div>
					<div class="logo-element">H+</div>
				</li>

				<li>
					<a class="J_menuItem" href="jsp/back/index_v1.jsp" data-index="1">
						<i class="fa fa-home"></i>
						<span class="nav-label">主页</span>
					</a>
				</li>
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
									<a class="J_menuItem" href="jsp/back/form_vallidate.jsp"
										data-index="0">添加管理员</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">修改管理员信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">查询所有管理员</a>
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
								<i class="glyphicon glyphicon-euro"></i>
								<span class="glyphicon-class">商家管理</span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="jsp/back/form_vallidate.jsp"
										data-index="0">添加商家</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">修改商家信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">查询所有商家</a>
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
									<a class="J_menuItem" href="jsp/back/form_vallidate.jsp"
										data-index="0">添加管理员权限</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">修改管理员权限</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">查询管理员权限</a>
								</li>
								<li>
									<a class="J_menuItem" href="#">删除管理员权限</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
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
									<a class="J_menuItem" href="${pageContext.request.contextPath }/brand/queryAllBrands.action">添加商品</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">修改商品</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-th-large"></i>
								<span class="glyphicon-class">商品分类 </span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-comment"></i>
								<span class="glyphicon-class">用户评论</span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-barcode"></i>
								<span class="glyphicon-class">商品品牌</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="glyphicon glyphicon-tree-deciduous"></i>
								<span class="glyphicon-class">商品类型</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="glyphicon glyphicon-trash"></i>
								<span class="glyphicon-class">商品回收站</span>
							</a>
						</li>
					</ul>
				</li>
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

				<li>
					<a href="mailbox.html">
						<i class="glyphicon glyphicon-user"></i>
						<span class="glyphicon-class">会员管理 </span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">会员维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">增加会员</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改会员信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询会员信息</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">会员等级维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">增加等级</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改会员等级</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询会员等级</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">会员留言维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询会员留言</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-list-alt"></i>
						<span class="glyphicon-class">订单管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">订单维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加订单</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改订单信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询订单信息</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-duplicate"></i>
								<span class="glyphicon-class">合并订单 </span>
								<span class="fa arrow"></span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-print"></i>
								<span class="glyphicon-class">打印订单 </span>
								<span class="fa arrow"></span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-minus"></i>
								<span class="glyphicon-class">缺货登记 </span>
								<span class="fa arrow"></span>
							</a>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">发货单管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加发货单</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改发货单信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询发货单信息</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">退货单管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加退货单</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改退货单信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询发货单信息</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
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
									<a class="J_menuItem" href="mailbox.html">添加购物车</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改购物车</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询购物车信息</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-edit"></i>
						<span class="glyphicon-class">文章管理</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">文章维护 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加文章</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改文章</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询查询文章</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-th"></i>
								<span class="glyphicon-class">文章分类 </span>
								<span class="fa arrow"></span>
							</a>
						</li>
					</ul>
				</li>
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
									<a class="J_menuItem" href="mailbox.html">添加广告</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改广告信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询广告信息</a>
								</li>
							</ul>
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
									<a class="J_menuItem" href="mailbox.html">添加积分商品</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">修改积分商品</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询积分商品</a>
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
									<a class="J_menuItem" href="mailbox.html">添加会员积分</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">扣除会员积分</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询会员积分</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-cog"></i>
						<span class="glyphicon-class">系统设置</span>
						<span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-wrench"></i>
								<span class="glyphicon-class">商店设置 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">商店信息</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_detail.html">商品显示</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">购物流程</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">基本设置</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-bitcoin"></i>
								<span class="glyphicon-class">支付方式 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加支付方式</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询支付方式</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-road"></i>
								<span class="glyphicon-class">配送方式 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加配送方式</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询配送方式</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailbox.html">
								<i class="glyphicon glyphicon-globe"></i>
								<span class="glyphicon-class">地区管理 </span>
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a class="J_menuItem" href="mailbox.html">添加地区</a>
								</li>
								<li>
									<a class="J_menuItem" href="mail_compose.html">查询地区</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
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
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
						href="#">
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
					<li class="dropdown">
						<a class="dropdown-toggle count-info" data-toggle="dropdown"
							href="#">
							<i class="fa fa-envelope"></i>
							<span class="label label-warning">16</span>
						</a>
						<ul class="dropdown-menu dropdown-messages">
							<li class="m-t-xs">
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left">
										<img alt="image" class="img-circle" src="resource/img/a7.jpg">
									</a>
									<div class="media-body">
										<small class="pull-right">46小时前</small> <strong>小四</strong>
										这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？ <br> <small
											class="text-muted">3天前 2014.11.8</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left">
										<img alt="image" class="img-circle" src="resource/img/a4.jpg">
									</a>
									<div class="media-body ">
										<small class="pull-right text-navy">25小时前</small> <strong>国民岳父</strong>
										如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶 <br> <small
											class="text-muted">昨天</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a class="J_menuItem" href="mailbox.html">
										<i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
									</a>
								</div>
							</li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle count-info" data-toggle="dropdown"
							href="#">
							<i class="fa fa-bell"></i>
							<span class="label label-primary">8</span>
						</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li>
								<a href="mailbox.html">
									<div>
										<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
										<span class="pull-right text-muted small">4分钟前</span>
									</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="profile.html">
									<div>
										<i class="fa fa-qq fa-fw"></i> 3条新回复
										<span class="pull-right text-muted small">12分钟钱</span>
									</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a class="J_menuItem" href="notifications.html">
										<strong>查看所有 </strong> <i class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul>
					</li>
					<li class="hidden-xs">
						<a href="index_v1.html" class="J_menuItem" data-index="0">
							<i class="fa fa-cart-arrow-down"></i> 购买
						</a>
					</li>
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
				<a href="login.html" class="roll-nav roll-right J_tabExit">
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
					<div id="tab-2" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 最新通知
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
						</div>

						<div>

							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a1.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">

										据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。 <br> <small
											class="text-muted">今天 4:21</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a2.jpg">
									</div>
									<div class="media-body">
										HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！ <br> <small
											class="text-muted">昨天 2:45</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										写的好！与您分享 <br> <small class="text-muted">昨天 1:10</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a4.jpg">
									</div>

									<div class="media-body">
										国外极限小子的炼成！这还是亲生的吗！！ <br> <small class="text-muted">昨天
											8:37</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a8.jpg">
									</div>
									<div class="media-body">

										一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。 <br> <small
											class="text-muted">今天 4:21</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a7.jpg">
									</div>
									<div class="media-body">
										这哥们的新视频又来了，创意杠杠滴，帅炸了！ <br> <small class="text-muted">昨天
											2:45</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										最近在补追此剧，特别喜欢这段表白。 <br> <small class="text-muted">昨天
											1:10</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="resource/img/a4.jpg">
									</div>
									<div class="media-body">
										我发起了一个投票 【你认为下午大盘会翻红吗？】 <br> <small class="text-muted">星期一
											8:37</small>
									</div>
								</a>
							</div>
						</div>

					</div>
					<div id="tab-3" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-cube"></i> 最新任务
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
						</div>

						<ul class="sidebar-list">
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>市场调研</h4>
									按要求接收教材；

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>可行性报告研究报上级批准</h4>
									编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>立项阶段</h4>
									东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="label label-primary pull-right">NEW</span>
									<h4>设计阶段</h4>
									<!--<div class="small pull-right m-t-xs">9小时以后</div>-->
									项目进度报告(Project Progress Report)
									<div class="small">已完成： 22%</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>拆迁阶段</h4>
									科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>建设阶段</h4>
									编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>获证开盘</h4>
									编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div>
								</a>
							</li>

						</ul>

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
