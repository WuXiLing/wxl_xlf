var table;
var tableId = "dict-type-table-operate";
var baseUrl = ctx + "/sys/dicttype/";
layui.use([ 'form', 'table'  ],
	function() {
		element = layui.element, 
		layer = layui.layer, 
		form = layui.form, 
		index = parent.layer.getFrameIndex(window.name), 
		table = parent.layui.table;
		form.render(null, 'component-form-group');

		/* 自定义验证规则 */
		form.verify({
			title : function(value) {
				if (value.length < 5) {
					//return '标题至少得5个字符啊';
				}
			},
			content : function(value) {
				layedit.sync(editIndex);
			},
			unique : function(value) {
				$.ajax({
					type : 'POST',
					url : baseUrl + "check",
					data : {
						"name" : value
					},
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(msg) {
						if(msg == 'true'){
							return true;
						} else {
							return "名称重复。";
						}
					},
					error : function() {
						parent.layer.alert("验证失败。", {
							title : '提示'
						});
						return "验证名称重复失败。";
					}
				});
			}
		});
		/* 监听提交 */
		form.on('submit(component-form-dit-type-edit)', function(data) {
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
		
		$(".close").on("click",function(){
			parent.layer.close(index);
		});
	});