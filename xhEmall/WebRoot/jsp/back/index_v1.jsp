<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>主页1</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="resource/js/echarts/echarts.js"></script>   

    <link rel="shortcut icon" href="favicon.ico"> <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Morris -->
    <link href="resource/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="resource/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
	<script src="resource/js/echarts/shine.js"></script>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">月</span>
                        <h5>销售额</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><span id="income"></span></h1>
                        <div class="stat-percent font-bold text-success"><font id="incomep"></font>%<i class="fa fa-bolt"></i>
                        </div>
                        <small>总销售额</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">全年</span>
                        <h5>订单</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="ordercountnum"></h1>
                        <div class="stat-percent font-bold text-info"><font id="orderp"></font>% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新订单</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">今天</span>
                        <h5>访客</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="todayCumstor"></h1>
                       <!--  <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                        </div> -->
                        <small>今日访客</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-danger pull-right">今天</span>
                        <h5>今日销售额</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><span id="incomeday"></span></h1>
                        <!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                        </div> -->
                        <small>today</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订单：下单量-成交量</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="flot-chart" id="main">
                                    <!-- <div class="flot-chart-content" style="width: 800px;height:200px;" ></div> -->
                                </div>
                            </div>
                            <div class="col-sm-3">                               
                                <div class="flot-chart" id="piemain">
                                </div>   
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row m-t-lg">
            <div class="col-sm-12">
                <div class="ibox-content">
                    <h2>世界地图</h2>
                    <small>中国地图或者省份地图可使用百度前端团队提供的echarts.js。<a href="graph_echarts.html">百度ECharts</a></small>
                    <div id="world-map" style="height: 300px;"></div>
                </div>
            </div>
        </div>
    </div>

    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/flot/jquery.flot.js"></script>
    <script src="resource/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="resource/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="resource/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="resource/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="resource/js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="resource/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="resource/js/demo/peity-demo.min.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="resource/js/plugins/easypiechart/jquery.easypiechart.js"></script>
    <script src="resource/js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="resource/js/demo/sparkline-demo.min.js"></script>
    <script>
        $(document).ready(function(){
        $(".chart").easyPieChart({barColor:"#f8ac59",scaleLength:5,lineWidth:4,size:80});
        $(".chart2").easyPieChart({barColor:"#1c84c6",scaleLength:5,lineWidth:4,size:80});
        var data2=[[gd(2012,1,1),7],[gd(2012,1,2),6],[gd(2012,1,3),4],[gd(2012,1,4),8],[gd(2012,1,5),9],[gd(2012,1,6),7],[gd(2012,1,7),5],[gd(2012,1,8),4],[gd(2012,1,9),7],[gd(2012,1,10),8],[gd(2012,1,11),9],[gd(2012,1,12),6],[gd(2012,1,13),4],[gd(2012,1,14),5],[gd(2012,1,15),11],[gd(2012,1,16),8],[gd(2012,1,17),8],[gd(2012,1,18),11],[gd(2012,1,19),11],[gd(2012,1,20),6],[gd(2012,1,21),6],[gd(2012,1,22),8],[gd(2012,1,23),11],[gd(2012,1,24),13],[gd(2012,1,25),7],[gd(2012,1,26),9],[gd(2012,1,27),9],[gd(2012,1,28),8],[gd(2012,1,29),5],[gd(2012,1,30),8],[gd(2012,1,31),25]];
        var data3=[[gd(2012,1,1),800],[gd(2012,1,2),500],[gd(2012,1,3),600],[gd(2012,1,4),700],[gd(2012,1,5),500],[gd(2012,1,6),456],[gd(2012,1,7),800],[gd(2012,1,8),589],[gd(2012,1,9),467],[gd(2012,1,10),876],[gd(2012,1,11),689],[gd(2012,1,12),700],[gd(2012,1,13),500],[gd(2012,1,14),600],[gd(2012,1,15),700],[gd(2012,1,16),786],[gd(2012,1,17),345],[gd(2012,1,18),888],[gd(2012,1,19),888],[gd(2012,1,20),888],[gd(2012,1,21),987],[gd(2012,1,22),444],[gd(2012,1,23),999],[gd(2012,1,24),567],[gd(2012,1,25),786],[gd(2012,1,26),666],[gd(2012,1,27),888],[gd(2012,1,28),900],[gd(2012,1,29),178],[gd(2012,1,30),555],[gd(2012,1,31),993]];
        var dataset=[{label:"订单数",data:data3,color:"#1ab394",bars:{show:true,align:"center",barWidth:24*60*60*600,lineWidth:0}},{label:"付款数",data:data2,yaxis:2,color:"#464f88",lines:{lineWidth:1,show:true,fill:true,fillColor:{colors:[{opacity:0.2},{opacity:0.2}]}},splines:{show:false,tension:0.6,lineWidth:1,fill:0.1},}];
        var options={xaxis:{mode:"time",tickSize:[3,"day"],tickLength:0,axisLabel:"Date",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:"Arial",axisLabelPadding:10,color:"#838383"},yaxes:[{position:"left",max:1070,color:"#838383",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:"Arial",axisLabelPadding:3},{position:"right",clolor:"#838383",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:" Arial",axisLabelPadding:67}],legend:{noColumns:1,labelBoxBorderColor:"#000000",position:"nw"},grid:{hoverable:false,borderWidth:0,color:"#838383"}};
        function gd(year,month,day){return new Date(year,month-1,day).getTime()}var previousPoint=null,previousLabel=null;
        /* $.plot($("#flot-dashboard-chart"),dataset,options); */
        var mapData={"US":298,"SA":200,"DE":220,"FR":540,"CN":120,"AU":760,"BR":550,"IN":200,"GB":120,};$("#world-map").vectorMap({map:"world_mill_en",backgroundColor:"transparent",regionStyle:{initial:{fill:"#e4e4e4","fill-opacity":0.9,stroke:"none","stroke-width":0,"stroke-opacity":0}},series:{regions:[{values:mapData,scale:["#1ab394","#22d6b1"],normalizeFunction:"polynomial"}]},})
        
        var d=new Date();
		var day=d.getDate();
		var month=d.getMonth();
		var year=d.getFullYear();
        
		$.ajax({
	    	url:"${pageContext.request.contextPath}/indexCount/incomeCount.action",
			type:"GET",
			success:function(result){
				console.log(result);
				$("#income").html(result.incomeCount);
				$("#incomeday").html(result.incomeCountDay);
				$("#ordercountnum").html(result.orderCountNum);
				$("#incomep").html(result.incomePercent);
				$("#orderp").html(result.orderPercent);
				$("#nday").html(month + "/" + day);
			}
	    });
		
		$.ajax({
			url:"${pageContext.request.contextPath}/report/overview.action",
			type:"GET",
			success:function(result){
				console.log(result);
				$("#todayCumstor").html(result.body.data[0].result.items[1][1][2]);
				
				}
			});
        });
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    
    <script type="text/javascript">
   		 var myChart = echarts.init(document.getElementById('main'),'shine');
   		 
         // 显示标题，图例和空的坐标轴
         myChart.setOption({
             tooltip: {
             	trigger:"axis"
             },
             legend: {
                 data:['下单量','成交量']
             },
             xAxis: {
                 data: [],
                 axisLine: {
					show:false,
               	 },
               	 axisTick:{
               		show:false,
               }
             },
             yAxis: {
				axisLine: {
					show:false,
               },
               axisTick:{
               		show:false,
               }
             },
             grid:{
             	left:40,
             	top:20,
             	right:20,
             	bottom:20
             },
             series: [
             {
                 name: '下单量',
                 type: 'bar',
                 data: [],
	             itemStyle: {
	                normal: {
	                    color: '#A3E1D4',                   
	                } 
	             }
             },
             {
                 name: '成交量',
                 type: 'line',
                 smooth:true,
                 symbol:'none',
                 data: [],
	             itemStyle: {
	                normal: {
	                    color: '#1C84C6',  
	                    areaStyle: {
	                    	type: 'default'
	                    },                 
	                } 
	             }
             }
             ]
         });
         
         myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
         
         var day=[];    //类别数组（实际用来盛放X轴坐标值）
         var nums=[];    //销量数组（实际用来盛放Y坐标值
         var paynums=[];
         
         $.ajax({
         	type : "post",
         	async : true,//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         	url : "${pageContext.request.contextPath}/indexCount/orderCount.action",
         	data : {},
         	dataType : "json",
         	success : function(result){
         		if(result){
         			for(var i = 0;i < result.length;i++){
         				day.push(result[i].xhday);
         			}
         			for(var i = 0;i < result.length;i++){
         				nums.push(result[i].ordercount);
         			}
         			for(var i = 0;i < result.length;i++){
         				paynums.push(result[i].orderpaycount);
         			}
         			myChart.hideLoading();    //隐藏加载动画
         			myChart.setOption({        //加载数据图表
                        xAxis: {
                            data: day
                        },
                        series: [
                        {
                            // 根据名字对应到相应的系列
                            name: '下单量',
                            data: nums
                        },
                        {
                            // 根据名字对应到相应的系列
                            name: '成交量',
                            data: paynums
                        },
                        ]
                    });
         		}
         		
         	},
         	error : function(errorMsg) {
             //请求失败时执行该函数
	         alert("图表请求数据失败!");
	         myChart.hideLoading();
	         }         	
         });
   	</script>
   	
   	<script type="text/javascript">
   		 var myChartPie = echarts.init(document.getElementById('piemain'),'shine');
   		 
         // 显示标题，图例和空的坐标轴
         myChartPie.setOption({
         	title: {
                 text: '付款比'
             },
         	textStyle: {
		        color: '#000000'
		    },		    
         	tooltip: {
             	
             },            
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius: '60%',
		            data:[],
		            labelLine: {
		                normal: {
		                    lineStyle: {
		                        color: '#000000'
		                    }
		                }
		            },
		        }
		    ]
		})
         
         myChartPie.showLoading();    //数据加载完之前先显示一段简单的loading动画
         
         var arrays = new Array();
         
         $.ajax({
         	type : "post",
         	async : true,//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         	url : "${pageContext.request.contextPath}/indexCount/orderCountForPie.action",
         	data : {},
         	dataType : "json",
         	success : function(result){
         		if(result){
         			for(var i = 0;i < result.length;i++){
         				if(result[i].payStatus==1){
         					arrays[i] = {
	         					value:result[i].ordercount,
	         					name:'已付款',
	         					itemStyle: {
							        normal: {
							            color: '#A3E1D4'
							        }
							    }
         					}
         				}else{
         					arrays[i] = {
	         					value:result[i].ordercount,
	         					name:'未付款',
	         					itemStyle: {
					                normal: {
					                    color: '#1C84C6',                 
					                } 
				             	}
         					}
         				}        				
         			}
         			myChartPie.hideLoading();    //隐藏加载动画
         			myChartPie.setOption({        //加载数据图表

                        series: [{
                            // 根据名字对应到相应的系列
                            name: '访问来源',
                            data: arrays
                        }]
                    });
         		}
         		
         	},
         	error : function(errorMsg) {
             //请求失败时执行该函数
	         alert("图表请求数据失败!");
	         myChart.hideLoading();
	         }
         	
         })
   	</script>
    
</body>
	
</html>
