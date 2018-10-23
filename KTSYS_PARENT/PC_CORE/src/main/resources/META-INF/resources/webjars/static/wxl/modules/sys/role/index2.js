var table;
var baseUrl = ctx + "/sys/role/";
var sysId = "sys_role";
var Role = {
	tableId : "role-table-operate",
	icon : "<i class='fa fa-user'></i> ",
	table_btn : "role-table-operate-bar",
	operate_btn : ".role-operate-btn",
	query_layer : $(".role-query-layer"),
	tableUrl : baseUrl + "selectLayuiPageList",
	addUrl : baseUrl + "add",
	
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	distributeUrl : baseUrl + "toAssign/",
	authorityUrl : baseUrl + "toAuthority/",
	moduleTitle : "角色"
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

;!function(){
	table = layui.table;
	form = layui.form;
	table.render({
		elem : '#' + Role.tableId,
		url : Role.tableUrl,
		height : 'full-60',
		where : {
			key : {
				"xxx" : "yyy"
			}
		},
		cols : [ [/* {
			type : 'checkbox',
			fixed : 'left'
		}, */{
			field : 'name',
			title : '角色名称',
			align : 'center',
//			fixed : 'left',
			width : 150,
			sort : true
		}, {
			field : 'enname',
			title : '角色编码',
			align : 'center',
//			fixed : 'left',
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
//			fixed : 'right',
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
				title : Role.icon + Role.moduleTitle + "详细",
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
						table.reload(Role.tableId);
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
				title : Role.icon + Role.moduleTitle + "编辑",
				content : Role.updUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'distribute') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Role.icon + Role.moduleTitle + "分配",
				content : Role.distributeUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'authority') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Role.icon + Role.moduleTitle + "授权",
				content : Role.authorityUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		}

		
		
	});
	var active = {
		add : function() {
			var index = parent.layui.layer.open({
				type : 2,
				title : Role.icon + Role.moduleTitle + "新增",
				content : Role.addUrl,
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
				content : Role.query_layer,
				cancel : function() {

				}
			});
		},
		query : function() {
			table.reload(Role.tableId, {
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

	$(Role.operate_btn + ' .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}();