var table_item;
var item_baseUrl = ctx + "/sys/dictitem/";
var DictItem = {
	tableId : "dict-item-table-operate",
	icon : "<i class='fa fa-book'></i> ",
	table_bar : "dict-item-table-operate-bar",
	operate_btn : ".dict-item-operate-btn",
	query_layer : $(".dict-item-query-layer"),
	tableUrl : item_baseUrl + "selectLayuiPageList",
	addUrl : item_baseUrl + "add",
	updUrl : item_baseUrl + "upd/",
	delUrl : item_baseUrl + "delete/",
	detailUrl : item_baseUrl + "detail/",
	moduleTitle : "数据字典条目"
}
function reload_item() {
	table_item.reload(DictItem.tableId, {
		page : {
			curr : 1
		// 重新从第 1 页开始
		},
		where : {
			key : {
				"dictTypeId" : selectId
			}
		}
	});
}

;!function(){
	table_item = layui.table;
	form = layui.form;
	table_item.render({
		elem : '#' + DictItem.tableId,
		url : DictItem.tableUrl,
		height : 'full-50',
		even : true,
		where : {
			key : {
				"dictTypeId" : selectId
			}
		},
		cols : [ [ {
			title : '序号',
			type : 'numbers',
			fixed : 'left'
		}, {
			field : 'name',
			title : '名称',
			align : 'center',
			fixed : 'left',
			width : 130
		}, {
			field : 'sort',
			title : '排序',
			align : 'center',
			width : 80
		}, {
			field : 'remarks',
			title : '描述'
		}, {
			field : 'sysData',
			title : '系统数据',
			width : 100,
			align : 'center',
			templet : function(d){
				return getEleById("st_sys_data_" + d.sysData);
			}
		}, {
			field : 'status',
			title : '状态',
			align : 'center',
			width : 60,
			templet : function(d){
				return getEleById("st_status_" + d.status);
			}
		},{
			title : '操作',
			align : 'center',
			fixed : 'right',
			width : 175,
			unresize : true,
			toolbar : '#' + DictItem.table_bar
		} ] ],
		page : true
	});
	
	form.on('submit(component-form-dict-item-query)', function(data) {
		return false;
	});
	// 监听工具条
	table_item.on('tool(' + DictItem.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = parent.layui.layer.open({
				type : 2,
				title : DictItem.icon + DictItem.moduleTitle + "详细",
				content : DictItem.detailUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'del') {
			layer.confirm('确定删除选中的数据吗？', function() {
				$.ajax({
					type : 'POST',
					url : DictItem.delUrl + data.id,
					async : false,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(msg) {
						table_type.reload(DictItem.tableId);
						layer.msg('删除成功。', {
							time : 2000
						});
					},
					error : function() {
						parent.layer.alert("删除失败。", {
							title : '提示'
						});
					}
				});
			});
		} else if (obj.event === 'edit') {
			var index = parent.layui.layer.open({
				item : 2,
				title : DictItem.icon + DictItem.moduleTitle + "编辑",
				content : DictItem.updUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} 
	});
	var active = {
		add : function() {
			var index = parent.layui.layer.open({
				type : 2,
				title : DictItem.icon + DictItem.moduleTitle + "新增",
				content : DictItem.addUrl + "?dictTypeId=" + selectId,
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
				content : DictItem.query_layer,
				cancel : function() {

				}
			});
		},
		query : function() {
			table_type.reload(DictItem.tableId, {
				page : {
					curr : 1
				// 重新从第 1 页开始
				},
				where : {
					key : parseQuery()
				}
			});
		}
	};

	$(DictItem.operate_btn + ' .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}();