var table;
var baseUrl = ctx + "/sys/menu/";
var page_id = "menu_list";
var menu_tree;
var Menu = {
	tableId: "menu-table-operate",
	icon: "<i class='fa fa-pencil'></i> ",
	table_btn: "menu-table-operate-bar",
	operate_btn: ".menu-operate-btn",
	query_layer: $(".menu-query-layer"),
	tableUrl: baseUrl + "menuData",
	addUrl: baseUrl + "add",
	updUrl: baseUrl + "upd/",
	delUrl: baseUrl + "delete/",
	detailUrl: baseUrl + "detail/",
	moduleTitle: "菜单",
	setting: {
		view: {
			showLine: false,
			showIcon: false,
			addDiyDom: addDiyDom
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	},
	columns: [{
		filed: 'name',
		title: '名称',
		align: 'center',
		width: "200px",
		formatter: function(treeNode){
            return treeNode.icon + " "+ treeNode.name;
		}
	}, {
		filed: 'href',
		title: '连接',
		align: 'center',
		width: "300px"
	}, {
		filed: 'icon',
		title: '图标',
		align: 'center',
		width: "100px"
	},{
		filed: 'permission',
		title: '权限标识',
		align: 'center',
		width: "200px"
	},{
		filed: 'sort',
		title: '排序',
		align: 'center',
		width: "100px"
	},{
		filed: 'sysData',
		title: '系统数据',
		align: 'center',
		width: "100px",
		formatter: function(treeNode){
            return getEleById("st_sys_data_" + treeNode.sysData);
		}
	}, {
		filed: 'status',
		title: '状态',
		align: 'center',
		width: "100px",
		formatter: function(treeNode){
            return getEleById("st_status_" + treeNode.status);
		}
	}, {
		title: '操作',
		align: 'center',
		width: "270px",
		formatter: formatHandle
	}]
}

function addDiyDom(treeId, treeNode) {
	var spaceWidth = 15;
	var liObj = $("#" + treeNode.tId);
	var aObj = $("#" + treeNode.tId + "_a");
	var switchObj = $("#" + treeNode.tId + "_switch");
	var icoObj = $("#" + treeNode.tId + "_ico");
	var spanObj = $("#" + treeNode.tId + "_span");
	aObj.attr('title', '');
	aObj.append('<div class="tree_cell swich"></div>');
	var div = $(liObj).find('div').eq(0);
	switchObj.remove();
	spanObj.remove();
	icoObj.remove();
	div.append(switchObj);
	div.append(spanObj);
	var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
	switchObj.before(spaceStr);
	var editStr = '';

	for (var i = 1; i < Menu.columns.length; i++) {
		var column = Menu.columns[i];
		var width = column.width;
		
		if (column.formatter) {
			var x = column.formatter;
			editStr += "<div class='tree_cell' style='width:" + width + "'>" + x(treeNode) + "</div>";
		} else if (column['filed']) {
			editStr += "<div class='tree_cell' style='width:" + width + "'>" + treeNode[column['filed']] + "</div>";
		}
	}
	aObj.append(editStr);
}

function formatHandle(treeNode) {
	var htmlStr = '';
	htmlStr += '<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="detail" data-id="' + treeNode.id + '" href="#"><i class="fa fa-search"></i>查看</a>';
	if(!treeNode.sysData){
		htmlStr += '<a class="layui-btn layui-btn-xs" data-type="upd" data-id="' + treeNode.id + '" href="#"><i class="fa fa-edit"></i>修改</a>';
		htmlStr += '<a class="layui-btn layui-btn-danger layui-btn-xs" data-type="del" data-id="' + treeNode.id + '" href="#"><i class="fa fa-trash-o"></i>删除</a>';
	}
	htmlStr += '<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="addChildren" data-id="' + treeNode.id + '" href="#"><i class="fa fa-plus"></i>新增下级</a>';
	return htmlStr;
}

var inittreeTable = function() {
	$.get(Menu.tableUrl, function (nodes) {
		var treeTable = $("#" + Menu.tableId);
		//初始化树
		menu_tree = $.fn.zTree.init(treeTable, Menu.setting, nodes);
		//添加表头
		var li_head = ' <li class="head"><a>';
		for (var i = 0; i < Menu.columns.length; i++) {
			var column = Menu.columns[i];
			if(i > 0){
				var width = column.width;
				li_head += '<div class="tree_cell" style="width:' + width + '">' + column['title'] + '</div>';
			} else {
				li_head += '<div class="tree_cell">' + column['title'] + '</div>';
			}
		}
		li_head += '</a></li>';
		var rows = treeTable.find('li');
		if (rows.length > 0) {
			rows.eq(0).before(li_head)
		} else {
			treeTable.append(li_head);
			treeTable.append('<li ><div style="text-align: center;line-height: 30px;" >无符合条件数据</div></li>')
		}

		bindEve();
	});
}
$(function () {
	form = layui.form;
	form.on('submit(component-form-menu-query)', function (data) {
		return false;
	});
	inittreeTable();
});

function bindEve() {
	var active = {
		add: function () {
			var index = parent.layui.layer.open({
				type: 2,
				title: Menu.icon + Menu.moduleTitle + '新增',
				content: Menu.addUrl,
				area: ['90%', '90%'],
				maxmin: true
			});
		},
		toquery: function () {
			layer.open({
				type: 1,
				shade: false,
				title: false,
				offset: ['100px'],
				area: ['500px', '240px'],
				content: $('.menu-component-layer'),
				cancel: function () {
				   $('.menu-component-layer').hide();
				}
			});
		},
		query: function () {
			table.reload(tableId, {
				page: {
					curr: 1
					// 重新从第 1 页开始
				},
				where: {
					key: parseQuery()
				}
			});
		},
		upd: function () {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type: 2,
				title: Menu.icon + Menu.moduleTitle + '编辑',
				content: Menu.updUrl + id,
				area: ['90%', '90%'],
				maxmin: true
			});
		},
		addChildren: function () {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type: 2,
				title: Menu.icon + Menu.moduleTitle + '新增',
				content: baseUrl + 'addChildren' + '/' + id,
				area: ['90%', '90%'],
				maxmin: true
			});
		},
		detail: function () {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type: 2,
				title: Menu.icon + Menu.moduleTitle + '详细',
				content: Menu.detailUrl + id,
				area: ['90%', '90%'],
				maxmin: true
			});
		},
		del: function () {
			var id = $(this).data("id");
			var node = menu_tree.getNodeByTId(id);
			if(node.isParent){
                layer.msg('有下级' + Menu.moduleTitle + '，不能删除。', {
					time: 2000
				});
				return;
			} else {
				layer.msg('确定要删除记录吗？', {
					btn: ['删除', '取消'],
					yes: function (index) {
						$.ajax({
							type: "POST",
							url: Menu.delUrl + id,
							data: {},
							success: function (data) {
								if (data && data.msg == 'del_ok') {
									menu_tree.removeNode(node);
									layer.msg('删除成功。', {
										time: 2000
									});
								} else {
									layer.msg('删除失败。', {
										time: 2000
									});
								}
							}
						});
					}
				});
			}
		}
	};

	$('.layui-btn').on('click', function () {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}