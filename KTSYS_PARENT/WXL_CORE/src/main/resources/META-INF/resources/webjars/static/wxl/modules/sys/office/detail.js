var baseUrl = ctx + "/sys/office/";
var page_id = "office_detail";
$(function() {
//	var parentWindow;
//	for (var i = 0; i < window.parent.length; i++) {
//		if ("office_list" == window.parent[i].page_id) {
//			parentWindow = window.parent[i];
//			break;
//		}
//	}
	form = layui.form, index = parent.layer.getFrameIndex(window.name), form
			.render(null, 'component-form-group');

	var active = {
		close : function() {
			parent.layer.close(index);
		}
	}
	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
});