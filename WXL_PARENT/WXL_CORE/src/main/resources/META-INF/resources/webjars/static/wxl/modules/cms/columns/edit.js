var table;
var tableId = "tableMain";
var baseUrl = ctx + "/cms/columns/";
layui.config({
	base : ctxStatic + '/plugins/layui/lay/modules/'
}).extend({
	treetable : 'treetable'
}).use([ 'form', 'table', 'laydate','treetable'  ],
	function() {
		/*var $ = layui.$, */
		element = layui.element, 
		layer = layui.layer, 
		laydate = layui.laydate, 
		form = layui.form, 
		index = parent.layer.getFrameIndex(window.name), 
		upload = layui.upload,
		treetable = parent.layui.treetable;
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
		
		 var photo_id = $("#image_id");
		 var photo_name = $("#image_name");
		 upload.render({
			 url:ctx + "/sys/storge/upload/cms/columns",
			 elem:"#LAY_avatarUpload",
			 accept: 'file',
<<<<<<< HEAD
			 size: 1024,
=======
			 size: 60,
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
			 exts: 'jpg|png|gif',
			 done:function(t){
				 if(t.msg == 'do_ok'){
					 var ids = t.ids;
					 if(ids.length > 0){
						 var x = ids[0];
						 photo_id.val(x.id);
						 photo_name.val(x.physicalName);
					 }
				 } else {
					 e.msg("上传失败。",{icon:5});
				 }
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
		form.on('submit(component-form-columns-edit)', function(data) {
			$.ajax({
				type : 'POST',
				url : baseUrl + "aysnsave",
				data : JSON.stringify(data.field),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) {
<<<<<<< HEAD
					parent.cms_Columns.initTreeTable();
					parent.layui.layer.msg('提交成功。', {
						time : 2000
					});
=======
//					treetable.reload(tableId);
					parent.layui.layer.msg('提交成功。', {
						time : 2000
					});
//					parent.location.reload();
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
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