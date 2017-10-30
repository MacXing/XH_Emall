<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品管理</title>
    
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
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="resource/css/plugins/markdown/bootstrap-markdown.min.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>增加商品</h5>
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
                        <form method="post" class="form-horizontal" action="" enctype="application/x-www-form-urlencoded">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品描述：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"> <span class="help-block m-b-none">商品说明，50字内说明商品信息。</span>
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">定价：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">售价：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品图片：</label>

                                <div class="col-md-3">
                                    <div id="file-pretty">
			                            <div class="form-group">
			                                <input type="file" class="form-control">
			                            </div>  
		                            </div>
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品详细：</label>
                                    <div class="col-sm-10" id="file-pretty">
			                                <textarea name="content" data-provide="markdown" rows="10"></textarea>
			                        </div>     
                            </div>                          
                            
                			<div class="hr-line-dashed"></div>
                			
                			<div class="form-group">
                                <label class="col-sm-2 control-label">品牌：</label>		
                                <div class="col-md-3">                                
                                    <div class="input-group">
			                                <select data-placeholder="选择品牌..." class="chosen-select" style="width:350px;" tabindex="2">
			                                	<c:forEach items="${brands }" var="brand">
			                                		<option value="${brand.brandid }" hassubinfo="true">${brand.brandname }</option>
			                                	</c:forEach> 
			                                </select>
			                        </div>   
                                </div>
                            </div>
                			
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品大小：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                			
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品单位：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品折扣：</label>

                                <div class="col-md-3">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">保存内容</button>
                                    <button class="btn btn-white" type="submit">取消</button>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%--隐藏窗口 --%>
		<div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">添加商品信息</h4>
		      </div>
		      <div class="modal-body"> 
		        
		        <form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品名称">
				    </div>
				  </div>
				 
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">定价</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品定价">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">售价</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品售价">
				    </div>
				  </div>
				  <div class="form-group">
				  <label  class="col-sm-2 control-label">品牌</label>
				    <div class="col-sm-10">
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">大小</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品大小">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">单位</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品单位">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">折扣</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品折扣">
				    </div>
				  </div>
				</form> 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Submit</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<%--隐藏窗口2 --%>
		<div class="modal fade" id="myModel2" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="gridSystemModalLabel">修改商品信息</h4>
		      </div>
		      <div class="modal-body"> 
		        
		        <form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品名称">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">描述</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品描述">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">定价</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品定价">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">售价</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品售价">
				    </div>
				  </div>
				 
				 
				 
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">大小</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品大小">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">单位</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品单位">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">折扣</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="pname" placeholder="商品折扣">
				    </div>
				  </div>
				</form> 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Submit</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
    
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    
    
    <%-- <tr>
							    		<td>${product.pid }</td>
							    		<td>${product.pname }</td>
							    		<td>${product.pclick }</td>
							    		<td>${product.pdesc }</td>
							    		<td>${product.pprice }</td>
							    		<td>${product.psale }</td>
							    		<td>${product.pimg }</td>
							    		<td>${product.pimgdetail }</td>
							    		<td>${product.paddtime }</td>
							    		<td>${product.pupdatetime }</td>
							    		<td>${product.brandid }</td>
							    		<td>${product.psize }</td>
							    		<td>${product.punit }</td>
							    		<td>${product.pdiscount }</td>
							    		<td>${product.pIntegral }</td>	
							    		<td class="text-center"> 							    			
							    			<a myAttr="del_btn" style="color:#000"><span class="glyphicon glyphicon-trash del_btn"></span></a>
							    			&nbsp;&nbsp;
							    			<a data-toggle="modal" data-target="#myModel2"><span class="glyphicon glyphicon-pencil" ></span></a>
							    		</td> 						    									    									    		
							    	</tr> --%>
<!--     <script type="text/javascript">
	  function build_table(result){
		  $.each(result,function(index,item){
			  $("<tr></tr>").append($("<td></td>").append(item.pid)).appendTo($("#table_data"));
		  });
	  }
    </script> -->
    
     <script type="text/javascript" src="resource/js/plugins/markdown/markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/to-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.zh.js"></script>
    <script>
        $(document).ready(function(){
        	
        	 /* $.ajax({
       		  url:"product/queryAllProducts.action",
       		  type:"GET",
       		  success:function(result){
       			  console.log(result);
       			  build_table(result);
       		  }
       	  }); */
        	
        	$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>
    
    <!-- 
    	单选删除按钮
     -->
    
    <script type="text/javascript">
    $(document).on("click",".del_btn",function(){
 	   var id=$(this).parents("tr").find("td:eq(0)").text();
 	   var name=$(this).parents("tr").find("td:eq(1)").text();
 	   if(!confirm("您确定要删除【"+name+"】商品的报名记录吗？")){
 		   return false;
 	   }else{
 		   $.ajax({
 			   url:"${pageContext.request.contextPath }/product/delectProduct.action?id="+id,
 			   type:"delete",
 			   success:function(result){
 					   /* alert("删除成功！"); */
 					   window.location.href="product/queryAllProducts.action";
 			   }
 			   
 		   });
 	   }
    });

    </script>
</body>

</html>
