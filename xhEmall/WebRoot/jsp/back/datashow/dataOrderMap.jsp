<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单统计</title>
    
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
	
	<script src="resource/js/echarts/echarts.js"></script>	
	<script src="resource/js/echarts/china.js"></script>

  </head>
  
  <body>
  	<script src="resource/js/echarts/shine.js"></script>
  	<div>
  	<div style="width: 100%;height:400px;" id="ordermap"></div>
  	<div style="width:600px;height:400px" id="echart"></div>
  	</div>
  	
   	<script type="text/javascript">
   		 var oChart = echarts.init(document.getElementById('ordermap'),'shine');  		 
         // 显示标题，图例和空的坐标轴
         oChart.setOption({
		    title: {
		        text: '孝康安老订单销量',
		        subtext: '各省订单销量',
		        left: 'center'
		    },
		    tooltip: {
		    	formatter: "{a} <br/>{b} : {c}",
		    	trigger: 'item'
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: []
		    },
		    visualMap: {
		        min: 0,
		        max: 10,
		        left: 'left',
		        top: 'bottom',
		        text: ['高', '低'], // 文本，默认为数值文本
		        calculable: true
		    },
		    toolbox: {
		        show: true,
		        orient: 'vertical',
		        left: 'right',
		        top: 'center',
		        feature: {
		            dataView: {
		                readOnly: false
		            },
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    series: [{
		        name: '订单数',
		        type: 'map',
		        mapType: 'china',
		        roam: false,
		        label: {
		            normal: {
		                show: true
		            },
		            emphasis: {
		                show: true
		            }
		        },
		        data: []
		    }]
		});

    //ajax请求数据
    //类别数组（实际用来盛放X轴坐标值）
    oChart.showLoading();
    var order=[];
   	$.ajax({
   		type: "post",
   		async: true, //异步执行
   		url: "${pageContext.request.contextPath }/analysis/orderCount.action",
   		data:{},
   		dataType: "json", //返回数据形式为json
   		success: function (result) {
   		if (result.length >0 ) {
   			//将返回的category和series对象赋值给options对象内的category和series
   			//alert(result);
            for(var i=0;i<result.length;i++){
         	   order.push({
                     name:result[i].province.replace('省',''),
                     value:result[i].orderCount
                 });
             }
            oChart.hideLoading();      //隐藏加载动画
            oChart.setOption({        //加载数据图表
                 series: [
                     {
                    	name: '订单数',
         		        type: 'map',
         		        mapType: 'china',
         		        roam: false,
         		        data:order
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
   	
   	<script type="text/javascript">
	var eChart = echarts.init(document.getElementById('echart'),'shine');
	eChart.showLoading();
	eChart.setOption({
		title: {
	        text: '孝康安老快递所占比',
	        subtext: '邮寄方式',
	        left: 'center'
	    },
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
