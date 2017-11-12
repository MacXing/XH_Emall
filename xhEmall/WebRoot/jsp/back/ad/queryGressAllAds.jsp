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
    
    <title>广告管理</title>
    
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

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>广告信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="glyphicon glyphicon-plus"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a id="addProduct" onclick="addgresAds()">删除投放广告</a>
                               
                                </li>
                            </ul>
                            <a  id="flash">
                                <i class="fa fa-refresh"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead >
                                <tr>
                                    <th width="6%" align=center>
						            <input type="checkbox" autocomplete="off" id="chkAll" name="chkAll" onclick="if(this.checked==true){checkAll('sel_cartgoods[]');}else{clearAll('sel_cartgoods[]');}" style="height:28px;vertical-align:middle;" >全选</th>
                                	<th width="6%" class="text-center">ID</th>
                                    <th width="6%" class="text-center">位置</th>
                               		<th width="6%" class="text-center">图片</th>
                                    <th width="6%" class="text-center">标题</th>
                                    <th width="6%"class="text-center">描述</th>                           
                                    <th width="6%"class="text-center">连接</th>                           
                                    <th width="6%"class="text-center">开始时间</th>
                                    <th width="6%"class="text-center">结束时间</th>
                                    <th width="6%"class="text-center">点击数</th>
                                    <th width="6%"class="text-center">状态</th>
                                    <th width="9%"class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${allAdss}" var="allAdss">
							    	<tr>
							    	    <td width="5%" align=center>
						<input type="checkbox" autocomplete="off" class="delids" name="sel_cartgoods[]" value="${allAdss.adid}" ></td>
							    		<td>${allAdss.adid}</td>
							    		<td>${allAdss.position.positionName }</td>
							    		<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath }/upload/${allAdss.adimg}" title="">
					                            <img style="width:100px;height:80px"; src="${pageContext.request.contextPath }/upload/${allAdss.adimg}" />
					                        </a>
							    		</td>							    	
							    		<td>${allAdss.adname }</td>
							    		<td>${allAdss.adtxt}</td>
							    		<td>${allAdss.adlink}</td>
							    		<td>${allAdss.adstarttime}</td>
							    		<td>${allAdss.adendtime}</td>
							    		<td>${allAdss.adclick}</td>
							    		<td>${allAdss.adstatue}</td>
							    		
							    		<td class="text-center">
							    		<a title="移除" href="javascript:;" onclick="deleteOnesieAds(${allAdss.adid})" style="text-decoration:none"><i class="Hui-iconfont">
                                           <img width="16px"  style=" margin-top: -5.5px;" src="resource/img/la.png"/></i></a> 
                       
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
    
    
    </script>
    
    <script type="text/javascript">
        
       /* 广告-批量移除投放 */

function addgresAds(){
	if(!confirm("您确定要移除投放广告的报名记录吗？")){
      return false;
      }else{
        var ids= [];
         
         $('.delids:checked').each(function(){      
            ids.push($(this).val());   
        });
        if (ids.length == 0) {
            alert("你还没有选择移除的内容！");
        }
        if (ids.length > 0) {
         $.ajax({
         url:"${pageContext.request.contextPath}/ad/updateaAdStatuede.action?ids="+ids,
         type:"GET",
         success:function(result){
           if(result!=null){
            alert("移除成功");
            window.location.href="${pageContext.request.contextPath}/ad/queryStatueAllAds.action";
           }else{
           alert("移除失败");
           }
         }
      });
        }
        }
}

/* 移除-广告 */
function deleteOnesieAds(id){
	if(!confirm("您确定要移除这条投放广告吗？")){
      return false;
      }else{
         $.ajax({
         url:"${pageContext.request.contextPath}/ad/updateaAddeById.action?id="+id,
         type:"GET",
         success:function(result){
           if(result!=null){
            alert("移除成功");
           window.location.href="${pageContext.request.contextPath}/ad/queryStatueAllAds.action";
           }else{
           alert("移除失败");
           }
         }
      });
        }
      
}
</script>
</body>

</html>
