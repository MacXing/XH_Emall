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
	<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	
	<script src="resource/js/echarts/echarts.js"></script>	
	<script src="resource/js/echarts/china.js"></script>

  </head>
  
  <body>
  	<script src="resource/js/echarts/shine.js"></script>
  	<script src="resource/js/echarts/infographic.js"></script>
  	<script src="resource/js/echarts/dark.js"></script>
  	<script src="resource/js/echarts/macarons.js"></script>
  	<script src="resource/js/echarts/roma.js"></script>
  	<script src="resource/js/echarts/vintage.js"></script>
  	
  	<div>
  	<div style="width: 100%;height:600px;" id="usermap"></div>
  	<div style="width:600px;height:400px" id="echart"></div>
  	</div>
  	
   	<script type="text/javascript">
   		 var uChart = echarts.init(document.getElementById('usermap'),'infographic');  		 
         // 显示标题，图例和空的坐标轴
         uChart.setOption({
        	 title: {
        	        text: '会员分布图',
        	        subtext: '各等级会员分布',
        	        left: 'center'
       	    },
       	    tooltip: {
       	        trigger: 'item'
       	    },
       	    legend: {
       	        orient: 'vertical',
       	        left: 'left',
       	        data:[]
       	    },
       	    visualMap: {
       	        min: 0,
       	        max: 10,
       	        left: 'left',
       	        top: 'bottom',
       	        text: ['多','少'],           
       	        calculable: true
       	    },
       	    toolbox: {
       	        show: true,
       	        orient: 'vertical',
       	        left: 'right',
       	        top: 'center',
       	        feature: {
       	            dataView: {readOnly: false},
       	            restore: {},
       	            saveAsImage: {}
       	        }
       	    },
       	    roamController: {
       	        show: true,
       	        x: 'right',
       	        mapTypeControl: {
       	            'china': true
       	        }
       	    },
       	   series : [
       	         {
       	            name:'一星级',type: 'map',mapType: 'china', roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[]
       	        },
       	       {
       	            name: '二星级',type: 'map',mapType: 'china', roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[]
       	        },
       	        {
       	            name: '三星级',type: 'map',mapType: 'china', roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[]
       	        },
       	        {
       	            name: '四星级',type: 'map',mapType: 'china', roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[]
       	        },
       	        {
       	            name: '五星级',type: 'map',mapType: 'china', roam: false,
       	            itemStyle:{
       	                normal:{label:{show:true}},
       	                emphasis:{label:{show:true}}
       	            },
       	            data:[]	
       	        }
        	    ]
        	});
	
     //ajax请求数据
     //类别数组（实际用来盛放X轴坐标值）
     uChart.showLoading();
   	 $.ajax({
   		type: "post",
   		async: true, //异步执行
   		url: "${pageContext.request.contextPath }/analysis/userCount.action",
   		data:{},
   		dataType: "json", //返回数据形式为json
   		success: function (result) {
   		if (result.length >0 ) {
  			//将返回的category和series对象赋值给options对象内的category和series
  			//alert(result);
  			var gradename=[];
            
  			for(var i=0;i<result.length;i++){
  				gradename.push(result[i].gradename);
  			}
  			
  			function find(name){
  				var count=[];
				for(var i=0;i<result.length;i++){
					if(result[i].gradename==name){
					if(result[i].province=="内蒙古自治区"||result[i].province=="西藏自治区"){
		           		count.push({
		                       name:result[i].province.replace('自治区',''),
		                       value:result[i].usercount
		                   }); 
		           	}
		           	if(result[i].province=="宁夏回族自治区"){
		           		count.push({
		                       name:result[i].province.replace('回族自治区',''),
		                       value:result[i].usercount
		                   });
		           	}
		           	if(result[i].province=="新疆维吾尔自治区"){
		           		count.push({
		                       name:result[i].province.replace('维吾尔自治区',''),
		                       value:result[i].usercount
		                   });
		           	}
		           	if(result[i].province=="广西壮族自治区"){
		           		count.push({
		                       name:result[i].province.replace('壮族自治区',''),
		                       value:result[i].usercount
		                   });
		           	}
		           	if(result[i].province=="香港特别行政区"||result[i].province=="澳门特别行政区"){
		           		count.push({
		                       name:result[i].province.replace('特别行政区',''),
		                       value:result[i].usercount
		                   });
		           	}
		           	if(result[i].province=="重庆市"||result[i].province=="上海市"){
		           		count.push({
		                       name:result[i].province.replace('市',''),
		                       value:result[i].usercount
		                   });
		           	}
		           	if(result[i].province=="天津市"||result[i].province=="北京市"){
		           		count.push({
		                       name:result[i].province.replace('市',''),
		                       value:result[i].usercount
		                   });
		           	}
		       		count.push({
		                   name:result[i].province.replace('省',''),
		                   value:result[i].usercount
		               });
					}
  				}
				return count;
  			}
			uChart.hideLoading();
  			uChart.setOption({//加载数据图表
  				legend:[
           	 	    {data:gradename}
                 ],
                 series: [
                          {name:'一星级',data:find("一星级")},
                          {name:'二星级',data:find("二星级")},
                          {name:'三星级',data:find("三星级")},
                          {name:'四星级',data:find("四星级")},
                          {name:'五星级',data:find("五星级")}
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
