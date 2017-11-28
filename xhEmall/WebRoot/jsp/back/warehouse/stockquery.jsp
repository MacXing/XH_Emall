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
    
    <title>H+ 后台主题UI框架 - 数据表格</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
    <div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>库存查询</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a id="refresh">
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
		               <th class="text-center">仓库编号</th>
		               <th class="text-center">仓库名称</th>
		               <th class="text-center">仓库地址</th>
		               <th class="text-center">商品编号</th>
		               <th class="text-center">商品名称</th>
		               <th class="text-center">所属品牌</th>
		               <th class="text-center">商品描述</th>
		               <th class="text-center">商品库存</th>
		               <th class="text-center">操作</th>
		           </tr>
                </thead>
                <tbody>
                    <c:forEach items="${xhstocks }" var="stocks">                   
				        <tr>
					        <td>${stocks.xhrepertory.repid }</td>
					        <td>${stocks.xhrepertory.repname }</td>
					        <td>${stocks.xhrepertory.repaddress }</td>					                	
					        <td>${stocks.xhproduct.pid }</td>
					        <td>${stocks.xhproduct.pname }</td>
					        <td>${stocks.xhproduct.brand.brandname }</td>
					        <td>${stocks.xhproduct.pdesc }</td>
					        <td>${stocks.stonumber }</td>
					        <td>
					        <button class="btn btn-success btn-circle btn-outline" type="button"
					        		onclick="querybtn(${stocks.xhproduct.pid })">
					        <i class="glyphicon glyphicon-search"></i>
                            </button>
                            </td>					                		                	
				        </tr> 			                      	
			        </c:forEach>
                </tbody>                            
            </table>
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
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	
	<script type="text/javascript">
		$("#refresh").on("click",function(){
			window.location.href="${pageContext.request.contextPath}/repertory/queryStock.action";
		});
	</script>
	
	<script type="text/javascript">
		function querybtn(id){    	
	   		window.location.href="${pageContext.request.contextPath }/jsp/back/product/productInfo.jsp?id="+id; 		  
    	}
	</script>
	
</body>

</html>
