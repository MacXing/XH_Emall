<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="search.css">
	
  <script type="text/javascript" src="front/js/jquery-1.8.2.min.js"></script>
  </head>
  
  <body>
      
    <div class="gover_search">  
        <div class="gover_search_form clearfix">  
            <span class="search_t">关键词匹配搜索</span>  
            <input type="text" class="input_search_key" id="gover_search_key" placeholder="请输入关键词直接搜索" />  
            <button type="submit" class="search_btn">搜索</button>  
            <div class="search_suggest" id="gov_search_suggest">  
                <ul>  
                </ul>  
            </div>  
        </div>  
    </div>
    <script type="text/javascript">
       /* 实现搜索输入框的输入提示 */
         function searchSuggest(serachf){
              var input =$("#gover_search_key");
              var suggestWarp=$("#gov_search_suggest");
              var key="";
              var hideSuggest=function(){
                  suggestWarp.hide();
              }
              var init=fuction(){
                  input.bind('keyup',sendKeyWord);
                  input.bind('blur',function(){
                    setTimeOut(hideSuggest,100);
                  });
              }
             
             /*  发送请求，根据关键字到后台查询*/
               var sendKeyWord=function(event){
                   
               }
              
         }
    </script>
  </body>
</html>
