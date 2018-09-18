$(function() {
	var Sys_Office = function(moduleKey, options) {
		Wxl.call(this, moduleKey, options)
	}
	inheritObject(Sys_Office, Wxl);
	var option = {
		title : "组织机构",
		baseUrl : ctx + "/sys/office/",
		columns : [ {
			type : 'numbers'
		}, {
			field : 'name',
			title : '名称',
			minWidth : 200
		},/* {
			field : 'abbreviation',
			title : '简称',
			minWidth : 200
		},*/{
			field : 'code',
			title : '编码',
			align : 'center',
			minWidth : 100
		},{
			field : 'sort',
			title : '排序',
			align : 'center',
			minWidth : 100
		}, {
			field : 'sysData',
			title : '系统数据',
			align : 'center',
			width : 80,
			templet : function(d) {
				return getEleById("st_sys_data_" + d.sysData);
			}
		}, {
			field : 'status',
			title : '状态',
			align : 'center',
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
	var t = new Sys_Office('sys-office', option);
	t.init();
});