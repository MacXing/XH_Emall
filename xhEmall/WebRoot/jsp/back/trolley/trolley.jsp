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
    
    <title>购物车管理</title>
    
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
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/layui/css/modules/layer/default/layer.css"/>
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>购物车信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a id="addProduct" onclick="add_trolley()">添加购物车</a>
                               
                                </li>
                            </ul>
                            <a  id="flash">
                                <i class="fa fa-refresh"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div> 
                        <div class="mt-10 text-c" style="margin-top: 28px;">
                           <span class="l"> 
			<a onclick="bacthdele()" href="javascript:;" class="btn btn-danger radius">
			<i class="Hui-iconfont">
			<img style="color:#468847 ; width: 14px;margin-top: -2px;" src="resource/img/la.png"/>
			</i> 批量删除</a> 
			<a class="btn btn-primary radius" href="javascript:;" onclick="add_trolley()" id="add-trolley">
			<i class="Hui-iconfont">
			<img style="color:#468847 ; width: 14px;margin-top: -2px;" src="resource/img/add.png"/>
			</i>添加购物车</a> </span> 
                        </div>
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th width="7%" align="center">
						<input type="checkbox" autocomplete="off" id="chkAll" name="chkAll" onclick="if(this.checked==true){checkAll('sel_cartgoods[]');}else{clearAll('sel_cartgoods[]');}" style="height:28px;vertical-align:middle;">全选</th>
                                	<th width="6%" class="text-center">ID</th>
                                    <th width="6%" class="text-center">用户名</th>
                               		<th width="6%" class="text-center">商品图片</th>
                                    <th width="6%" class="text-center">商品名称</th>
                                    <th width="6%" class="text-center">商品描述</th>                           
                                    <th width="4%" class="text-center">售价</th>                           
                                    <th width="6%" class="text-center">折扣价</th>
                                    <th width="6%" class="text-center">更新时间</th>
                                    <th width="6%" class="text-center">添加时间</th>
                                    <th width="8%" class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${allTrolleyItem}" var="alltrolley">
							    	<tr>
							    	<td width="5%" align=center>
						<input type="checkbox" autocomplete="off" class="delids"class="delids" name="sel_cartgoods[]" value="${alltrolley.troid}" id="sel_cartgoods_20392"  onclick="select_cart_goods();"></td>
							    		<td>${alltrolley.troid }</td>
							    		<td>${alltrolley.xhusers.username }</td>
							    		<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath }/upload/${alltrolley.xhproduct.pimg }" title="">
					                            <img style="width:100px;height:80px" src="${pageContext.request.contextPath }/upload/${alltrolley.xhproduct.pimg }">
					                        </a>
							    		</td>							    	
							    		<td>${alltrolley.xhproduct.pname }</td>
							    		<td>${alltrolley.xhproduct.pdesc }</td>
							    		<td>${alltrolley.xhproduct.psale }</td>
							    		<td>${alltrolley.xhproduct.pdiscount }</td>
							    		<td>${alltrolley.xhproduct.paddtime }</td>
							    		<td>${alltrolley.xhproduct.pupdatetime }</td>
							    		
							    		<td class="text-center">
							    			<a onclick="btn2(${alltrolley.troid })" ><span class="glyphicon glyphicon-trash"></span></a>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach> 
                            </tbody>                     
                        </table>
                    </div>
                    <div class="ibox-content">
                        
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
    
    <script>
        $(document).ready(function(){       	
        	$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
    </script>
    
    
    <script type="text/javascript">
     /*全选  */
         
     function checkAll(name)
{
	var el = document.getElementsByTagName('input');
	var len = el.length;
	for(var i=0; i<len; i++)
	{
		if((el[i].type=="checkbox") && (el[i].name==name))
		{
			el[i].checked = true;
		}
	}
}
function clearAll(name)
{
	var el = document.getElementsByTagName('input');
	var len = el.length;
	for(var i=0; i<len; i++)
	{
		if((el[i].type=="checkbox") && (el[i].name==name))
		{
			el[i].checked = false;
		}
	}
}  
       
</script>
    
   <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/layui/lay/modules/layer.js"></script> 
    <script type="text/javascript">
        
       /*购物车-添加*/
     function add_trolley() { 
            layer.open({
                type: 2,
                title: '添加购物车',  
                area: ['300px', '300px'],
                shade: 0.8,
                closeBtn: 1,
                shadeClose: true,
                content:'${pageContext.request.contextPath}/jsp/back/trolley/addtrolley.jsp'
            });
        }


/* 点击删除 */
	function btn2(id){
		if(!confirm("您确定要删除购物车吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/trolley/deleteTrolley.action?id="+id,
	 			   type:"GET",
	 			   success:function(result){
	 					   if(result!=null){
	 						   alert("删除成功！");
	 						  window.location.href="${pageContext.request.contextPath }/trolley/myTrolley.action";
	 					   }else{
	 						  alert("删除失败！");
	 					   }	  
	 			   }
	 			   
	 		   });
	 	   }
	}
	/* 查看 */
	function btn3(id){ 		  
	 		function btn1(id){
    	
	   window.location.href="${pageContext.request.contextPath }/ad/queryadById.action?id="+id;
  		  
    }
	}
</script>
    
    
    
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>
    
    <!-- 
    	单选删除按钮
     -->
    <script type="text/javascript">
	 /*
		刷新按钮
	*/
	$("#flash").on("click",function(){
		 window.location.href="${pageContext.request.contextPath }/ad/queryAllAdsList.action";  	
	});
  
    /* 时间格式转换 */
    function fmtDate(obj){
	    var date =  new Date(obj);
	    var y = 1900+date.getYear();
	    var m = "0"+(date.getMonth()+1);
	    var d = "0"+date.getDate();
	    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
	} 
    
	
	
</script>

<script >
/*批量删除 */

function  bacthdele(){
	
    var ids= [];//定义一个数组
        
         $('.delids:checked').each(function(){      
            ids.push($(this).val());   
        });
        if (ids.length == 0) {
            alert("你还没有选择删除的内容！");
        }
        if (ids.length > 0) {
            location.href = "${pageContext.request.contextPath}/trolley/deleteTrolleyByIds.action?ids=" + ids;
        }
}
   </script> 
</body>

</html>
