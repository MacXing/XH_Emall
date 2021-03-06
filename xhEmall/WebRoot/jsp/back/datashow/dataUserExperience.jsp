<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员分布统计</title>
    
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
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	
	<script src="resource/js/echarts/echarts.js"></script>	
	<script src="resource/js/echarts/china.js"></script>

  </head>
  
  <body class="gray-bg">
  	<script src="resource/js/echarts/shine.js"></script>
  	<script src="resource/js/echarts/infographic.js"></script>
  	<script src="resource/js/echarts/dark.js"></script>
  	<script src="resource/js/echarts/macarons.js"></script>
  	<script src="resource/js/echarts/roma.js"></script>
  	<script src="resource/js/echarts/vintage.js"></script>
  	
  	<div class="wrapper wrapper-content animated fadeInRight">
  	    <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>用户体验结构</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div style="height:500px" id="userexp"></div>
                    </div>
                </div>
            </div>
        </div>
  	</div>
  	
  	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
  	
   	<script type="text/javascript">
   	var ueChart = echarts.init(document.getElementById('userexp'),'macarons');
    var size = 80;
    var yy = 100;
    var yy1 = 250;
    ueChart.setOption ({
        backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
            offset: 0,
            color: '#f7f8fa'
        }, {
            offset: 1,
            color: '#cdd0d5'
        }]),
        title: {
            subtext: "体验值：1~10",
            text: "用户体验结构",
            top: "top",
            left: "left"
        },
        tooltip: {},
        legend: [{
            /*formatter: function(name) {
                return echarts.format.truncateText(name, 40, '14px Microsoft Yahei', '…');
            },*/
            tooltip: {
                show: true
            },
            selectedMode: 'false',
            top: 60,
            //left:60,
            //width:"90%",
            data: ['进入首页', '选择商品', '添加购物车', '结算购物车', '生成订单']
        }],
        toolbox: {
            show: true,
            feature: {
    
                restore: {
                    show: true
                },
                saveAsImage: {
                    show: true
                }
            }
        },
        animationDuration: 3000,
        animationEasingUpdate: 'quinticInOut',
        series: [{
            name: '用户体验',
            type: 'graph',
            layout: 'force',
            force: {
                //initLayout: ...,
                repulsion: 500,
                gravity: 0.1,
                edgeLength: 30,
                layoutAnimation: true,
            },
    
    
            data: [
               {
                x: 100,
                y: yy,
                "name": "进入首页",
                "symbolSize": size,
                "category": "进入首页",
                "draggable": "true",
                "value": 1
            }, {
                x: 100,
                y: yy,
                "name": "选择商品",
                "symbolSize": size,
                "category": "选择商品",
                "draggable": "true",
                "value": 1
            },{
                x: 100,
                y: yy,
                "name": "添加购物车",
                "symbolSize": size,
                "category": "添加购物车",
                "draggable": "true",
                "value": 1
            },{
                x: 100,
                y: yy,
                "name": "结算购物车",
                "symbolSize": size,
                "category": "结算购物车",
                "draggable": "true",
                "value": 1
            }, {
                x: 500,
                y: yy,
                "name": "生成订单",
                "symbolSize": size,
                "category": "生成订单",
                "draggable": "true",
                "value": 1
            } ,{
                x: 100,
                y: 100,
                "name": "登录",
                "symbolSize": 50,
                "category": "添加购物车",
                "draggable": "true",
                "value": 1
            },{
                x: 100,
                y: 100,
                "name": "开始",
                "symbolSize": 50,
                "category": "进入首页",
                "draggable": "true",
                "value": 1
            },{
                x: 100,
                y: 100,
                "name": "结束",
                "symbolSize": 50,
                "category": "生成订单",
                "draggable": "true",
                "value": 1
            }],
            links: [
               {
                "source": "开始",
                "target": "进入首页"
            },{
                "source": "进入首页",
                "target": "选择商品"
            },{
                "source": "选择商品",
                "target": "添加购物车"
            },{
                "source": "添加购物车",
                "target": "结算购物车"
            },{
                "source": "结算购物车",
                "target": "生成订单"
            },{
                "source": "添加购物车",
                "target": "登录"
            },{
                "source": "登录",
                "target": "结算购物车"
            },{
                "source": "生成订单",
                "target": "结束"
            },{
                "source": "生成订单",
                "target": "进入首页"
            }
            ],
            categories: [
            {
                'name': '进入首页'
            }, {
                'name': '选择商品'
            }, {
                'name': '添加购物车'
            }, {
                'name': '结算购物车'
            },{
                'name': '生成订单'
            }],
            //focusNodeAdjacency: true,
            roam: false,
            label: {
                normal: {
    
                    show: true,
                    position: 'inside',
                    formatter: '{b}\n体验值：{c}',
                    fontSize: 16,
                    fontStyle: '600',
    
                }
            },
            lineStyle: {
                normal: {
                    width: 6,
                    color: 'source',
                    curveness: 0,
                    type: "solid"
                }
            }
        }]
    });
	</script>
   	
  </body>
</html>
