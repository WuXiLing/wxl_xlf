$(function() {
	var Sys_Role = function(moduleKey, options) {
		Wxl.call(this, moduleKey, options)
	}
	inheritObject(Sys_Role, Wxl);
	var option = {
		title : "角色",
		baseUrl : ctx + "/sys/role/",
		columns : [ {
			type : 'numbers'
		}, {
			field : 'name',
			title : '角色名称',
			align : 'center',
			width : 150,
			sort : true
		}, {
			field : 'enname',
			title : '角色编码',
			align : 'center',
			width : 150,
			sort : true
		}, {
			field : 'dataScope',
			title : '数据范围',
			sort : true,
			width : 150,
			templet : function(d) {
				if (d.dataScope) {
					return d.dataScope;
				}
				return '';
			}
		},  {
			field : 'roleType',
			title : '角色类型',
			align : 'center',
			sort : true,
			width : 120,
			templet : function(d) {
				if (d.roleType == 'assignment') {
					return '任务分配';
				} else if(d.roleType == 'security-role'){
					return '管理角色';
				} else if(d.roleType == 'user'){
					return '普通角色';
				}
				return '';
			}
		},  {
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
			sort : true,
			width : 120,
			templet : function(d) {
				return getEleById("st_status_" + d.status);
			}
		},{
			title : '操作',
			align : 'center',
			width : 300,
//			toolbar : '#' + Role.table_btn
			templet : function(d){
				var str = '';
				str += '<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="fa fa-search"></i>查看</a>';
				if(d.sysData == 0){
					str += '<a class="layui-btn layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i>修改</a>';
					str += '<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="distribute"><i class="fa fa-share-square-o"></i>分配</a>';
					str += '<a class="layui-btn layui-btn-info layui-btn-xs" lay-event="authority"><i class="fa fa-share-square-o"></i>授权</a>';
					str += '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>';
				}
                return str;
			}
		}  ],
		tableType : "table"
	};
	var t = new Sys_Role('sys-role', option);
	t.init();
});