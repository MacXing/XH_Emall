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
    
    <title>评论管理</title>
    
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
	<link rel="stylesheet" type="text/css" href="resource/css/plugins/markdown/bootstrap-markdown.min.css" />

	
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>增加评论</h5>
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
                                <label class="col-sm-2 control-label">会员名：</label>
                                <div class="col-md-3">
                                     <div class="input-group">
			                                <select id="users"  name="userid" class="chosen-select" style="width:350px;height:28px;" tabindex="2">
			                                	 
			                                </select>
			                        </div>   
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品：</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
			                                <select id="product" name="pid" class="chosen-select" style="width:350px;height:28px;" tabindex="2">
			                                	 
			                                </select>
			                        </div>   
                                </div>
                            </div>
                            
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品详细：</label>
                                   <div class="col-sm-10" id="file-pretty">
			                                <textarea name="commenttxt" id="commenttxt" data-provide="markdown" rows="10"></textarea>
			                       </div>                                
                            </div>
                			<div class="hr-line-dashed"></div>
                			
                       
                            <div class="form-group">
                                <label class="col-sm-2 control-label">服务等级：</label>
                                <div class="col-md-3">
                                	<div class="input-group">
			                                <select id="commentservice" name="commentservice" data-placeholder="选择角色..." class="chosen-select" style="width:350px;height:28px;" tabindex="2" >
			                                	 <option value="1">1星级</option>
			                                	 <option value="2">2星级</option>
			                                	 <option value="3">3星级</option>
			                                	 <option value="4">4星级</option>
			                                	 <option value="5">5星级</option>
			                                </select>
			                        </div> 
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">物流等级：</label>		
                                <div class="col-md-3">                                
                                    <div class="input-group">
			                                <select id="commentshopping" name="commentshopping" data-placeholder="选择品牌..." class="chosen-select" style="width:350px;" tabindex="2" >
			                                	 <option value="1">1星级</option>
			                                	 <option value="2">2星级</option>
			                                	 <option value="3">3星级</option>
			                                	 <option value="4">4星级</option>
			                                	 <option value="5">5星级</option>
			                                </select>
			                        </div>   
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                             
                            <div class="form-group">
                                <label class="col-sm-2 control-label">商品等级：</label>
                                <div class="col-md-3">
                                    <div class="input-group">
			                                <select id="commentgoods" name="commentgoods" data-placeholder="选择角色..." class="chosen-select" style="width:350px;height:28px;" tabindex="2">
			                                	 <option value="1">1星级</option>
			                                	 <option value="2">2星级</option>
			                                	 <option value="3">3星级</option>
			                                	 <option value="4">4星级</option>
			                                	 <option value="5">5星级</option>
			                                </select>
			                        </div> 
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
 		$(document).ready(function(){
 			$.ajax({
 				url:"${pageContext.request.contextPath }/user/queryAllUsersForJson.action",
 				type:"GET",
 				success:function(result){
 					$.each(result.extend.users,function(index,item){
 	    				 var option=$("<option value='"+item.userid+"'></option>").append(item.username);
 	    				 option.appendTo(users);	 
 	    			});
 				}
 			});
 			
 			$.ajax({
 				url:"${pageContext.request.contextPath }/product/queryAllProductsForJson.action",
 				type:"GET",
 				success:function(result){
 					$.each(result.extend.products,function(index,item){
 	    				 var option=$("<option value='"+item.pid+"'></option>").append(item.pname);
 	    				 option.appendTo(product);	 
 	    			});
 				}
 			});
 			
 		});
 	
 	
 	</script>
 
	 <script>
	 	 $("#btn_id").click(function (){
		
			var val = new validate({
			
				rules:{
					commenttxt:"notEmpty",   				
				},
				/*submitFun里面为检验成功后要执行的方法*/
				submitFun:function(){
				var action="";
	if(!confirm("您确定要增加评论？")){
		return false;
	}else{
		var form = $("#file").val().length;
		var formData= new FormData($("#myform")[0]);
		
		 if(form==0){
			 action ="insertComment.action";
		}else{
			 action="insertCommentAndFile.action";
		}		 
		$.ajax({		
			url:"${pageContext.request.contextPath }/comment/"+action,
			   type:"POST",
			   data:formData,
			  /*  async: false,  
		       cache: false,  */ 
		       contentType: false,  
		       processData: false, 
			   success:function(result){ 
				  if(result.code==100){						  	
					    alert("增加成功！");
					    clean();
				   }else{
					  alert("增加失败！");
				   } 
			   }
		});
	}
}
				
				
				
			
			});
	});
	
	</script>
   
<script type="text/javascript">

function clean()
{	
	$("#commenttxt").val("");
	var file = $("#file"); 
	file.after(file.clone().val("")); 
	file.remove();
	$("#img").attr("src",null);
}

</script>
<script type="text/javascript">
//展示图片
	 function showPic(){
	  var pic = $("#file").get(0).files[0];
	  $("img").prop("src",window.URL.createObjectURL(pic));
	 
	 }
</script>
</body>

</html>
