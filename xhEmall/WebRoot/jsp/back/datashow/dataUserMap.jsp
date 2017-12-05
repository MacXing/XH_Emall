<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员分布统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <h5>中国地图</h5>
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
                        <div style="width: 100%;height:600px" id="usermap"></div>
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
		           	if(result[i].province==null){
		           		result[i].province="";
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
