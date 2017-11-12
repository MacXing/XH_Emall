<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>促销管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
		
	<link href="resource/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="resource/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
    <div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>进出货操作</h5>
            <div class="ibox-tools">            	
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="refresh">
                    <i class="fa fa-refresh"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="table_data_tables.html#">选项1</a>
                    </li>
                    <li><a href="table_data_tables.html#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">        
            <table class="table table-striped table-bordered table-hover dataTables-example text-center">
                <thead>
                    <tr>
                        <th class="text-center">商品编号</th>
                        <th class="text-center">商品图片</th>
                        <th class="text-center">品牌</th>
                        <th class="text-center">商品名称</th>
                        <th class="text-center">商品定价</th>
                        <th class="text-center">商品售价</th>
                        <th class="text-center">大小</th>
                        <th class="text-center">单位</th>
                        <th class="text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${xhproducts }" var="product">
					<tr>
						<td>${product.pid }</td>
						<td>
			    			<a class="fancybox" title="商品图片"
			    			   href="${pageContext.request.contextPath }/upload/${product.pimg}">
	                        <img style="width:80px"; 
	                        	 src="${pageContext.request.contextPath }/upload/${product.pimg}" />
	                        </a>	                        
			    		</td>
						<td>${product.brand.brandname }</td>
						<td>${product.pname }</td>
						<td>${product.pprice }</td>
						<td>${product.psale }</td>
						<td>${product.psize }</td>
						<td>${product.punit }</td>						
						<td><button class="btn btn-primary btn-circle" onclick="inbtn(${product.pid })" 
									type="button" data-toggle="modal" data-target="#stockin">
							<i class="glyphicon glyphicon-plus"></i>
                            </button>
                            <button class="btn btn-danger btn-circle" onclick="outbtn(${product.pid })"
                            		type="button" data-toggle="modal" data-target="#stockout">
                            <i class="glyphicon glyphicon-minus"></i>
                            </button>
                        </td>							    		
					</tr>
					</c:forEach>
                </tbody>
            </table>                      		
    	</div>
    	
    	<!-- 进货模态框 -->
    	<div class="modal inmodal" id="stockin" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content animated bounceInRight col-sm-16">
	        <div class="modal-header">
	            <button type="button" class="close refresh" data-dismiss="modal">
	            	<span aria-hidden="true">×</span>
	            	<span class="sr-only">关闭</span>
	            </button>
	            <!-- <i class="fa fa-laptop modal-icon"></i> -->
	            <h4 class="modal-title">进货操作</h4>                                                         
	        </div>	        
	        <!-- <small class="font-bold"> --> 
	        <form class="form-horizontal" id="inform">                                   
            <div class="modal-body">
            	<input type="hidden" name="pid" id="pid" value="">
            	<div class="form-group">
					<label class="col-sm-4 control-label">选择仓库：</label>
					<div class="col-md-5">
						<select class="form-control" name="repid" id="repertoryin">						                       
                        </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">进货日期：</label>					
					<div class="col-md-5">
						<input type="text" name="inputtime" id="querydatein" placeholder="请选择进货日期" 
							   class="form-control">
					</div>
				</div>
            	<div class="form-group">
					<label class="col-sm-4 control-label">进货数量：</label>					
					<div class="col-md-5">
						<input type="text" id="inputnumber" name="inputnumber" placeholder="请输入进货商品的数量"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">进货价格：</label>					
					<div class="col-md-5">
						<input type="text" id="inputprice" name="inputprice" placeholder="请输入进货商品的价格"
							class="form-control">
					</div>
				</div>														                                       	
            </div>
            <div class="modal-footer">
            	<div class="form-group" align=center>
				<div style="width:300px">
					<button class="btn btn-primary btn-rounded btn-block demo2"
						type="button" id="subin">
					<i class="fa fa-check"></i> 确认
					</button>
				</div>
				</div>    
            </div>                                    	       
	        </form>                                    
        </div>
       	<small class="font-bold"></small>
        </div>
        <small class="font-bold"></small>
        </div>
        
        <!-- 出货模态框 -->
        <div class="modal inmodal" id="stockout" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content animated bounceInRight col-sm-16">
	        <div class="modal-header">
	            <button type="button" class="close refresh" data-dismiss="modal">
	            	<span aria-hidden="true">×</span>
	            	<span class="sr-only">关闭</span>
	            </button>
	            <!-- <i class="fa fa-laptop modal-icon"></i> -->
	            <h4 class="modal-title">出货操作</h4>                                                         
	        </div>	        
	        <!-- <small class="font-bold"> --> 
	        <form class="form-horizontal" id="outform">                                   
            <div class="modal-body">
            	<input type="hidden" name="pid" id="pidout" value="">
            	<div class="form-group">
					<label class="col-sm-4 control-label">选择出货仓库：</label>
					<div class="col-md-5">
						<select class="form-control" name="repid" id="repertoryout">						                       
                        </select>
                        <span class="help-block m-b-none">仅显示有该商品库存的仓库</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">选择到货仓库：</label>
					<div class="col-md-5">
						<select class="form-control" name="repid2" id="repertoryout2">						                       
                        </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">出货日期：</label>					
					<div class="col-md-5">
						<input type="text" name="outputtime" id="querydateout" placeholder="请选择进货日期" 
							   class="form-control">
					</div>
				</div>
            	<div class="form-group">
					<label class="col-sm-4 control-label">出货数量：</label>					
					<div class="col-md-5">
						<input type="text" id="outputnumber" name="outputnumber" placeholder="请输入进货商品的数量"
							class="form-control">
					</div>
				</div>																		                                       	
            </div>
            <div class="modal-footer">
            	<div class="form-group" align=center>
				<div style="width:300px">
					<button class="btn btn-primary btn-rounded btn-block demo2"
						type="button" id="subout">
					<i class="fa fa-check"></i> 确认
					</button>
				</div>
				</div>    
            </div>                                    	       
	        </form>                                    
        </div>
       	<small class="font-bold"></small>
        </div>
        <small class="font-bold"></small>
        </div>
    	
    </div>
    </div>
    </div>
    </div>
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="resource/js/plugins/fancybox/jquery.fancybox.js"></script>
     <script type="text/javascript" src="resource/js/validate.js"></script>
 
	 <script>
	 //进货
	 	 $("#subin").click(function (){
		
			var val = new validate({
			
				rules:{
					inputnumber:"notEmpty",   
					inputprice:"money",					 	
				},
				/*submitFun里面为检验成功后要执行的方法*/
				submitFun:function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addInput.action",
				type : "POST",
				data : $("#inform").serialize(),	
				success:function(result){
					if(result.code==100){						
						swal({
						title : "操作成功",
						text : "点击ok返回继续操作",
						type : "success"
						},
						function(isConfirm){
							window.location.href="${pageContext.request.contextPath}/repertory/queryAllProduct.action";
						}); 
					}else{
						swal({
						title : "操作失败",
						text : "进货量不能为空",
						type : "error"
						});
					}
				}		
			});
			}
	});
	});
	
	//出货
	 $("#subout").click(function (){
		
			var val = new validate({
			
				rules:{
					outputnumber:"notEmpty",   
									 	
				},
				/*submitFun里面为检验成功后要执行的方法*/
				submitFun:function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addOutput.action",
				type : "POST",
				data : $("#outform").serialize(),
				success:function(result){
					if(result.code==100){						
						swal({
						title : "操作成功",
						text : "点击ok返回继续操作",
						type : "success"
						},
						function(isConfirm){
							window.location.href="${pageContext.request.contextPath}/repertory/queryAllProduct.action";
						}); 
					}else{
						swal({
						title : "操作失败",
						text : "出货数量超出所选仓库库存或出货量为空",
						type : "error"
						});
					}
				}							
			});
			}
	});
	});
	
	</script>
    
    <script>
        $(document).ready(function(){
        
        $(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    	$(".fancybox").fancybox({openEffect:"none",closeEffect:"none"});
    </script>
    
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	
	<!-- 刷新页面 -->
	<script type="text/javascript">
		$(".refresh").on("click",function(){
			self.location.reload();
		});
	</script>
	
	<script src="resource/laydate/laydate.js"></script>
	<script>
		//执行一个laydate实例
		laydate.render({
		  elem: '#querydatein' //指定元素
		});
	</script>
	
	<script>
		//执行一个laydate实例
		laydate.render({
		  elem: '#querydateout' //指定元素
		});
	</script>
	
	<!-- 在下拉框中插入数据（进货） -->
	<script type="text/javascript">
		function inbtn(pid){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/repertory/queryRepertory.action",
				type:"GET",
				success:function(result){
     			$.each(result,function(index,item){
     				 var option=$("<option value='"+item.repid+"'></option>").append(item.repname);
     				 option.appendTo(repertoryin);    				 
     			});
     			$("#pid").attr("value",pid);
     			}   			
			});
		}
	</script>
	
	<!-- 在下拉框中插入数据（出货） -->
	<script type="text/javascript">
		function outbtn(pid){
			$.ajax({
				url:"${pageContext.request.contextPath}/repertory/queryRepertoryByPid.action?pid="+pid,
				type:"GET",
				success:function(result){
     			$.each(result,function(index,item){
     				 var option=$("<option value='"+item.repid+"'></option>").append(item.repname);
     				 option.appendTo(repertoryout);    				 
     			});
     			$("#pidout").attr("value",pid);
     			setSelectChecked("repertoryout2");
     			}   			
			});
			
			$.ajax({
				url:"${pageContext.request.contextPath}/repertory/queryRepertory.action",
				type:"GET",
				success:function(result){
     			$.each(result,function(index,item){
     				 var option=$("<option value='"+item.repid+"'></option>").append(item.repname);
     				 option.appendTo(repertoryout2);    				 
     			});    			
     			}   			
			});			
		}
		function setSelectChecked(repertoryout2){  
		    var select = document.getElementById(repertoryout2);  
		    for(var i=0; i<select.options.length; i++){  
		        if(select.options[i].innerHTML == "4号仓库"){  
		            select.options[i].selected = true;  
		            break;  
		        }  
		    }  
		};
	</script>
	
	<!-- 进货操作 -->
	<!-- <script type="text/javascript">
		$("#subin").on("click",function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addInput.action",
				type : "POST",
				data : $("#inform").serialize(),	
				success:function(result){
					if(result.code==100){						
						swal({
						title : "操作成功",
						text : "点击ok返回继续操作",
						type : "success"
						},
						function(isConfirm){
							window.location.href="${pageContext.request.contextPath}/repertory/queryAllProduct.action";
						}); 
					}else{
						swal({
						title : "操作失败",
						text : "进货量不能为空",
						type : "error"
						});
					}
				}		
			});
		});
	</script> -->
	
	<!-- 出货操作 -->
	<!-- <script type="text/javascript">
		$("#subout").on("click",function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/repertory/addOutput.action",
				type : "POST",
				data : $("#outform").serialize(),
				success:function(result){
					if(result.code==100){						
						swal({
						title : "操作成功",
						text : "点击ok返回继续操作",
						type : "success"
						},
						function(isConfirm){
							window.location.href="${pageContext.request.contextPath}/repertory/queryAllProduct.action";
						}); 
					}else{
						swal({
						title : "操作失败",
						text : "出货数量超出所选仓库库存或出货量为空",
						type : "error"
						});
					}
				}							
			});
		});
	</script> -->
	
		
</body>

</html>