<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>

<head>
    <base href="<%=basePath%>">
	<title>添加管理员信息</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- <link rel="shortcut icon" href="favicon.ico"> -->
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resource/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
    <style>
    .layui-upload-img {
        width: 92px;
        height: 92px;
        margin: 0 10px 10px 0;
    }
    </style>
    <base target="_blank">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>添加管理员</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="signupForm1">
                            <div>
                                <input type="hidden" name="adminid" id="adminid">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">帐号：</label>
                                <div class="col-sm-8">
                                    <input id="adminname" name="adminname" minlength="2" type="text" class="form-control" required="" aria-required="true" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-8">
                                    <input id="adminpassword" name="adminpassword"
                                        class="form-control" type="password">
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label class="col-sm-3 control-label">确认密码：</label>
                                <div class="col-sm-8">
                                    <input id="confirm_password" name="confirm_password"
                                        class="form-control" type="password">
                                    <span class="help-block m-b-none">
                                        <i class="fa fa-info-circle"></i> 请再次输入您的密码
                                    </span>
                                </div>
                            </div> -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系电话：</label>
                                <div class="col-sm-8">
                                    <input id="adminPhone" name="adminphone" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">E-mail：</label>
                                <div class="col-sm-8">
                                    <input id="adminemail" type="email" class="form-control" name="adminemail" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">管理员头像：</label>
                                <div class="col-sm-8">
                                    <div class="layui-upload">
                                        <button type="button" class="layui-btn" id="test1">上传图片</button>
                                        <div class="layui-upload-list">
                                            <img class="layui-upload-img" id="demo1">
                                            <p id="demoText"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8">
                                    <input id="adminphoto" name="adminphoto" type="hidden">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">说明：</label>
                                <div class="col-sm-8">
                                    <textarea id="admindescribe" name="admindescribe" class="form-control" required="" aria-required="true"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <button type="button" class="btn btn-primary" id="submitform">提交</button>
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
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    <!-- <script src="js/plugins/validate/jquery.validate.min.js"></script> -->
    <!-- <script src="js/plugins/validate/messages_zh.min.js"></script> -->
    <!-- <script src="js/demo/form-validate-demo.min.js"></script> -->
    <script src="resource/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="resource/layer/layer.js"></script>
    <script src="resource/layui/layui.js"></script>
    <script src="resource/js/validate.js" type="text/javascript"></script>
    
    <script>
    $("#submitform").click(function (){
	
		var val = new validate({
		
			rules:{
				adminname:"notEmpty",   
				adminpassword:"password",
				adminPhone:"mobile",
				adminemail:"email"
			},
			/*submitFun里面为检验成功后要执行的方法*/
			submitFun:function(){
		
				
		$.ajax({
    		url : "${pageContext.request.contextPath }/admin/addAdmin.action",
    		type : "POST",
    		data : JSON.stringify($("#signupForm1").serializeObject()),
    		dataType: "json",
    		contentType: "application/json",
    		success : function(result){
				if(result){
					swal({
						title : "提示",
						text : "更新成功！！"},
						function(){
							$("#close").click(); 
							self.location.reload();
						}
					);
				} else {
					swal({
						title : "提示",
						text : "更新失败！！",
						confirmButtonColor : "#F00"
					});
				}
				
			}
    		
    	});
				
				
			}
		});
		
	
	
	});


</script>
    
    <script>
    layui.use('upload', function() {
        var $ = layui.jquery,
            upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1',
            url: '${pageContext.request.contextPath }/admin/uploadfile.action',
            before: function(obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            },
            done: function(res) {
                //如果上传失败
                if (res.code == 200) {
                	console.log(res);
                    return layer.msg('上传失败');
                }
                //上传成功
                console.log(res);
                $("#adminphoto").attr("value", res.extend.savePath);
            },
            error: function() {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function() {
                    uploadInst.upload();
                });
            }
        });
    });
    $.fn.serializeObject = function () {  
	    var o = {};  
	    var a = this.serializeArray();  
	    $.each(a, function () {  
	        if (o[this.name]) {  
	            if (!o[this.name].push) {  
	                o[this.name] = [o[this.name]];  
	            }  
	            o[this.name].push(this.value || '');  
	        } else {  
	            o[this.name] = this.value || '';  
	        }  
	    });  
	    return o;  
	}; 
	$("#submitform").click(function (){
		//var id = $(this).parent().find("input[type='checkbox']").val();
		//var formdata = new FormData($("#signupForm1"));
		//console.log("test");
		//console.log();
		console.log($("#signupForm1"));
		
	});
    </script>
</body>

</html>

