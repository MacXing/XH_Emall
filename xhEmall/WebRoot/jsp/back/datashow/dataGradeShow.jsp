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
	<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>	
	
	<!-- echart -->
	<script src="resource/js/echarts/echarts.js"></script>		
  </head>
  
  <body>
  	<script src="resource/js/echarts/dark.js"></script>
  	<script src="resource/js/echarts/shine.js"></script>
	<div style="width:100%;height:400px" id="echart"></div>
	
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
