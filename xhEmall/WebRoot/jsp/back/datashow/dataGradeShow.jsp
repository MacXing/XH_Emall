<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>等级会员统计</title>
    
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
  	
	<div class="wrapper wrapper-content animated fadeInRight">       
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>会员等级占比</h5>
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
	eChart.setOption({
		    title : {
		        text: '用户等级所占比例',
		        x: 'center'
		    },
		    tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: []
		    },
		    series : [
		        {
		            name: '各等级会员人数',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
	
	//ajax请求数据
	var gradename=[];    //类别数组（实际用来盛放X轴坐标值）
    var gradecount=[];
	$.ajax({
		type: "post",
		async: true, //异步执行
		url: "${pageContext.request.contextPath }/analysis/gradeCount.action",
		data:{},
		dataType: "json", //返回数据形式为json
		success: function (result) {
		if (result!=undefined && result.length >0 ) {
			//将返回的category和series对象赋值给options对象内的category和series
			//alert(result);
			for(var i=0;i<result.length;i++){
				gradename.push(result[i].gradename);
            }

            for(var i=0;i<result.length;i++){
            	gradecount.push({
                     name:result[i].gradename,
                     value:result[i].gradecount,
                 });
             }
            eChart.hideLoading();      //加载动画
            eChart.setOption({        //加载数据图表
                 legend: [
                     {data: gradename}
                 ], 
                 series: [
                     {
                    	 name: '等级会员人数',
                         data: gradecount
                     }
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
