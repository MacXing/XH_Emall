/**
 * 
 */
$(document).ready(
		function() {
			$(".demo1").click(function() {
				swal({
					title : "欢迎使用SweetAlert",
					text : "Sweet Alert 是一个替代传统的 JavaScript Alert 的漂亮提示效果。"
				})
			});
			$(".demo2").click(function() {
				swal({
					title : "太帅了",
					text : "小手一抖就打开了一个框",
					type : "success"
				})
			});
			$(".demo3").click(function() {
				swal({
					title : "您确定要删除这条信息吗",
					text : "删除后将无法恢复，请谨慎操作！",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "删除",
					closeOnConfirm : false
				}, function() {
					swal("删除成功！", "您已经永久删除了这条信息。", "success")
				})
			});
			
			$(".dataTables-example").dataTable();
			var oTable = $("#editable").dataTable();
			oTable.$("td").editable("../example_ajax.php", {
				"callback" : function(sValue, y) {
					var aPos = oTable.fnGetPosition(this);
					oTable.fnUpdate(sValue, aPos[0], aPos[1])
				},
				"submitdata" : function(value, settings) {
					return {
						"row_id" : this.parentNode.getAttribute("id"),
						"column" : oTable.fnGetPosition(this)[2]
					}
				},
				"width" : "90%",
				"height" : "100%"
			});
			$("").click(
				function(){
					alert(123);
				}
			);
		});

