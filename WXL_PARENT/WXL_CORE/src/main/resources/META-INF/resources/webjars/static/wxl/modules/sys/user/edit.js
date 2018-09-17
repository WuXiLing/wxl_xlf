var table;
var tableId = "user-table-operate";
var baseUrl = ctx + "/sys/user/";
layui.use([ 'form', 'laydate', 'upload', 'table'  ],
	function() {
		/*var $ = layui.$, */
		element = layui.element, 
		layer = layui.layer, 
		laydate = layui.laydate, 
		form = layui.form, 
		upload = layui.upload,
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
			},
			nickname:function(t,i){
				 return new RegExp("^[a-zA-Z0-9_一-龥\\s·]+$").test(t)?/(^\_)|(\__)|(\_+$)/.test(t)?"用户名首尾不能出现下划线'_'":/^\d+\d+\d$/.test(t)?"用户名不能全为数字":void 0:"用户名不能有特殊字符"
			},
			pass:[/^[\S]{6,12}$/,"密码必须6到12位，且不能出现空格"],
			repass:function(t){
				 if(t!==i("#LAY_password").val()){
					 return"两次密码输入不一致"
				 }
			 }
		});
		 var photo_id = $("#photo_id");
		 var photo_name = $("#photo_name");
		 upload.render({
			 url:ctx + "/sys/storge/upload/admin/user",
			 elem:"#LAY_avatarUpload",
			 accept: 'file',
			 size: 6000,
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
					 //e.msg("上传失败。",{icon:5});
				 }
			 }
		 });
		 
		 /*view.events.avartatPreview = function(t){
			 var i = r.val();
			 e.photos({
				 photos:{
					title:"查看头像",
					data:[{src:i}]
			     },
				 shade:.01,
				 closeBtn:1,
				 anim:5
			  })
		}*/
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
		form.on('submit(component-form-user-edit)', function(data) {
			if(true){
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
			}
			return false;
		});
		
		var verify = function(data){
			$.ajax({
				type : 'POST',
				url : baseUrl + "verify",
				data : JSON.stringify(data.field),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) {
					if(msg.verify_msg == 0){
						return true;
					} else {
						layer.msg("数据重复，请重新输入。");
						return false;
					}
				},
				error : function() {
					parent.layer.alert("验证数据失败。", {
						title : '提示'
					});
					return false;
				}
			});
			return false;
		}
		
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