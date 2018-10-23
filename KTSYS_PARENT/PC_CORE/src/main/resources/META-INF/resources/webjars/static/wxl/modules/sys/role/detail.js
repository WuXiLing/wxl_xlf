var table;
var baseUrl = ctx + "/sys/role/";
var Role = {
	tableId : "role-table-operate",
	icon : "<i class='fa fa-user'></i>",
	table_btn : "role-table-operate-bar",
	operate_btn : ".role-operate-btn",
	query_layer : $(".role-query-layer"),
	tableUrl : baseUrl + "selectLayuiPageList",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/"
}
function reload() {
	table.reload(tableId, {
		page : {
			curr : 1
		// 重新从第 1 页开始
		},
		where : {
			key : {
				"officeId" : treeId
			}
		}
	});
}

layui.use([ 'table', 'form' ], function() {
	table = layui.table;
	form = layui.form;
	table.render({
		elem : '#' + Role.tableId,
		url : Role.tableUrl,
		height : 'full-100',
		where : {
			key : {
				"xxx" : "yyy"
			}
		},
		cols : [ [ {
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'name',
			title : '登录名',
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'enname',
			title : '姓名',
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'office',
			title : '归属公司',
			templet : function(d) {
				if (d.office) {
					return d.office.name;
				}
				return '';
			}
		}, {
			field : 'office',
			title : '归属部门',
			templet : function(d) {
				if (d.office) {
					return d.office.name;
				}
				return '';
			}
		},{
			field : 'dataScope',
			title : '电话',
			sort : true,
			templet : function(d) {
				if (d.dataScope) {
					return d.dataScope;
				}
				return '';
			}
		},{
			field : 'dataScope',
			title : '手机',
			sort : true,
			templet : function(d) {
				if (d.dataScope) {
					return d.dataScope;
				}
				return '';
			}
		}, {
			title : '操作',
			align : 'center',
			fixed : 'right',
			width : 220,
			unresize : true,
			toolbar : '#role-table-operate-bar'
		} ] ],
		page : true
	});

	// 监听表格复选框选择
	table.on('checkbox(' + Role.tableId + ')', function(obj) {
		// console.log(obj)
	});
	form.on('submit(component-form-role-query)', function(data) {
		return false;
	});
	// 监听工具条
	table.on('tool(' + Role.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Role.icon + "角色详细",
				content : Role.detailUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'del') {
			layer.confirm('确定删除选中的数据吗？', function() {
				$.ajax({
					type : 'POST',
					url : Role.delUrl + data.id,
					async : false,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(msg) {
						table.reload(tableId);
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
		}
	});
});