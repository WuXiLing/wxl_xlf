<<<<<<< HEAD
$(function() {
	var Sys_Menu = createObj();
	var option = {
		title : "菜单",
		icon : "<i class='fa fa-pencil'> </i>",
		baseUrl : ctx + "/sys/menu/",
		columns : [ {
			type : 'numbers'
		}, {
			field : 'name',
			title : '名称',
			minWidth: 200
		}, {
			field : 'href',
			title : '连接',
			width : 200
		}, {
			field : 'icon',
			title : '图标',
			align: 'center',
			width : 50
		}, {
			field : 'permission',
			title : '权限标识',
			align: 'center',
			width : 100
		}, {
			field : 'sort',
			title : '排序',
			align: 'center',
			width : 50
		}, {
			field : 'sysData',
			title : '系统数据',
			align: 'center',
			width : 80,
			templet : function(d) {
				return getEleById("st_sys_data_" + d.sysData);
			}
		}, {
			field : 'status',
			title : '状态',
			align: 'center',
			width : 50,
			templet : function(d) {
				return getEleById("st_status_" + d.status);
			}
		}, {
			title : '操作',
			align : 'center',
			width : 270,
			templet : '#oper-col'
		} ],
		tableType : "treeTable"
	};
	var t = new Sys_Menu('sys-menu', option);
	t.init();
});
=======
var table;
var baseUrl = ctx + "/sys/menu/";
var page_id = "menu_list";
var menu_tree;
var Menu = {
	tableId : "tableMain",
	icon : "<i class='fa fa-pencil'></i> ",
	table_btn : "menu-table-operate-bar",
	operate_btn : ".menu-operate-btn",
	query_layer : $(".menu-query-layer"),
	tableUrl : baseUrl + "menuManageData",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	addChildrenUrl : baseUrl + "addChildren/",
	moduleTitle : "菜单"
}

$(function() {
	form = layui.form;
	form.on('submit(component-form-menu-query)', function(data) {
		return false;
	});
	layui.config({
		base : ctxStatic + '/plugins/layui/lay/modules/'
	}).extend({
		treetable : 'treetable'
	}).use([ 'layer','table','treetable', 'form', 'tree' ], function() {
		var layer = layui.layer;
	    var table = layui.table;
		var treetable = layui.treetable;

		// 渲染表格
		var renderTable = function () {
            layer.load(2);
			treetable.render({
				treeColIndex : 1, 
				treeSpid : 0, 
				treeIdName : 'id', 
				treePidName : 'pId', 
				elem : '#' + Menu.tableId,
				url : Menu.tableUrl,
				page: false,
				cellMinWidth: 80,
				width : '100%',
				cols : [ [ {
					type : 'numbers'
				}, {
					field : 'name',
					title : '名称',
					minWidth: 200
				}, {
					field : 'href',
					title : '连接',
					width : 200
				}, {
					field : 'icon',
					title : '图标',
					align: 'center',
					width : 50
				}, {
					field : 'permission',
					title : '权限标识',
					align: 'center',
					width : 100
				}, {
					field : 'sort',
					title : '排序',
					align: 'center',
					width : 50
				}, {
					field : 'sysData',
					title : '系统数据',
					align: 'center',
					width : 80,
					templet : function(d) {
						return getEleById("st_sys_data_" + d.sysData);
					}
				}, {
					field : 'status',
					title : '状态',
					align: 'center',
					width : 50,
					templet : function(d) {
						return getEleById("st_status_" + d.status);
					}
				}, {
					title : '操作',
					align : 'center',
					width : 270,
					templet : '#oper-col'
				}] ],
				height : 'full-70',
                done: function () {
                    layer.closeAll('loading');
                }
			});
		};

        renderTable();
		
		 // 监听工具条
		table.on('tool(' + Menu.tableId + ')', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Menu.icon + Menu.moduleTitle + "详细",
					content : Menu.detailUrl + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'del') {
				layer.confirm('确定删除选中的数据吗？', function() {
					$.ajax({
						type : 'POST',
						url : Menu.delUrl + data.id,
						async : false,
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						success : function(msg) {
							table_type.reload(Menu.tableId);
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
					type : 2,
					title : Menu.icon + Menu.moduleTitle + "编辑",
					content : Menu.updUrl + '/' + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'addChildren') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Menu.icon + Menu.moduleTitle + "新增",
					content : Menu.addChildrenUrl + '/' + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} 
		});
	});
	
	bindEve();
});

function bindEve() {
	var active = {
		add : function() {
			var index = parent.layui.layer.open({
				type : 2,
				title : Menu.icon + Menu.moduleTitle + '新增',
				content : Menu.addUrl,
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
				content : $('.menu-component-layer'),
				cancel : function() {
					$('.menu-component-layer').hide();
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
		}
	};

	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
