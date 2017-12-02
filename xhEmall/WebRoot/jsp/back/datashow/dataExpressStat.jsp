<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>快递占比统计</title>
    
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
	<!-- echart -->
	<script src="resource/js/echarts/echarts.js"></script>		
  </head>
  
  <body class="gray-bg">
  	<script src="resource/js/echarts/shine.js"></script>
  	<script src="resource/js/echarts/infographic.js"></script>
  	<script src="resource/js/echarts/dark.js"></script>
  	<script src="resource/js/echarts/macarons.js"></script>
  	<script src="resource/js/echarts/roma.js"></script>
  	<script src="resource/js/echarts/vintage.js"></script>
  	
	<!-- <div style="width:100%;height:400px" id="echart"></div> -->
	
	<div class="wrapper wrapper-content animated fadeInRight">       
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>快递占比环饼图</h5>
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
                        <div style="height:600px" id="echart"></div>
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
	var eChart = echarts.init(document.getElementById('echart'),'shine');
	eChart.showLoading();
	eChart.setOption({
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        x: 'left',
	        data:[]
	    },
	    series: [
	        {
	            name:'邮寄方式',
	            type:'pie',
	            selectedMode: 'single',
	            radius: [0, '30%'],

	            label: {
	                normal: {
	                    position: 'inner'
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[]
	        },
	        {
	            name:'邮寄方式1',
	            type:'pie',
	            radius: ['40%', '55%'],
	            label: {
	                normal: {
	                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
	                    backgroundColor: '#eee',
	                    borderColor: '#aaa',
	                    borderWidth: 1,
	                    borderRadius: 4,
	                    rich: {
	                        a: {
	                            color: '#999',
	                            lineHeight: 22,
	                            align: 'center'
	                        },
	                        hr: {
	                            borderColor: '#aaa',
	                            width: '100%',
	                            borderWidth: 0.5,
	                            height: 0
	                        },
	                        b: {
	                            fontSize: 16,
	                            lineHeight: 33
	                        },
	                        per: {
	                            color: '#eee',
	                            backgroundColor: '#334455',
	                            padding: [2, 4],
	                            borderRadius: 2
	                        }
	                    }
	                }
	            },
	            data:[]
	        }
	    ]
	});
	
	//ajax请求数据
	var expressname=[];    //类别数组（实际用来盛放X轴坐标值）
    var expresscount=[];
	$.ajax({
		type: "post",
		async: true, //异步执行
		url: "${pageContext.request.contextPath }/analysis/expressCount.action",
		data:{},
		dataType: "json", //返回数据形式为json
		success: function (result) {
		if (result!=undefined && result.length >0 ) {
			//将返回的category和series对象赋值给options对象内的category和series
			//alert(result);
			for(var i=0;i<result.length;i++){
				expressname.push(result[i].shoppingname);
            }

            for(var i=0;i<result.length;i++){
            	expresscount.push({
                     name:result[i].shoppingname,
                     value:result[i].expcount,
                 });
             }
            eChart.hideLoading();      //加载动画
            eChart.setOption({        //加载数据图表
                 legend: [
                     {data: expressname}
                 ], 
                 series: [
                    	 {name: '邮寄方式',data: expresscount},
                         {name: '邮寄方式1',data: expresscount}
                 ]
            });
		}
		},
		error: function (errorMsg) {
			alert("请求失败!");
		}
		});

	</script>
	
	
  </body>
</html>
