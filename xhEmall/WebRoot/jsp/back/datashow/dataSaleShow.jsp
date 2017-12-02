<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品销量排行</title>
    
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
  	
  	<!-- <div class="wrapper wrapper-content animated fadeInRight">
  		<div class="row">
  			<div class="col-sm-12">
			  	<div style="width: 100%;height:400px;" id="saleshow" class="ibox-tools"></div>
			  	<div class="col-sm-12 col-sm-offset-5">                              
		            <input type="button" class="btn btn-primary" value="CHANGE" id="btn_id"/>
		            <input type="button" class="btn btn-primary" value="RESHOW" id="btn_id1"/>                  
			    </div>
		    </div>
	    </div>	
  	</div> -->
  		<div class="wrapper wrapper-content animated fadeInRight">
  	    <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品销量排行</h5>
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
                        <div style="width: 100%;height:400px;" id="saleshow" class="ibox-tools"></div>
					  	<div class="col-sm-12 col-sm-offset-5">                              
				            <input type="button" class="btn btn-primary" value="CHANGE" id="btn_id"/>
				            <input type="button" class="btn btn-primary" value="RESHOW" id="btn_id1"/>                  
					    </div>
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
   	var sChart = echarts.init(document.getElementById('saleshow'),'infographic');
   	sChart.showLoading();
   	sChart.setOption({
        title: {
            text: '每月商品销量排行',
            left: '50%',
            textAlign: 'center'
        },
        grid: {
            left: 0,
            right: 20,
            bottom: 100,
            top: 30
        },
        tooltip: {
            formatter: function(params) {
                if (params.componentSubType == 'pictorialBar') {
                    return '商品名称：' + params.name + '</br> 销售数量：' + params.value;
                }
            }
        },
        xAxis: {
            data: []
        },
        yAxis: {
            splitLine: {
                show: false
            },
            axisLine: {
                show: false
            }
        },
        series: [{
            type: 'bar',
            barWidth: 1,
            data: [],
            animationDelay: function(idx) {
                return idx * 100;
            }
        }, {
            type: 'pictorialBar',
            symbolPosition: 'end',
            symbolRotate: 30,
            symbolOffset: ['20%', '100%'],
            data: [],
            animationDelay: function(idx) {
                return idx * 100 + 500;
            }
        }]
    });
	
	var pics =[];
    var pics1 =[];
	$.ajax({
	    type: "post",
	    async: true, //异步执行
	    url: "${pageContext.request.contextPath }/analysis/saleCount.action",
	    data:{},
	    dataType: "json",
	    success: function(result) {
	    	if (result.length >0 ) {
		        for (var i = 0; i < result.length; i++) {
		            pics.push({
		                value: result[i].salecount*1,
		                symbol: 'image://'+'${pageContext.request.contextPath }'+result[i].pimg,
		                symbolSize: ['48.75', '75'],
		                name: result[i].pname
		            });
		            pics1.push({
		                value: (result[i].salecount*1-20),
		                symbol: 'image://'+'${pageContext.request.contextPath }'+result[i].pimg,
		                symbolSize: ['48.75', '75'],
		                name: result[i].pname
		            });
		        sChart.hideLoading();
		        sChart.setOption({
		        	series: [
		        	         {name:'bar',data:pics},
		        	         {name:'pictorialBar',data:pics}
	                 ]
		        });
		      
		      $("#btn_id").on("click", function(){
		    	  sChart.hideLoading();
			      sChart.setOption({
			    	  tooltip: {
			              formatter: function(params) {
			                  if (params.componentSubType == "pictorialBar") {
			                      return '商品名称：' + params.name + '</br> 销售数量：' + (params.value*1+20);
			                  }
			              }
			          },
			        	series: [
		        	         {name:'bar',data:pics1},
		        	         {
		        	        	 name:'pictorialBar',
		        	             data:pics1,
		        	             symbolRotate:165
		        	         }
		                 ]
			        });
		     });
		      
		      $("#btn_id1").on("click", function(){
		    	  sChart.hideLoading();
			      sChart.setOption({
			    	  tooltip: {
			              formatter: function(params) {
			                  if (params.componentSubType == 'pictorialBar') {
			                      return '商品名称：' + params.name + '</br> 销售数量：' +params.value;
			                  }
			              }
			          },series: [
		        	         {name:'bar',data:pics},
		        	         {
		        	        	 name:'pictorialBar',data:pics,
		        	        	 symbolRotate:30
		        	       	 }
		                 ]
			        });
			 });
	        }
	    }
	    },
	    error: function (errorMsg) {
  			alert("请求失败!");
  		}
	});
	</script>
   	
  </body>
</html>
