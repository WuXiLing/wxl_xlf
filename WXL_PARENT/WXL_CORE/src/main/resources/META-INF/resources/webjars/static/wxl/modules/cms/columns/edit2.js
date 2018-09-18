var table;
var tableId = "tableMain";
var baseUrl = ctx + "/cms/columns/";
$(function() {
	/* var $ = layui.$, */
	element = layui.element, 
	layer = layui.layer, 
	laydate = layui.laydate,
    form = layui.form, 
    upload = layui.upload, 
    form.render(null,'component-form-group');

	/* 自定义验证规则 */
	form.verify({
		title : function(value) {
			if (value.length < 5) {
				// return '标题至少得5个字符啊';
			}
		},
		content : function(value) {
			layedit.sync(editIndex);
		}
	});

	$(".datatime").each(function(i,e){
		var v = $(e).val();
		var d = $(e).data("default");
		laydate.render({
			elem: $(e)
			,type: $(e).data("type")
			,value : v ? new Date(v) : (d ? new Date() : "" ) 
		});
	});
	 
	$(".image").each(function(i,e){
		var name = $(e).attr("name");
		var file_id = $("#" + name + "_id");
		var file_name = $("#" + name + "_name");
		upload.render({
			url : ctx + "/sys/storge/upload/cms/columns",
			elem : "#" + name + "_upload",
			accept : 'file',
			size : 60,
			exts : 'jpg|png|gif',
			done : function(t) {
				if (t.msg == 'do_ok') {
					var ids = t.ids;
					if (ids.length > 0) {
						var x = ids[0];
						file_id.val(x.id);
						file_name.val(x.physicalName);
					}
				} else {
					e.msg("上传失败。", {
						icon : 5
					});
				}
			}
		});
	});

	/* 监听提交 */
	form.on('submit(component-form-columns-edit)', function(data) {
		$.ajax({
			type : 'POST',
			url : baseUrl + "aysnsave",
			data : JSON.stringify(data.field),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(msg) {
				parent.cms_Columns.reloadTable();
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