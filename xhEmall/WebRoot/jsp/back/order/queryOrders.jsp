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
    
    <title>查询订单</title>
    
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
                        	<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a data-toggle="modal" data-target="#myModal" id="addorderforposition">添加订单</a>                                
                                </li>
                                <li><a id="sendlist">发货订单</a>                                
                                </li>
                                <li><a id="expresslist">邮寄方式</a>                                
                                </li>
                            </ul>
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
                                    <th>姓名</th>                                  
                                    <th>订单时间</th>                                 
                                    <th>收货人姓名</th>
                                	<th>收货人电话</th>                                                                  
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data">             
                                <c:forEach items="${order }" varStatus="status" var="order">
							    	<tr class="gradeX">
							    		<td>${order.orderid }</td>
							    		<td>${order.users.username }</td>
							    		<td><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							    		<td>${order.addusername }</td>
							    		<td>${order.addphone }</td>
							    		<td class="text-center">
							    		    <a onclick="btn1(${order.orderid})" data-toggle="modal" data-target="#myModal1" style="color:#000"><span class="glyphicon glyphicon-search"></span></a>
							    			&nbsp;&nbsp; 							    			
							    			<a onclick="btn2(${order.orderid})" style="color:#000"><span class="glyphicon glyphicon-trash"></span></a>
							    			&nbsp;&nbsp;
							    			<a onclick="btn3(${order.orderid })" style="color:#000" data-toggle="modal" data-target="#myModal2" style="color:#000"><span class="glyphicon glyphicon-pencil"></span></a>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th>订单编号</th>                                  
                                    <th>姓名</th>                                  
                                    <th>订单时间</th>                                 
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
                                    <td>订单编号</td>
                                    <td id="orderid"></td>
                                    <td>姓名</td>
                                    <td id="username"></td>
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
	
	<!-- 模态框（Modal） -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加订单</h4>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal m-t" id="addorders">
            		<div class="col-md-12">                           
                               <div class="form-group">
                                	<label class="col-sm-3 control-label">会员编号：</label>                            	    
                                    <div class="col-sm-9">

                                       

                                        <input name="userid" id="userid11" type="text" class="form-control checkuserbyid" placeholder="请输入会员编号">
                                    	<div class="checkuser" style="color:red;margin-top:auto"></div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮寄编号：</label>
                                    <div class="col-sm-9">

                                      
                                        <input type="text" id="shoppingid11" name="shoppingid" class="form-control checkexpbyid" placeholder="请输入邮寄编号">
                                    	<div class="checkexpress" style="color:red;margin-top:auto"></div>

                                    </div>
                                </div>                                                               
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">订单状态：</label>
                                    <div class="col-sm-9">                             
                                        <input type="radio"name="orderstatus" value="1"/>安排&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio"name="orderstatus" value="0"/>未安排
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮寄状态：</label>                          
                                    <div class="col-sm-9">
                                    	<input type="radio"name="shoppingstatus" value="1"/>已发货&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio"name="shoppingstatus" value="-1"/>已安排未发货&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio"name="shoppingstatus" value="0"/>待安排
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">支付状态：</label>
                                    <div class="col-sm-9">                             
                                        <input type="radio"name="paystatus" value="1"/>已支付&nbsp;&nbsp;&nbsp;&nbsp;                                                                    
                                    	<input type="radio"name="paystatus" value="0"/>未支付
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">收货人姓名：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="addusername11" name="addusername" class="form-control" placeholder="请输入收货人姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">国家：</label>
                                    <div class="col-sm-9">
                                        <select name="addcountry" class="form-control m-b">
                                        	<option>中国</option>
                                        </select>
                                    </div>
                                </div>
                              <div class="form-group">
                                    <label class="col-sm-3 control-label">省份：</label>
                                    <div class="col-sm-9">                                    
                                        <select data-placeholder="省份" id="provinceId" name="addprovince" class="form-control"
				                                data-rel="chosen">
				                                <option>选择省份</option>				                                				                        				                           
				                        </select>
                                    </div>
                                </div>                 
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">城市：</label>
                                    <div class="col-sm-9">
                                        <select data-placeholder="城市" id="cityId" name="addcity" class="form-control" data-rel="chosen">				                           
				                        	<option>选择城市</option>	
				                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地区：</label>
                                    <div class="col-sm-9">
                                        <select data-placeholder="区域" name="adddistrict" id="areaId" class="form-control" data-rel="chosen">				                            
				                        	<option>选择地区</option>	
				                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">详细地址：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="addaddress11" name="addaddress" class="form-control" placeholder="请输入详细地址">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮寄编码：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="shoppingcode11" name="shoppingcode" class="form-control" placeholder="请输入邮政编码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">收货人电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="addphone11" name="addphone" class="form-control" placeholder="请输入收货人联系方式">                                        
                                    </div>
                                </div>                                       
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">货物数量：</label>
                                    <div class="col-sm-9">                            	
                                        <input type="text" id="goodamount11" name="goodamount" class="form-control" placeholder="商品数量">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">邮寄费用：</label>
                                    <div class="col-sm-9">                                   
                                        <input type="text" id="shoppingfee11" name="shoppingfee" class="form-control" placeholder="邮寄费用">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">支付费用：</label>                                       
                                    <div class="col-sm-9">                                  	                                     
                                        <input type="text" id="payfee11" name="payfee" class="form-control" placeholder="支付费用">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                 
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute4" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute5" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute6" class="form-control" placeholder="">                                        
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">                   
                                <div class="col-sm-12 col-sm-offset-4">                              
            	                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                					<button id="btn_id" type="button" class="btn btn-primary" onclick="addorder()">添加订单</button>                  
                                </div>  	     
                           </div>
                </form>                    
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
  </div>	
  </div>
  
  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">更新订单</h4>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal m-t" id="updateorders">
            		<div class="col-md-12">
            					 <div class="form-group">
                                	<!-- <label class="col-sm-3 control-label">订单编号：</label> -->                            	    
                                    <div class="col-sm-9">
                                        <input name="orderid" id="orderid1" type="hidden"  class="form-control">
                                    </div>
                                </div>         					                           
                               <div class="form-group">
                                	<label class="col-sm-3 control-label">会员编号：</label>                            	    
                                    <div class="col-sm-9">
                                        <input name="userid" id="userid1" type="text"  class="form-control checkuserbyid">
                                    	<div class="checkuser" style="color:red;margin-top:auto;"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮寄编号：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="shoppingid1" type="text" name="shoppingid" class="form-control checkexpbyid">
                                    	<div class="checkexpress" style="color:red;margin-top:auto;"></div>
                                    </div>
                                </div>                                                               
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">订单状态：</label>
                                    <div class="col-sm-9">                             
                                        <input type="radio" name="orderstatus" id="orderstatus1" value="1"/>安排&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio" name="orderstatus" id="orderstatus1" value="0"/>未安排
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮寄状态：</label>                          
                                    <div class="col-sm-9">
                                    	<input type="radio"name="shoppingstatus" id="shoppingstatus1" value="1" />已发货&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio"name="shoppingstatus" id="shoppingstatus1" value="-1"/>已安排未发货&nbsp;&nbsp;&nbsp;&nbsp;
                                    	<input type="radio"name="shoppingstatus" id="shoppingstatus1" value="0" />待安排
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">支付状态：</label>
                                    <div class="col-sm-9">                             
                                        <input type="radio"name="paystatus" id="paystatus1" value="1" />已支付&nbsp;&nbsp;&nbsp;&nbsp;                                                                        	
                                    	<input type="radio"name="paystatus" id="paystatus1" value="0" />未支付
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">收货人姓名：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="addusername" id="addusername1" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">国家：</label>
                                    <div class="col-sm-9">
                                        <select name="addcountry" class="form-control m-b">
                                        	<option>中国</option>
                                        </select>
                                    </div>
                                </div>
                              <div class="form-group">
                                    <label class="col-sm-3 control-label">省份：</label>
                                    <div class="col-sm-9">                                    
                                        <select data-placeholder="省份" id="provinceId1" name="addprovince" class="form-control"
				                                data-rel="chosen">
				                                <option id="addprovince1">选择省份</option>				                                				                        				                           
				                        </select>
                                    </div>
                                </div>                 
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">城市：</label>
                                    <div class="col-sm-9">
                                        <select data-placeholder="城市" id="cityId1" name="addcity" class="form-control" data-rel="chosen">				                           
				                        	<option>选择城市</option>	
				                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地区：</label>
                                    <div class="col-sm-9">
                                        <select data-placeholder="区域" name="adddistrict" id="areaId1" class="form-control" data-rel="chosen">				                            
				                        	<option>选择地区</option>	
				                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">详细地址：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="addaddress" id="addaddress1" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">邮政编码：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="addcode" id="addcode1" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">收货人电话：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="addphone" id="addphone1" class="form-control">                                        
                                    </div>
                                </div>                                       
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">货物数量：</label>
                                    <div class="col-sm-9">                            	
                                        <input type="text" name="goodamount" id="goodamount1" class="form-control">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">邮寄费用：</label>
                                    <div class="col-sm-9">                                   
                                        <input type="text" name="shoppingfee" id="shoppingfee1" class="form-control">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label class="col-sm-3 control-label">支付费用：</label>                                       
                                    <div class="col-sm-9">                                  	                                     
                                        <input type="text" name="payfee" id="payfee1" class="form-control">                                        
                                    </div>
                                </div>
                                <div class="form-group">                                 
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute4" class="form-control">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute5" class="form-control">                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <input type="hidden" name="attribute6" class="form-control">                                        
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">                           
                                <div class="col-sm-12 col-sm-offset-4">                              
            	                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                					<button id="btn_id2" type="button" class="btn btn-primary" onclick="update()">保存修改</button>                  
                                </div>  	     
                           </div>
                </form>                    
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
  </div>
  </div>	
  
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
   <script type="text/javascript" src="resource/js/validate.js"></script>
   
   <script type="text/javascript">
		$("#btn_id")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											userid11 : "numberEnglish",
											shoppingid11 : "numberEnglish",
											addusername11:"notEmpty",
											addaddress11:"notEmpty",
											addcode11:"notEmpty",
											addphone11:"mobile",
											goodamount11:"notEmpty",										
											shoppingfee11:"money",
											payfee11:"money",
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun :function addorder(){
		var formData = new FormData($("#addorders")[0]);
		$.ajax({
		cache: true,
		type: "POST",
		data:formData,
		url:"${pageContext.request.contextPath }/order/addOrder.action",
		/* async: false,
		cache: false,   */
	    contentType: false,  
	    processData: false,
		success: function(result) {
			  if(result.code!=100){	
				    alert("增加成功！");
				    window.location.href="${pageContext.request.contextPath }/order/queryAllOrderController.action";
			   }else{
				  alert("增加失败！");
				  window.location.href="${pageContext.request.contextPath }/order/queryAllOrderController.action";
			   } 		
		}
		});
		}			 
										

									});
						});
	</script>
   
   
	<script type="text/javascript">
		$("#btn_id2")
				.click(
						function() {

							var val = new validate(
									{

										rules : {
											userid1 : "numberEnglish",
											shoppingid1 : "numberEnglish",
											addusername1:"notEmpty",
											addaddress1:"notEmpty",
											addcode1:"notEmpty",
											addphone1:"mobile",
											goodamount1:"notEmpty",
											shoppingfee1:"money",
											payfee1:"money",
										},
										/*submitFun里面为检验成功后要执行的方法*/
										submitFun :function update(){
				 var formData = new FormData($("#updateorders")[0]);
					$.ajax({
					cache: true,
					type: "POST",
					data:formData,
					url:"${pageContext.request.contextPath }/order/updateOrder.action",
					async: false,
					cache: false,
				    contentType: false,  
				    processData: false,
					success: function(result) {
						  if(result.code!=100){	
							    alert("修改成功！");
							    window.location.href="${pageContext.request.contextPath }/order/queryAllOrderController.action";
						   }else{
							  alert("修改失败！");
							  window.location.href="${pageContext.request.contextPath }/order/queryAllOrderController.action";
						   } 		
					}
					});
			 }
										

									});
						});
	</script>
   
    
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("order.orderid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>

	<!--获取省份、城市、地区  -->	
<script type="text/javascript">

    /*页面加载就开始执行js*/   	
    	$.ajax({
     		type:"GET",
     		url:"${pageContext.request.contextPath}/order/getProvincelist.action",
     		success:function(result){    			
     			$.each(result.extend.provincelist,function(index,item){
     				 var option=$("<option value='"+item.provinceid+"'></option>").append(item.province);
     				 option.appendTo("#provinceId");     				 
     			});
     			//获取城市 
     			$("#provinceId").change(function(){
     				$.ajax({
         	     		type:"GET",
         	     		url:"${pageContext.request.contextPath}/order/getCityByProvinceId.action?id="+$("#provinceId").val(),    		
         	     		success:function(result){    			
         	     			$.each(result.extend.citylist,function(index,item){
         	     				 var option=$("<option value='"+item.cityid+"'></option>").append(item.city);
         	     				 option.appendTo("#cityId");    	     				
         	     			});
         	     			 //获取地区
         	     			 $("#cityId").change(function(){
         	     				$.ajax({
             	     	     		type:"GET",
             	     	     		url:"${pageContext.request.contextPath}/order/getAreaByCityId.action?id="+$("#cityId").val(),    		
             	     	     		success:function(result){    			
             	     	     			$.each(result.extend.arealist,function(index,item){
             	     	     				 var option=$("<option value='"+item.areaid+"'></option>").append(item.area);
             	     	     				 option.appendTo("#areaId");
             	     	     			});    	     	     		
             	     	     		}
             	     	     	});
         	     			 });	     				
         	     		}
         	     	});
     			});				
     		}
     	});
    
    	$.ajax({
     		type:"GET",
     		url:"${pageContext.request.contextPath}/order/getProvincelist.action",
     		success:function(result){    			
     			$.each(result.extend.provincelist,function(index,item){
     				 //var option=$("<option value='"+item.provinceid+"'></option>").append(item.province);
     				 var option = $("<option></option>").attr("value",item.provinceid).append(item.province);
     				 option.appendTo("#provinceId1");     				 
     			});
     			//获取城市 
     			$("#provinceId1").change(function(){
     				$.ajax({
         	     		type:"GET",
         	     		url:"${pageContext.request.contextPath}/order/getCityByProvinceId.action?id="+$("#provinceId1").val(),    		
         	     		success:function(result){    			
         	     			$.each(result.extend.citylist,function(index,item){
         	     				 //var option=$("<option value='"+item.cityid+"'></option>").append(item.city);
         	     				 var option = $("<option></option>").attr("value",item.cityid).append(item.city);
         	     				 option.appendTo("#cityId1");    	     				
         	     			});
         	     			 //获取地区
         	     			 $("#cityId1").change(function(){
         	     				$.ajax({
             	     	     		type:"GET",
             	     	     		url:"${pageContext.request.contextPath}/order/getAreaByCityId.action?id="+$("#cityId1").val(),    		
             	     	     		success:function(result){    			
             	     	     			$.each(result.extend.arealist,function(index,item){
             	     	     				 var option=$("<option value='"+item.areaid+"'></option>").append(item.area);
             	     	     				 option.appendTo("#areaId1");
             	     	     			});    	     	     		
             	     	     		}
             	     	     	});
         	     			 });	     				
         	     		}
         	     	});
     			});				
     		}
     	});
    		
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
		 	$("#orderid").html(result.orderid);
		 	$("#username").html(result.users.username);
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
		 	if(result.orderstatus==1){
		 		if(result.shoppingstatus==1){
			 		$("#shoppingstatus").html("已发货");		 		
			 	}else if(result.shoppingstatus==-1){
			 		$("#shoppingstatus").html("已安排未发货");
			 	}else{
			 		$("#shoppingstatus").html("未发货");
			 	}
		 	}else{
		 		$("#shoppingstatus").html("待安排");
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
		 
		 /* 点击删除 */
	     function btn2(id){
				if(!confirm("您确定要删除该订单的信息记录吗？")){
			 		   return false;
			 	   }else{
			 		   $.ajax({
			 			   url:"${pageContext.request.contextPath }/order/deleteOrder.action?id="+id,
			 			   type:"delete",
			 			   success:function(result){
			 					   /* alert("删除成功！"); */
			 					   window.location.href="order/queryAllOrderController.action";
			 			   }
			 		   });
			 	   }
			}				
		 
	     /*点击修改*/
		 function btn3(id){
					$.ajax({
						   url:"${pageContext.request.contextPath }/order/queryOrderByIdForDetail.action?id="+id,
						   type:"GET",
						   success:function(result){
								   console.log(result);
								   build_table1(result);
						   }   
					   });
				}
				 
	    	 function build_table1(result){
	    		    $("#orderid1").attr("value",result.orderid);
	    		    $("#userid1").attr("value",result.users.userid);
	    		    $("#shoppingid1").attr("value",result.shopping.shoppingid);
		 		 	$("#ordertime1").html(fmtDate(result.ordertime));
		 		 	$("#addphone1").html("value",result.addphone);		 		 	
		 		 	$("#addusername1").attr("value",result.addusername);
		 		 	$("#addcountry1").attr("value",result.addcountry);
		 		 	$("#addprovince1").attr("value",result.addprovince);
		 		 	$("#addcity1").attr("value",result.addcity);
		 		 	$("#adddistrict1").attr("value",result.adddistrict);
		 		 	$("#addaddress1").attr("value",result.addaddress);		 	
		 		 	$("#addcode1").attr("value",result.addcode);
		 		 	$("#shoppingname1").attr("value",result.shopping.shoppingname);
		 		 	$("#paytime1").html(fmtDate(result.paytime));
		 		 	$("#payfee1").attr("value",result.payfee);
		 		 	$("#shoppingfee1").attr("value",result.shoppingfee);
		 		 	$("#goodamount1").attr("value",result.goodamount);
		 		    $("input[name=orderstatus][value="+result.orderstatus+"]").attr("checked",true);  
	                $("input[name=shoppingstatus][value="+result.shoppingstatus+"]").attr("checked",true);
	                $("input[name=paystatus][value="+result.paystatus+"]").attr("checked",true);		 		 		 	
				 	
				 }		 
		 	
		 /*检查用户ID和邮寄ID */	 	
		$(".checkuserbyid").blur(function(){
			var userid = $(this).val();
			$.ajax({
				cache: true,
				type: "GET",
				url: "order/checkAddUser.action?id="+userid,				
				success : function(result){
					if(result.code!=100){					
						$(".checkuser").html(result.msg);
					} 
					if(result.code ==100) {
						$(".checkuser").html("");
					}
				}
			});
		});
		 
		$(".checkexpbyid").blur(function(){			
			var shoppingid = $(this).val();
			$.ajax({
				cache: true,
				type: "GET",
				url: "order/checkAddExpress.action?id=" + shoppingid,		
				success : function(result){
					if(result.code!=100){					
						$(".checkexpress").html(result.msg);
					} 
					if(result.code==100) {
						$(".checkexpress").html("");
					}
				}
			});
		});
		 
		/*点击显示发货单*/
		 $("#sendlist").on("click", function(){
			 window.location.href="${pageContext.request.contextPath }/order/querySendOrderController.action";		    	
		    });
		 

		/*点击显示快递表*/
		 $("#expresslist").on("click", function(){
			 window.location.href="${pageContext.request.contextPath }/exp/queryAllExpress.action";		    	
		    });
</script>

<!-- 打印订单 -->
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
</script>

</body>

</html>
