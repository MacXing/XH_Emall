<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'trolley.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
    -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/trolley/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>


 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/H-ui.min.css" />
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/addtorlley/H-ui.admin.css" /> 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/addtorlley/font-awesome.min.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/js/layui/css/modules/layer/default/layer.css"/>


  </head>
  
  <body>
       <nav class="breadcrumb"><i class="Hui-iconfont"><img width="17px" style=" margin-top: -5.5px;" src="resource/img/index.png"/></i> 首页 <span class="c-gray en">&gt;</span> 购物车管理 <span class="c-gray en">&gt;</span> 购物车维护 <span class="c-gray en">&gt;</span> 购物车信息<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont"><img style="color:#468847 ; width: 17px;margin-top: 2px;" src="resource/img/source.png"/></i></a></nav>
       <form action="${pageContext.request.contextPath}/trolley/myTrolley.action" method="post">
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray"> 
			<span class="l"> 
			<a onclick="bacthdele()" href="javascript:;" class="btn btn-danger radius">
			<i class="Hui-iconfont">
			<img style="color:#468847 ; width: 14px;margin-top: -2px;" src="resource/img/la.png"/>
			</i> 批量删除</a> 
			<a class="btn btn-primary radius" href="javascript:;" onclick="add_trolley()" id="add-trolley">
			<i class="Hui-iconfont">
			<img style="color:#468847 ; width: 14px;margin-top: -2px;" src="resource/img/add.png"/>
			</i>添加购物车</a> </span> 
			<span class="r">共有数据：<strong>54</strong>条</span> </div>
			<div class="mt-10">
			<table class="table table-border table-bordered table-hover table-bg" id="tableSource">
				<thead>
					<tr>
						<th width="100%" scope="col" colspan="16">购物车管理</th>
					</tr>
					<tr class="text-c">
						<th width="6%" align=center>
						<input type="checkbox" autocomplete="off" id="chkAll" name="chkAll"   onclick="if(this.checked==true){checkAll('sel_cartgoods[]');}else{clearAll('sel_cartgoods[]');}" style="height:28px;vertical-align:middle;" >全选</th>
                        <th width="9%" align=center>购物车id</th>
                        <th width="6%" align=center>用户id</th>
                        <th width="6%" align=center>用户名</th>
                        <th width="9%" align=center>用户头像</th>
                        <th width="6%" align=center>商品id</th>
                        <th width="9%" align=center>商品名称</th>
                        <th width="9%" align=center>商品描述</th>
                        <th width="9%" align=center>商品图片</th>
                        <th width="6%" align=center>售价</th>
                        <th width="6%" align=center>折扣价</th>
                        <th width="6%" align=center>更新时间</th>
                        <th width="6%" align=center>添加时间</th>
                        <th width="7%" align=center colspan="2">操作</th>
                       
					</tr>
				</thead>
				
				<c:forEach items="${allTrolleyItem}"  var="alltrolley">
				<tbody>
					<tr class="text-c">
						<td width="5%" align=center>
						<input type="checkbox" autocomplete="off" class="delids" name="sel_cartgoods[]" value="${alltrolley.troid}" id="sel_cartgoods_20392"  onclick="select_cart_goods();"></td>
                        <td width="9%" align=center>${alltrolley.troid }</td>
                        <td width="6%" align=center>${alltrolley.xhusers.userid }</td>
                        <td width="6%" align=center>${alltrolley.xhusers.username }</td>
                        <td width="9%" align=center>${alltrolley.xhusers.userphoto }</td>
                        <td width="6%" align=center>${alltrolley.xhproduct.pid }</td>
                        <td width="9%" align=center>${alltrolley.xhproduct.pname }</td>
                        <td width="9%" align=center>${alltrolley.xhproduct.pdesc }</td>
                        <td width="9%" align=center>${alltrolley.xhproduct.pimg }</td>
                        <td width="6%" align=center>${alltrolley.xhproduct.psale }</td>
                        <td width="6%" align=center>${alltrolley.xhproduct.pdiscount }</td>
                        <td width="6%" align=center>${alltrolley.xhproduct.paddtime }</td>
                        <td width="6%" align=center>
                        <font class="cart_jmprice" id="subtotal_20392"></font>
                         ${alltrolley.xhproduct.pupdatetime }
                         </td>
                        <td class="f-14"><a title="编辑" href="javascript:;"  style="text-decoration:none"><i class="Hui-iconfont">
                        <img width="16px" style=" margin-top: -5.5px;" src="resource/img/pen.png"/></i></a> 
                        <a title="删除" href="${pageContext.request.contextPath}/trolley/deleteTrolley.action?id=${alltrolley.troid}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">
                        <img width="15px" style=" margin-top: -5.5px;" src="resource/img/la.png"/></i></a></td>
                        
                        </td>
					</tr>
				</tbody>
				</c:forEach>
				</form>
			</table>
			</div>
		</article>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/layui/lay/modules/layer.js"></script>
 <script>
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
