var table;
var tableId = "user-table-operate";
var treeId = "treeDemo";
var baseUrl = ctx + "/sys/user/";
var setting = {
	view : {
		dblClickExpand : false,
		showLine : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : function(e, treeId, treeNode) {
			if (treeNode.isParent) {
				var zTree = $.fn.zTree.getZTreeObj(treeId);
				zTree.expandNode(treeNode);
			}
			reload(treeNode.id);
		}
	}
};

$(function() {
	$.get(ctx + "/sys/office/treeData", function(nodes) {
		var treeObj = $.fn.zTree.init($("#" + treeId), setting, nodes);
		treeObj.expandAll(true);
		$.each(nodes, function(i, e) {
			if (i == 0) {
				e.checked;
				treeObj.selectNode(e);
			}
		});
	});
});

function reload(treeId) {
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

layui.use([ 'table','form','layer' ], function() {
	table = layui.table;
	form = layui.form;
	layer = layui.layer;
	table.render({
		elem : '#' + tableId,
		url : baseUrl + 'selectLayuiPageList',
		height : 'full-60',
		where : {
			key : {
				"xxx" : "yyy"
			}
		},
		cols : [ [ {
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'loginName',
			title : '登录名',
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'name',
			title : '姓名',
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'no',
			title : '工号',
			align : 'center',
			sort : true
		}, {
			field : 'company',
			title : '所在公司',
			align : 'left',
			templet : function(d){
				if(d.company){ 
	               return  d.company.name;
	            } 
	            return  '';
			}
		}, {
			field : 'office',
			title : '所在部门',
			sort : true,
			align : 'left',
			templet : function(d){
				if(d.office){ 
	                 return  d.office.name;
	            } 
	            return  '';
			}
		}, {
			field : 'idcard',
			title : '身份证号码',
			align : 'center',
			unresize : true,
			width : 176
		}, {
			field : 'gender',
			title : '性别',
			width : 60,
			align : 'center',
			unresize : true,
			templet : function(d){
				return getEleById("st_sex_" + d.gender);
			}
		}, {
			field : 'birthday',
			title : '出生日期',
			align : 'center',
			templet : function(d){
				if(d.birthday){
					var date = new Date(d.birthday);
					return date.Format("yyyy-MM-dd");
				}
				return '';
			}
		},  {
			field : 'phone',
			align : 'center',
			title : '手机'
		},  {
			field : 'email',
			align : 'center',
			title : '邮箱'
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
		}, {
			title : '操作',
			align : 'center',
			fixed : 'right',
			minWidth: 220,
			unresize : true,
			toolbar : '#user-table-operate-bar'
		} ] ],
		page : true
	});

	// 监听表格复选框选择
	table.on('checkbox(user-table-operate)', function(obj) {
		//console.log(obj)
	});
	form.on('submit(component-form-user-query)', function(data) {
		return false;
	});
	// 监听工具条
	table.on('tool(user-table-operate)', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = parent.layui.layer.open({
				type : 2,
				title : "<i class='fa fa-user-plus'></i>用户详细",
				content : baseUrl + 'detail/' + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'del') {
			layer.confirm('确定删除选中的数据吗？', function() {
				$.ajax({
					type : 'POST',
					url : baseUrl + "delete/" + data.id,
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
		} else if (obj.event === 'edit') {
			var index = parent.layui.layer.open({
				type : 2,
				title : "<i class='fa fa-user-plus'></i>用户编辑",
				content : baseUrl + 'upd/' + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		}
		
	});
	var active = {
		add : function(){
			var index = parent.layui.layer.open({
				type: 2,
				title:"<i class='fa fa-user-plus'></i>用户新增",
				content: baseUrl + 'add',
				area: ['90%', '90%'],
				maxmin: true
			});
		},
		toquery : function() {
			layer.open({
				type : 1,
				shade : false,
				title : false,
				offset : [ '100px' ],
				area : [ '500px', '240px' ],
				content : $('.demo-component-layer'),
				cancel : function() {

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
	
	$('.user-table-operate-btn .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
});