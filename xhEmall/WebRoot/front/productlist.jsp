<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>孝和电商</title>
        
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="front/css/style.css" />
   
    <script type="text/javascript" src="front/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="front/js/jquery.bxslider_e88acd1b.js"></script>    
    <script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="front/js/menu.js"></script>                
	<script type="text/javascript" src="front/js/lrscroll_1.js"></script>        
	<script type="text/javascript" src="front/js/n_nav.js"></script>    
    <script type="text/javascript" src="front/js/milk_ban.js"></script>
    <script type="text/javascript" src="front/js/paper_ban.js"></script>
    <script type="text/javascript" src="front/js/baby_ban.js"></script>
    

</head>
<body>  
<jsp:include page="/front/head.jsp" flush="true"/>
<div class="i_bg">
	<div class="postion">
    	
    </div>
    
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="his_t">
            	<span class="fl">浏览历史</span>
                <span class="fr"><a href="#">清空</a></span>
            </div>
        	<ul>
            	<li>
                    <div class="img"><a href="#"><img src="front/images/his_1.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_2.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_3.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_4.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="front/images/his_5.jpg" width="185" height="162" /></a></div>
                	<div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                    	<font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
        	</ul>
        </div>
        <div class="l_list">
        	<div class="list_t">
            	<span class="fl list_or">
                	<a href="#" class="now">默认</a>
                    <a href="#">
                    	<span class="fl">销量</span>                        
                        <span class="i_up">销量从低到高显示</span>
                        <span class="i_down">销量从高到低显示</span>                                                     
                    </a>
                    <a href="#">
                    	<span class="fl">价格</span>                        
                        <span class="i_up">价格从低到高显示</span>
                        <span class="i_down">价格从高到低显示</span>     
                    </a>
                    <a href="#">新品</a>
                </span>
                <span class="fr">共发现120件</span>
            </div>
            <div class="list_c">           	
                <ul class="cate_list">
                <c:forEach items="${pageInfo.list}" var="product">
                	<li>
                    	<div class="img">
	                    	<a href="${pageContext.request.contextPath}/ProductDetails/queryImagesByPid.action?pid=${product.pid }" target="_blank">
	                    		<img src="${pageContext.request.contextPath}${product.pimg}" width="210" height="185" />
	                    	</a>
                    	</div>
                        <div class="price">
                            <font>￥<span>${product.psale }</span></font>
                        </div>
	            		<input type="hidden" name="userid"  id="userid" value="${current_user.userid }"/>
	            		<input type="hidden" name="pid"  id="pid" value="${product.pid }"/>
	            		<input type="hidden" name="pnum" id="pnum" value="1"/>
                        <div class="name"><a href="#">${product.pname }</a></div>
                        <div class="carbg">
                        	<a href="#" class="ss">收藏</a>
                            <c:if test="${current_user!=null}">
                            <a href="javascript:void();" onclick="addtro(${product.pid });" class="j_car">加入购物车</a>
                            </c:if>
                            <c:if test="${current_user==null}">
                            <a href="front/Login.jsp" class="j_car">加入购物车</a>
                            </c:if>
                        </div>
                    </li>
                </c:forEach>
                </ul>
                
                <div class="pages">   
                <c:if test="${pageInfo.hasPreviousPage==true }">                  
                   <a class="p_pre" href="home/queryproductsByCategory.action?pageNum=${pageInfo.pageNum-1}&catid=${catid}">上一页</a>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage==false }">
                	<a class="p_pre" href="home/queryproductsByCategory.action?pageNum=${pageInfo.pageNum}&catid=${catid}">上一页</a>
                </c:if> 
                <c:forEach items="${pageInfo.navigatepageNums }" var="n">
                	<a href="home/queryproductsByCategory.action?pageNum=${n}&catid=encodeURI(encodeURI(${catid}))">${n}</a>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage==true }">                  
                   <a class="p_pre" href="home/queryproductsByCategory.action?pageNum=${pageInfo.pageNum+1}&catid=${catid}">下一页</a>
                </c:if>
                <c:if test="${pageInfo.hasNextPage==false }">                  
                   <a class="p_pre" href="home/queryproductsByCategory.action?pageNum=${pageInfo.pageNum}&catid=${catid}">下一页</a>
                </c:if> 
                </div>
                                                
            </div>
        </div>
    </div>
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="front/images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
	<jsp:include page="/front/foot.jsp"/>
    <!--End Footer End -->    
</div>

<script type="text/javascript">
     function addtro(pid){
     	 alert(pid);
    	 if(!$("#userid").val()>0){
    		 alert("亲登录！");
    		 return;
    	 }
        alert($("#userid").val());
        alert(pid);
        $.ajax({
        	url:"${pageContext.request.contextPath}/trolley/addTroItem.action?pid="+pid+"&userid="+$("#userid").val()+"&pnum="+1,
        	type:"POST",
        	/* data:formData, 
		    contentType: false,
		    processData: false, */ 
        	success:function(result){
        		if(result.code==100){
        			alert("添加成功！");
        			location.reload([bForceGet]); 
        		}else{
        			alert("添加失败！");
        		}
        	}
        });
     }
    
    </script>
</body>

</html>
