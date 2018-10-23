var tableId = "tableMain";
var baseUrl = ctx + "/sys/menu/";
var page_id = "menu_edit";
$(function() {
	var parentWindow;
	for (var i = 0; i < window.parent.length; i++) {
		if ("menu_list" == window.parent[i].page_id) {
			parentWindow = window.parent[i];
		}
	}
	element = layui.element, layer = layui.layer, form = layui.form,
			index = parent.layer.getFrameIndex(window.name), form.render(null,
					'component-form-group');
	table = parent.layui.table;
	/* 自定义验证规则 */
	form.verify({
		title : function(value) {
			if (value.length < 5) {
				// return '标题至少得5个字符啊';
			}
		},
		content : function(value) {
			layedit.sync(editIndex);
		},
		nickname : function(t, i) {
			return new RegExp("^[a-zA-Z0-9_一-龥\\s·]+$").test(t) ? /(^\_)|(\__)|(\_+$)/
					.test(t) ? "用户名首尾不能出现下划线'_'"
					: /^\d+\d+\d$/.test(t) ? "用户名不能全为数字" : void 0
					: "用户名不能有特殊字符"
		},
		pass : [ /^[\S]{6,12}$/, "密码必须6到12位，且不能出现空格" ],
		repass : function(t) {
			if (t !== i("#LAY_password").val()) {
				return "两次密码输入不一致"
			}
		}
	});
	/* 监听提交 */
	form.on('submit(component-form-menu-edit)', function(data) {
		$.ajax({
			type : 'POST',
			url : baseUrl + "aysnsave",
			data : JSON.stringify(data.field),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(msg) {
				table.reload(tableId);
//				parentWindow.inittreeTable();
				parent.layui.layer.msg('提交成功。', {
					time : 2000
				});
				parent.layer.close(index);
			},
			error : function() {
				parent.layer.alert("提交失败。", {
					title : '提示'
				});
			}
		});
		return false;
	});
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