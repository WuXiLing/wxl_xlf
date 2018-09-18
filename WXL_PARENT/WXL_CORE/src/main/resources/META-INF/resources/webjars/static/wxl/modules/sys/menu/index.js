$(function() {
	var Sys_Menu = function(moduleKey, options) {
		Wxl.call(this, moduleKey, options)
	}
	inheritObject(Sys_Menu, Wxl);
	var option = {
		title : "菜单",
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