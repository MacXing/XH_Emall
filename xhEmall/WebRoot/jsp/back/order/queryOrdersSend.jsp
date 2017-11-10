<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询发货订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <base target="_blank">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style media ="print" ></style>
	<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0  
                         id= "WebBrowser" name="WebBrowser" width=0></OBJECT>
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订单信息 <small>查找</small></h5>
                        <div class="ibox-tools">
                        	<a class="collapse-link" onclick="userorderhome()">
                                <i class="glyphicon glyphicon-home"></i>
                            </a>
                        	<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>                         
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>                            
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                	<th>订单编号</th>                                  
                                    <th>用户姓名</th>                                  
                                    <th>订单时间</th> 
                                    <th>发货时间</th>                                 
                                    <th>收货人姓名</th>
                                	<th>收货人电话</th>                                                                  
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data">             
                                <c:forEach items="${sendlist }" varStatus="status" var="send">
							    	<tr class="gradeX">
							    		<td>${send.orderid }</td>
							    		<td>${send.users.username }</td>
							    		<td><fmt:formatDate value="${send.ordertime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							    		<td><fmt:formatDate value="${send.sendtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							    		<td>${send.addusername }</td>
							    		<td>${send.addphone }</td>
							    		<td class="text-center">
							    		    <a onclick="btn1(${send.orderid})" data-toggle="modal" data-target="#myModal1" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>							    			
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th>订单编号</th>                                  
                                    <th>用户姓名</th>                                  
                                    <th>订单时间</th> 
                                    <th>发货时间</th>                                 
                                    <th>收货人姓名</th>
                                	<th>收货人电话</th>                                                                  
                                    <th>操作</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">查看详细信息</h4>
		      </div>
		      <div class="modal-body"> 
		        
		        <div class="ibox-content">

                        <table class="table table-bordered">	                           
                            <tbody id="mytable">                    
                                <tr>
                                    <td>用户姓名</td>
                                    <td id="username"></td>
                                    <td>发货时间</td>
                                    <td id="sendtime"></td>
                                </tr>
                                <tr>
                                	<td>订单时间</td>
                                	<td id="ordertime"></td>                                 
                                    <td>订单状态</td>
                                    <td id="orderstatus"></td>
                                </tr>
                                <tr>
                                    <td>邮寄状态</td>
                                    <td id="shoppingstatus"></td>
                                    <td>支付状态</td>
                                    <td id="paystatus"></td>
                                </tr>
                                 <tr>
                                    <td>收货人姓名</td>
                                    <td id="addusername"></td>
                                    <td>收货人电话</td>
                                    <td id="addphone"></td>
                                </tr>
                                 <tr>
                                    <td>国家</td>
                                    <td id="addcountry"></td>
                                    <td>省份</td>
                                    <td id="addprovince"></td>
                                </tr>
                                 <tr>                                    
                                    <td>城市</td>
                                    <td id="addcity"></td>
                                    <td>区</td>
                                    <td id="adddistrict"></td>
                                </tr>
                                <tr>                                    
                                    <td>详细地址</td>
                                    <td id="addaddress"></td>
                                    <td>邮寄编码</td>
                                    <td id="shoppingcode"></td>
                                </tr>
                                <tr>                                    
                                    <td>快递名称</td>
                                    <td id="shoppingname"></td>
                                    <td>快递费用</td>
                                    <td id="shoppingfee"></td>
                                </tr>
                                <tr>     
                                	<td>支付时间</td>
                                    <td id="paytime"></td>                               
                                    <td>支付费用</td>
                                    <td id="payfee"></td>                                   
                                </tr>
                                <tr>                                    
                                    <td>数量</td>
                                    <td id="goodamount"></td>
                                    <td>邮寄图片</td>
                                    <td><img width="80px" height="100px" id="shoppingImg"></td>
                                </tr>
                                                         
                        </table>
                    </div>
		      </div>
		      <div class="modal-footer">		      			      			       
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		        <input type="button" onclick="doprint()" value="打印预览" class="btn btn-primary">	        
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	
  
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("send.orderid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>

<script type="text/javascript">
	/*查询商品详细信息  */
		function btn1(id){
			   $.ajax({
				   url:"${pageContext.request.contextPath }/order/queryOrderByIdForDetail.action?id="+id,
				   type:"GET",
				   success:function(result){
						   console.log(result);
						   build_table(result);
				   }   
			   });
			 }
		
		 function build_table(result){
		 	$("#username").html(result.users.username);
		 	$("#sendtime").html(fmtDate(result.sendtime));
		 	$("#ordertime").html(fmtDate(result.ordertime));
		 	$("#addphone").html(result.addphone);		 	
		 	$("#shoppingstatus").html(result.shoppingstatus);
		 	$("#paystatus").html(result.paystatus);
		 	$("#addusername").html(result.addusername);
		 	$("#addcountry").html(result.addcountry);
		 	$("#addprovince").html(result.addprovince);
		 	$("#addcity").html(result.addcity);
		 	$("#adddistrict").html(result.adddistrict);
		 	$("#addaddress").html(result.addaddress);		 	
		 	$("#shoppingcode").html(result.shopping.shoppingcode);
		 	$("#shoppingname").html(result.shopping.shoppingname);
		 	$("#paytime").html(fmtDate(result.paytime));
		 	$("#payfee").html(result.payfee);
		 	$("#shoppingfee").html(result.shoppingfee);
		 	$("#goodamount").html(result.goodamount);
		 	$("#shoppingImg").attr("src","${pageContext.request.contextPath }/shoppingphoto/"+result.shopping.shoppingimg);
		 	
		 	if(result.orderstatus==1){
		 		$("#orderstatus").html("已安排");
		 	}else{
		 		$("#orderstatus").html("未安排");
		 	}
		 	if(result.shoppingstatus==1){
		 		$("#shoppingstatus").html("已发货");		 		
		 	}else if(result.shoppingstatus==-1){
		 		$("#shoppingstatus").html("已安排未发货");
		 	}else{
		 		$("#shoppingstatus").html("未发货");
		 	}
		 	if(result.paystatus==1){
		 		$("#paystatus").html("已支付");
		 	}else{
		 		$("#paystatus").html("未支付");
		 	}
		 }		 
		  	
		 /* 时间格式转换 */
		 function fmtDate(obj){
			 var date =  new Date(obj);
			    var y = 1900+date.getYear();
			    var m = "0"+(date.getMonth()+1);
			    var d = "0"+date.getDate();
			    var h = "0"+date.getHours();
			    var f = "0"+date.getMinutes();
			    var s = "0"+date.getSeconds();
			    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length)
			    +" "+h.substring(h.length-2,h.length)+":"+f.substring(f.length-2,f.length)+":"+s.substring(s.length-2,s.length);
			} 
</script>

<!-- 打印发货订单 -->
<script type="text/javascript">  
    function doprint(){  
    	if (!confirm("确定打印吗？")){
    		return false;
    	}else {
    		/**不打印按钮*/
    		//var cen = document.getElementById("sheet");
    		//cen.innerHTML =window.document.body.innerHTML;
    		/**执行打印*/
    		//wb.execwb(6,6);
    		//WebBrowser.execwb(6,1);
    		//window.print();
    		bdhtml=window.document.body.innerHTML; 
    		sprnstr=""; 
    		eprnstr=""; 
    		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
    		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
    		window.document.body.innerHTML=prnhtml; 
    		window.print(); 
    	}      
    }  
    
    /*返回订单表*/
	function userorderhome(){
		window.location.href="${pageContext.request.contextPath }/order/queryAllOrderController.action";
	}
</script>

</body>

</html>
