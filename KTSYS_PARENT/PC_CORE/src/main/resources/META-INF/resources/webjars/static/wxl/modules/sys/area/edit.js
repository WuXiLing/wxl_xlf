var table;
var tableId = "area-table-operate";
var baseUrl = ctx + "/sys/area/";
layui.use([ 'form', 'laydate', 'table'  ],
	function() {
		/*var $ = layui.$, */
		element = layui.element, 
		layer = layui.layer, 
		laydate = layui.laydate, 
		form = layui.form, 
		index = parent.layer.getFrameIndex(window.name), 
		upload = layui.upload,
		table = parent.layui.table;
		form.render(null, 'component-form-group');
		laydate.render({
			elem : '#LAY-component-form-group-date'
		});

		/* 自定义验证规则 */
		form.verify({
			title : function(value) {
				if (value.length < 5) {
					//return '标题至少得5个字符啊';
				}
			},
			content : function(value) {
				layedit.sync(editIndex);
			}
		});

		/* 监听指定开关 */
		form.on('switch(component-form-switchTest)',
				function(data) {
					layer.msg('开关checked：'
							+ (this.checked ? 'true' : 'false'), {
						offset : '6px'
					});
					layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
							data.othis)
				});

		/* 监听提交 */
		form.on('submit(component-form-area-edit)', function(data) {
			$.ajax({
				type : 'POST',
				url : baseUrl + "aysnsave",
				data : JSON.stringify(data.field),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) {
					table.reload(tableId);
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
		    close : function(){
			   parent.layer.close(index);
			}
		}
					
		$('.layui-btn').on('click', function() {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});