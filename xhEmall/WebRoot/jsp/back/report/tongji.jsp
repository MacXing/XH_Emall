<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>Reports</title>
 
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="/resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/resource/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/resource/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="/resource/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="/resource/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
    <link href="/resource/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="/resource/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="/resource/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="/resource/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="/resource/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="/resource/css/animate.min.css" rel="stylesheet">
    <link href="/resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">

      <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>今日流量</h5>
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
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>浏览数(PV)</th>
                                    <th>访客数(UV)</th>
                                    <th>IP数</th>                                  
                                    <th>平均时长</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>今日</td>
                                    <td class="center" id="dayPV"></td>
                                    <td class="center" id="dayUV"></td>
                                    <td class="center" id="dayIP"></td>                                  
                                    <td class="center" id="dayTime"></td>
                                </tr>
                               	<tr>
                                    <td>昨日</td>
                                    <td class="center" id="yesterdayPV"></td>
                                    <td class="center" id="yesterdayUV"></td>
                                    <td class="center" id="yesterdayIP"></td>                                  
                                    <td class="center" id="yesterdayTime"></td>
                                </tr>
                            </tbody>
                        </table>     
                    </div>
                </div>
            </div>
		</div>


   
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>浏览量</h5>
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
                    &nbsp;&nbsp; &nbsp; 
	                   <div class="btn-group">
                            <button class="btn btn-outline btn-info active">浏览量(PV)</button> 
                        </div>
                       
                        <div class="echarts" id="line"></div>
                       
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
               <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>访问量</h5>
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
                    &nbsp;&nbsp; &nbsp; 
	                   <div class="btn-group">
                            <button class="btn btn-outline btn-info active">访问量(UV)</button> 
                        </div>
                       
                        <div class="echarts" id="lineUV"></div>
                       
                    </div>
                </div>
            </div>
        </div>
     
        <div class="row" >
            <div class="col-sm-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Top10受访页面</h5>
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
                         <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th>受访页面</th>
                                    <th>PV</th>
                                    <th>占比</th>
                                </tr>
                            </thead>
                            <tbody id="top">
                              
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
            
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新老访客</h5>
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
                         <table class="table">
                            <thead>
                                <tr>
                                    <th><img src="/resource/img/visit-type-icon.png"></th>
                                    <th>
                                    	<font style="font-size:16px">新访客</font><br/>
                                    	<font style="font-size:32px;color: #48cb6d" id="newParcent"></font>
                                    </th>
                                    <th>
                                    	<font style="font-size:16px">老访客</font><br/>
                                    	<font style="font-size:32px;color: #51a8f9" id="oldParcent"></font>
                                    </th>
                                </tr>
                            </thead>
                            <span><br></span>
                         	 <tbody>
                                <tr>
                                    <td>浏览量</td>
                                    <td id="newPV"></td>
                                    <td id="oldPV"></td>
                               
                                </tr>
                                 <tr>
                                    <td>访客数</td>
                                    <td id="newUV"></td>
                                    <td id="oldUV"></td>
                                   
                                </tr>
                                 <tr>
                                    <td>平均访问页数</td>
                                    <td id="newPage"></td>
                                    <td id="oldPage"></td>
 
                                </tr>
                                 <tr>
                                    <td>平均访问时间</td>
                                    <td id="newTime"></td>
                                    <td id="oldTime"></td>
                                </tr>   
                            </tbody>
                        </table>  
                    </div>
                </div>
            </div> 
          </div>
          <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>地域分析</h5>
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
                        <div class="echarts" id="map" style="height:500px"></div>
                    </div>
                </div>
            </div>
        </div>

        </div>
       
     
    <script src="/resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="/resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/resource/js/plugins/echarts/echarts.min.js"></script>
    <script src="/resource/js/content.min.js?v=1.0.0"></script>
    <script src="/resource/js/echarts/china.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!-- 
    	今日概况
     -->
    <script type="text/javascript">
	    $(document).ready(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/report/overview.action",
				type:"GET",
				success:function(result){
					
					$("#dayPV").html(result.body.data[0].result.items[1][1][0]);
					$("#dayUV").html(result.body.data[0].result.items[1][1][1]);
					$("#dayIP").html(result.body.data[0].result.items[1][1][2]);
					
					if(result.body.data[0].result.items[1][1][3]=="--"){
						$("#dayTime").html("--");
					}else{
						$("#dayTime").html(formatTime(result.body.data[0].result.items[1][1][3]));
					}
					
					$("#yesterdayPV").html(result.body.data[0].result.items[1][0][0]);
					$("#yesterdayUV").html(result.body.data[0].result.items[1][0][1]);
					$("#yesterdayIP").html(result.body.data[0].result.items[1][0][2]);
					if(result.body.data[0].result.items[1][0][3]=="--"){
						$("#yesterdayTime").html("--");
					}else{
						$("#yesterdayTime").html(formatTime(result.body.data[0].result.items[1][0][3]));
					}
						
				}
			});
			
			$.ajax({
				url:"${pageContext.request.contextPath}/report/page.action",
				type:"GET",
				success:function(result){
					 console.log(result);
			
					if(result.body.data[0].result.visitType.newVisitor.ratio>0){
						$("#newParcent").html(result.body.data[0].result.visitType.newVisitor.ratio+'%');
					}else{
						$("#newParcent").html("--");
					}
					
					if(result.body.data[0].result.visitType.oldVisitor.ratio>0){
						$("#oldParcent").html(result.body.data[0].result.visitType.oldVisitor.ratio+'%');
					}else{
						$("#oldParcent").html("--");
					}
					
					
					 if(result.body.data[0].result.visitType.newVisitor.pv_count>0){
						 $("#newPV").html(result.body.data[0].result.visitType.newVisitor.pv_count);
					 }else{
						 $("#newPV").html("--"); 
					 }
					 
					 if(result.body.data[0].result.visitType.oldVisitor.pv_count>0){
						 $("#oldPV").html(result.body.data[0].result.visitType.oldVisitor.pv_count);
					 }else{
						 $("#oldPV").html("--"); 
					 }
					 
					 if(result.body.data[0].result.visitType.newVisitor.visitor_count>0){
						 $("#newUV").html(result.body.data[0].result.visitType.newVisitor.visitor_count);
					 }else{
						 $("#newUV").html("--"); 
					 }
					 
					 if(result.body.data[0].result.visitType.oldVisitor.visitor_count>0){
						 $("#oldUV").html(result.body.data[0].result.visitType.oldVisitor.visitor_count);
					 }else{
						 $("#oldUV").html("--"); 
					 }
					 
					 if(result.body.data[0].result.visitType.newVisitor.bounce_ratio>0){
						 $("#newPage").html(result.body.data[0].result.visitType.newVisitor.bounce_ratio+"%");
						 
					 }else{
						 $("#newPage").html("--"); 
						
					 }
					 
					 if(result.body.data[0].result.visitType.oldVisitor.bounce_ratio>0){
						 $("#oldPage").html(result.body.data[0].result.visitType.oldVisitor.bounce_ratio+"%");
						 
					 }else{
						 $("#oldPage").html("--"); 
						
					 }
					 
					 if(result.body.data[0].result.visitType.newVisitor.avg_visit_time>0){
						 $("#newTime").html(formatTime(result.body.data[0].result.visitType.newVisitor.avg_visit_time));
						
					 }else{
						 $("#newTime").html("--"); 
						
					 }
					 
					 if(result.body.data[0].result.visitType.oldVisitor.avg_visit_time>0){
						 $("#oldTime").html(formatTime(result.body.data[0].result.visitType.oldVisitor.avg_visit_time));
						
					 }else{
						 $("#oldTime").html("--"); 
						
					 }
					var con="";
					$.each(result.body.data[0].result.visitPage.items,function(index,data){
						var tr = "<tr>";
						var td = "<td>"+data[0]+"</td>";
						var td2 = "<td>"+data[1]+"</td>";
						var td3 = "<td>"+data[2]+'%'+"</td>";
                        var tr2="</tr>";
              			var css = tr+td+td2+td3+tr2;
              			
                     	con=con+css;
					});
					$("#top").html(con);
				}
			});
		});
	    
	  
	    
	    function formatTime(seconds) {
	        return [
	            parseInt(seconds / 60 / 60),
	            parseInt(seconds / 60 % 60),
	            parseInt(seconds % 60)
	        ]
	            .join(":")
	            .replace(/\b(\d)\b/g, "0$1");
	    }
	    
	    function fomatFloat(src,pos){   
	        return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos);   
	     } 
    </script>
    <!-- 
    	趋势图
     -->
     <script type="text/javascript">
		 var myChart = echarts.init(document.getElementById('line'));
		 var myChartUV = echarts.init(document.getElementById('lineUV'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            tooltip: {
           	 trigger: 'axis'
            },
            legend:{
            	data:['今日PV','昨日PV']
            },
            xAxis: {
                data: [],
                axisLine: {
					show:false,
              	 },
              	 axisTick:{
              		show:false,
              },
              axisLabel:{
           	   interval:4
              }
            },
            yAxis: {
				axisLine: {
					show:false,
              },
              axisTick:{
              		show:false,
              },
              splitNumber:4
            },
            grid:{
           	left:30,
           	right:20,
           	top:50,
           	bottom:20,
            },
            series: [{
                name: '今日PV',
                type: 'line',
                smooth:true,
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#3cB371',
	                    areaStyle:{
	                    	type:'default'
	                    }
	                } 
	             }
            },
            {
                name: '昨日PV',
                type: 'line',
                smooth:true,
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#1c84c6',
	                    /* areaStyle:{
	                    	type:'default'
	                    } */
	                } 
	             }
            }
            ]
        });
        
        //访问量UV
        myChartUV.setOption({
            tooltip: {
           	 trigger: 'axis'
            },
            legend:{
            	data:['今日UV','昨日UV']
            },
            xAxis: {
                data: [],
                axisLine: {
					show:false,
              	 },
              	 axisTick:{
              		show:false,
              },
              axisLabel:{
           	   interval:4
              }
            },
            yAxis: {
				axisLine: {
					show:false,
              },
              axisTick:{
              		show:false,
              },
              splitNumber:4
            },
            grid:{
           	left:30,
           	right:20,
           	top:50,
           	bottom:20,
            },
            series: [{
                name: '今日UV',
                type: 'line',
           
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#D2691E',
	                    areaStyle:{
	                    	type:'default'
	                    }
	                } 
	             }
            },
            {
                name: '昨日UV',
                type: 'line',
               
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#EE4000',
	                    /* areaStyle:{
	                    	type:'default'
	                    } */
	                } 
	             }
            }
            ]
        });
        
        myChart.showLoading();    	//数据加载完之前先显示一段简单的loading动画
        myChartUV.showLoading();
        
        var nums=[];    
   		var day=[];   				
		var yesterday=[];
		
		var numsUV=[];      				
		var yesterdayUV=[];
   		
        $.ajax({
        	type : "GET",
        	async : true,    		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        	url : "${pageContext.request.contextPath}/report/trend.action",
        	success : function(result){
        		
        		var a= result.extend.data[0].body.data[0].result.items[1].length-1;
        		for(var i=23;i>=0;i--){
        			if( a>=0 && result.extend.data[0].body.data[0].result.items[1][a][0]>0){
        				nums.push(result.extend.data[0].body.data[0].result.items[1][a][0]);
        				numsUV.push(result.extend.data[0].body.data[0].result.items[1][a][1]);
        				a=a-1;
        			}else if(typeof(result.extend.data[0].body.data[0].result.items[1][i])=="undefined"&&isNaN(result.extend.data[0].body.data[0].result.items[1][i])&&!result.extend.data[0].body.data[0].result.items[1][i] ){
        				nums.push(0);
        				numsUV.push(0);
        				a=a-1;
        			}else{
        				nums.push(0);
        				numsUV.push(0);
        				a=a-1;
        			}  			       				
        		}
        		$.each(result.extend.data[1].body.data[0].result.items[1],function(index,item){
        			if(item[0]>0){
        				yesterday.push(item[0]);
        				yesterdayUV.push(item[1]);
        			}else{
        				yesterday.push(0);
        				yesterdayUV.push(0);
        			}
        		});
        			
        		
        		for(var j=0;j<24;j++){	
        			day.push(j);			
        		} 

        		myChart.hideLoading();
        		myChartUV.hideLoading();  //隐藏加载动画
        		myChart.setOption({        //加载数据图表
                xAxis: {
                     data: day
                	}, 
                series: [
                         {
                           // 根据名字对应到相应的系列
                   name: '今日PV',
                   data: nums
                          /*  .reverse() */
                       },
                       {
                    name:'昨日PV',
                    data:yesterday.reverse()
                       }
                ]
        		});
        		
        		myChartUV.setOption({        //加载数据图表
                    xAxis: {
                         data: day
                    	}, 
                    series: [
                             {
                               // 根据名字对应到相应的系列
                       name: '今日UV',
                       data: numsUV
                              /*  .reverse() */
                           },
                           {
                        name:'昨日UV',
                        data:yesterdayUV.reverse()
                           }
                    ]
            		});
            
       		 },
        	 error:function(errorMsg) {
            
	         alert("图表请求数据失败!");
	         	myChart.hideLoading();
	         	myChartUV.hideLoading();
	         }
	});
    </script>
     <!-- 
     	map
      -->
   	<script type="text/javascript">


	
   	</script>
   	<script type="text/javascript">
   	
   	var myChart2 = echarts.init(document.getElementById('map'));
    myChart.showLoading(); 
    

    var arrayPV = new Array();
    var arrayZB = new Array();
	
	$.ajax({
		type:"get",
		async: true, //异步执行
		url: "${pageContext.request.contextPath }/report/area.action",
 		data:{}, 
		dataType: "json", //返回数据形式为json
		success: function (result) {
			console.log(result);
		
			for(var i =0;i<result.body.data[0].result.items[0].length;i++){
				
				arrayPV.push({		
					name:result.body.data[0].result.items[0][i],
					value:result.body.data[0].result.items[1][i][0]
				});
				arrayZB[i]={
						name:result.body.data[0].result.items[0][i],
						value:result.body.data[0].result.items[1][i][1]
				};
			}
		}	
		});		
  		
   		option = {  				 
   			tooltip: {
   				 trigger: 'item',
   				 formatter: '{b}<br/><hr/>{a}:{c} <br/> '
   			},
   				   
   			visualMap: {
   						min: 0,
   				        max: 50,
   				        left: 'left',
   				        top: 'bottom',
   				        text: ['高', '低'],
   				        calculable: true,
   				        inRange: {
   				            color: ['rgb(230, 230, 230)','rgb(56, 135, 224)']
   				        },
   				    },
   				    toolbox: {
   				        show: true,
   				        orient: 'vertical',
   				        left: 'right',
   				        top: 'center',
   				        feature: {
   				            mark: {
   				                show: true
   				            },
   				            dataView: {
   				                show: true,
   				                readOnly: false
   				            },
   				            restore: {
   				                show: true
   				            },
   				            saveAsImage: {
   				                show: true
   				            }
   				        }
   				    },
   				   
   				    series: [{
   				            name: '浏览量pv',
   				            type: 'map',
   				            mapType: 'china',
   				            roam: true,
   				            label: {
   				                normal: {
   				                    show: false
   				                },
   				                emphasis: {
   				                    show: true
   				                }
   				            },
   				            data: arrayPV
   				        }, {
   				            name: '占比',
   				            type: 'map',
   				            mapType: 'china',
   				            label: {
   				                normal: {
   				                    show: false
   				                },
   				                emphasis: {
   				                    show: true
   				                }
   				            },
   				            data: arrayZB
   				        },

   				    ]
   				};
   		alert(arrayPV);
   	myChart2.setOption(option);
   	</script>
    
</body>

</html>