var table;
var tableId = "modeler-table-operate";
var baseUrl = ctx + "/act/modeler/";
var w_index = 0;
;!function(){
	let ws = parent.window;
	if (ws && ws.length > 0) {
		for (var i in ws) {
			if (ws[i] instanceof Window) {
				if (ws[i].sysId == 'act_modeler') {
					w_index = i;
					break;
				}
			}
		}
	}
	layer = layui.layer,
		form = layui.form,
		index = parent.layer.getFrameIndex(window.name),
		table = parent.window[w_index].layui.table;
	form.render(null, 'component-form-group');

	/* 自定义验证规则 */
	form.verify({
		title: function (value) {
			if (value.length < 5) {
				//return '标题至少得5个字符啊';
			}
		},
		content: function (value) {
			layedit.sync(editIndex);
		}
	});
	alert('1');
	/* 监听提交 */
	form.on('submit(component-form-modeler-edit)', function (data) {
		alert();
		$.ajax({
			type: 'POST',
			url: baseUrl + "aysnsave",
			data: JSON.stringify(data.field),
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (msg) {
				parent.window[w_index].layui.table.reload(tableId);
				parent.layui.layer.msg('提交成功。', {
					time: 2000
				});
				parent.layer.close(index);
			},
			error: function () {
				parent.layer.alert("提交失败。", {
					title: '提示'
				});
			}
		});
		return false;
	});

	var active = {
		close: function () {
			parent.layer.close(index);
		}
	}

	$('.layui-btn').on('click', function () {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
};