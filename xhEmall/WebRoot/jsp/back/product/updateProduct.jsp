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
    <!-- Data Tables-->
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<link rel="stylesheet" type="text/css" href="resource/css/plugins/markdown/bootstrap-markdown.min.css" />

	
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改商品</h5>
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
                       <form id="myform" method="post"  class="form-horizontal" enctype="multipart/form-data">
                       		<div class="form-group">                  
                                <div class="col-md-3">
                                    <input id="pid" type=hidden class="form-control" name="pid">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称：</label>

                                <div class="col-md-3">
                                    <input id="pname" type="text" class="form-control" name="pname">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品描述：</label>
                                <div class="col-sm-10">
                                    <input id="pdesc" type="text" class="form-control" name="pdesc"> <span class="help-block m-b-none">商品说明，50字内说明商品信息。</span>
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">定价：</label>

                                <div class="col-md-3">
                                    <input id="pprice" type="text" class="form-control" name="pprice">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">售价：</label>
                                <div class="col-md-3">
                                    <input id="psale" type="text" class="form-control" name="psale">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                             
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品图片：</label>
                                <div class="col-md-3">
                                    <div id="file-pretty">
			                            <div class="form-group">
			                                <input type="file" id="file" class="form-control" name="file" onchange="showPic()"/>			                               		
									 		<img class="img-rounded" id="img" width="150" height="150"> 	
			                            </div>  
		                            </div>
                                </div>  
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品详细：</label>
                                   <div class="col-sm-10" id="file-pretty">
			                                <textarea data-provide="markdown" rows="10" name="pimgdetail" id="pimgdetail"></textarea>
			                       </div>                                
                            </div>
                			<div class="hr-line-dashed"></div>
                			
                			<div class="form-group">
                                <label class="col-sm-2 control-label">品牌：</label>		
                                <div class="col-md-3">                                
                                    <div class="input-group">
			                                <select id="brand" data-placeholder="选择品牌..." class="chosen-select" style="width:350px;" tabindex="2" name="brandid">
			                                	 
			                                </select>
			                        </div>   
                                </div>
                            </div>
                			
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品大小：</label>

                                <div class="col-md-3">
                                    <input id="psize" type="text" class="form-control" name="psize">
                                </div>
                            </div>
                			
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品单位：</label>

                                <div class="col-md-3">
                                    <input id="punit" type="text" class="form-control" name="punit">
                                </div>
                            </div>
                			<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品折扣：</label>
                                <div class="col-md-3">
                                    <input id="pdiscount" type="text" class="form-control" name="pdiscount">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" id="btn_id">保存内容</button>
                                    <input type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/>
                                </div>
                            </div>
                        </form> 
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
    <script type="text/javascript" src="resource/js/plugins/markdown/markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/to-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.js"></script>
    <script type="text/javascript" src="resource/js/plugins/markdown/bootstrap-markdown.zh.js"></script>
	<script type="text/javascript" src="resource/js/validate.js"></script>
    <script type="text/javascript">
    
    $(function(){
    	$.ajax({
     		url:"${pageContext.request.contextPath}/brand/queryAllBrandsForJson.action",
     		type:"GET",
     		success:function(result){
     			$.each(result.extend.brands,function(index,item){
     				 var option=$("<option value='"+item.brandid+"'></option>").append(item.brandname);
     				 option.appendTo(brand);
     			});
     		}
     	});
    	 
    	$.ajax({
    		url:"${pageContext.request.contextPath}/product/queryProductById.action?id="+getID(),
    		type:"GET",
    		success:function(result){
    			console.log(result);
    			$("#pid").val(result.pid);
    			$("#pname").val(result.pname);
    			$("#pdesc").val(result.pdesc);
    			$("#pprice").val(result.pprice);
    			$("#psale").val(result.psale);
    			$("#pimg").val(result.pimg);
    			$("#pimgdetail").val(result.pimgdetail);
    			$("#psize").val(result.psize);
    			$("#punit").val(result.punit);
    			$("#pdiscount").val(result.pdiscount);
    			$("#brand").val(result.brand.brandid);
    			$("#img").attr("src","${pageContext.request.contextPath}"+result.pimg);
    		}
    	});
    });
    	
   
    </script>
   <script type="text/javascript">
    function getID(){
    	var Ohref=window.location.href;
    	var arrhref=Ohref.split("?id=");
    	var id = arrhref[1];
    	return id;
    }
    
    
   </script>
    
<script type="text/javascript">
$("#btn_id").on("click", function() {
				var val = new validate({
						rules: {
							pname: "notEmpty",
							pdesc: "notEmpty",
							pprice: "money",
							psale: "money",
							
							psize: "notEmpty",
							punit: "notEmpty",
							pdiscount: "notEmpty"
						},
						/*submitFun里面为检验成功后要执行的方法*/ submitFun: function() {
							var action = "";
							if(!confirm("您确定要增加商品？")) {
								return false;
							} else {
								var form = $("#file").val().length;
								var formData = new FormData($("#myform")[0]);
								if(form == 0) {
									action = "updateProduct.action";
								} else {
									action = "updateProductAndFile.action";
								}
								$.ajax({
									url: "${pageContext.request.contextPath }/product/" + action,
									type: "POST",
									data: formData,
									/* async: false, cache: false, */ contentType: false,
									processData: false,
									success: function(result) {
										if(result.code == 100) {
											alert("修改成功！");
											window.location.href = "${pageContext.request.contextPath}/product/queryAllProducts.action";
										} else {
											alert("修改失败！");
										}
									}
								
								
								});
							}
							}
						});
				
			})

</script>

<!-- 上传图片 -->

<script type="text/javascript">
//展示图片
function showPic(){
 var pic = $("#file").get(0).files[0];
 $("img").prop("src", window.URL.createObjectURL(pic));

}
</script>

</body>
</html>
