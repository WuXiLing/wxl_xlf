var table;
var baseUrl = ctx + "/sys/area/";
var Area = {
		tableId : "area-table-operate",
		icon : "<i class='fa fa-user'></i>",
		table_btn : "area-table-operate-bar",
		operate_btn : ".area-operate-btn",
		query_layer : $(".area-query-layer"),
		tableUrl : baseUrl + "selectLayuiPageList",
		addUrl : baseUrl + "add",
		updUrl : baseUrl + "upd/",
		delUrl : baseUrl + "delete/",
		detailUrl : baseUrl + "detail/",
		moduleTitle : "区域"
	}
$("#" + Area.tableId).treeTable({
	expandLevel : 5
});
layui.use([ 'form' ], function() {
	form = layui.form;
	form.on('submit(component-form-area-query)', function(data) {
		return false;
	});

	var active = {
		add : function() {
			var index = parent.layui.layer.open({
				type : 2,
				title : Area.moduleTitle + '新增',
				content : Area.addUrl,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		toquery : function() {
			layer.open({
				type : 1,
				shade : false,
				title : false,
				offset : [ '100px' ],
				area : [ '500px', '240px' ],
				content : $('.area-component-layer'),
				cancel : function() {

				}
			});
		},
		query : function() {
			table.reload(tableId, {
				page : {
					curr : 1
				// 重新从第 1 页开始
				},
				where : {
					key : parseQuery()
				}
			});
		},
		upd : function() {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type : 2,
				title : Area.moduleTitle + '编辑',
				content : Area.updUrl + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		addChildren : function() {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type : 2,
				title : Area.moduleTitle + '新增',
				content : baseUrl + 'addChildren' + '/' + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		detail : function() {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type : 2,
				title : Area.moduleTitle + '详细',
				content : Area.detailUrl + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		del : function() {
			var id = $(this).data("id");
			var self = $(this);
			var haschild = $(this).parents("tr").first().attr("haschild");
			if (haschild == 'true') {
				layer.msg('有下级' + Area.moduleTitle + '，不能删除。', {
					time : 2000
				});
				return;
			} else {
				layer.msg('确定要删除记录吗？', {
					btn : [ '删除', '取消' ],
					yes : function(index) {
						$.ajax({
							type : "POST",
							url : Area.delUrl + id,
							data : {},
							success : function(data) {
								if (data && data.msg == 'del_ok') {
									$(self).parents("tr").first().remove();
									layer.msg('删除成功。', {
										time : 2000
									});
								} else {
									layer.msg('删除失败。', {
										time : 2000
									});
								}
							}
						});
					}
				});
			}
		}
	};

	$(Area.operate_btn + ' .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
});