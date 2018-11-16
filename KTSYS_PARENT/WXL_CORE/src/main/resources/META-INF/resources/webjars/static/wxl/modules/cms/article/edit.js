var table;
var tableId = "article-table-operate";
var baseUrl = ctx + "/cms/article/";
layui.use([ 'colorpicker','form', 'laydate', 'table'  ],
	function() {
	var element = layui.element; 
	var layer = layui.layer;
	var laydate = layui.laydate; 
	var form = layui.form; 
	var index = parent.layer.getFrameIndex(window.name);
	var upload = layui.upload;
		 var colorpicker = layui.colorpicker;
		form.render(null, 'component-form-article-edit');
		table = parent.layui.table;

		var releaseDate = $("#releaseDate").val();
		 laydate.render({
		      elem: '#releaseDate'
		      ,type: 'datetime'
		      ,value : releaseDate ? new Date(releaseDate) : new Date()
		      ,done: function(value, date){
		          if(!value){ 
		        	  form.val('component-form-article-edit', {"status": false})
		          }
		       }
		 });
		 
	   /* colorpicker.render({
		    elem: '#color'  //绑定元素
		 });*/
	    
		var color = $('#color').val();
		if(!color){
			$('#color').val('#f51c40');
		}
	    colorpicker.render({
	        elem: '#colorpicker-color'
	        ,color: color ? color : '#f51c40'
	        ,done: function(color){
	          $('#color').val(color);
	        }
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
			 url:ctx + "/sys/storge/upload/cms/article",
			 elem:"#LAY_avatarUpload",
			 accept: 'file',
			 size: 1024,
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
		form.on('switch(switchStatus)',function(data) {
		        if(this.checked){
		        	var releaseDate = $("#releaseDate").val();
		        	if(!releaseDate){
		        		form.val('component-form-article-edit', {"status": false});
		        		layer.msg("请先设置：<span style='color:red;'>发布日期。<span>", {icon: 5});
		        	}
		        }
		});

		var ue = UE.getEditor('content');
		/* 监听提交 */
		form.on('submit(component-form-article-edit)', function(data) {
			var content = ue.getContentTxt();
			if(!content || content.length == 0){
				layer.msg("请输入：<span style='color:red;'>内容。<span>", {icon: 5});
				return false;
			}
			$.ajax({
				type : 'POST',
				url : baseUrl + "aysnsave",
				data : JSON.stringify(data.field),
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) {
					parent.layui.table.reload(tableId, {
						page : {
							curr : 1
						// 重新从第 1 页开始
						},
						where : {
							key : {
								"columnsId" : $("#columnsId").val()
							}
						}
					});
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