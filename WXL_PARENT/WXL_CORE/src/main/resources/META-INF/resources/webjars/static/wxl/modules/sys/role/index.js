$(function() {
	/*var Sys_Role = function(moduleKey, options) {
		Wxl.call(this, moduleKey, options)
	}
	inheritObject(Sys_Role, Wxl);*/
	var Sys_Role = createObj();
	var option = {
		title : "角色",
		baseUrl : ctx + "/sys/role/",
		distributeOp : "distribute",
		authorityOp : "authority",
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
			title : '是否可用',
			align : 'center',
			sort : true,
			width : 120,
			templet : function(d) {
				return d.status == '1' ? "可用" : "不可用";
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
	t.options.rowOp = {
		authority : function(id) {
			t.authority(id);
		},
		distribute : function(id){
			t.distribute(id);
		}
	}
	t.init();
	t.getDistributeUrl = function() {
		return this.options.baseUrl + this.options.distributeOp;
	}
	t.getAuthorityUrl = function() {
		return this.options.baseUrl + this.options.authorityOp;
	}
	t.distribute = function(id){
		var index = layui.layer.open({
			type : 2,
			title : t.options.icon + t.options.title + "分配",
			content : t.getDistributeUrl() + "/" + id,
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}
	t.authority = function(id){
		var index = layui.layer.open({
			type : 2,
			title : t.options.icon + t.options.title + "授权",
			content : t.getAuthorityUrl() + "/" + id,
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}
});