var Cms_Columns = function(moduleKey, options) {
	Wxl.call(this, moduleKey, options)
}
inheritObject(Cms_Columns, Wxl);
var cms_Columns;
$(function() {
	var option = {
		title : "栏目",
		icon : "<i class='layui-icon layui-icon-template-1'> </i>",
		baseUrl : ctx + "/cms/columns/",
		columns : [{
			type : 'numbers'
		}, {
			field : 'name',
			title : '名称',
			minWidth : 200
		}, {
			field : 'type',
			title : '栏目类型',
			width : 100,
			align: 'center',
			templet : function(d) {
				return getEleById("st_columns_type_" + d.type);
			}
		}, {
			field : 'image',
			title : '缩略图',
			align: 'center',
			width : 100,
			templet : '#imageTpl'
		}, {
			field : 'firstnav',
			title : '是否首页栏目',
			align: 'center',
			width : 150,
			templet : '#firstnavTpl'
		}, {
			field : 'target',
			title : '打开目标',
			align: 'center',
			width : 120
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
		}],
		tableType : "treeTable"
	};
	cms_Columns = new Cms_Columns('cms-columns', option);
	cms_Columns.init();
});