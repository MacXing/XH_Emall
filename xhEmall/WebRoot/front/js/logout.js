/**
 * 页面退出操作
 */
$(".logout").click(function() {
	$.ajax({
		url : "user/logout.action",
		success : function(result) {
			if (result.status == 0) {
				window.location.href = "front/index.jsp";
			} else {
				layer.msg('退出失败');
			}
		}
	});
});