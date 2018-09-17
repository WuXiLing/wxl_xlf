var table;
var baseUrl = ctx + "/act/modeler/";
var sysId = "act_modeler";
var Modeler = {
	tableId : "modeler-table-operate",
	icon : "<i class='fa fa-life-ring'></i> ",
	table_btn : "modeler-table-operate-bar",
	operate_btn : ".modeler-operate-btn",
	query_layer : $(".modeler-query-layer"),
	tableUrl : baseUrl + "selectLayuiPageList",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	designUrl : baseUrl + "design/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	deplayUrl : baseUrl + "deploy/",
	moduleTitle : "流程模型"
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
		elem : '#' + Modeler.tableId,
		url : Modeler.tableUrl,
		height : 'full-60',
//		width : $('#' + Modeler.tableId).parent().width()-200,
		where : {
			key : {
				"xxx" : "yyy"
			}
		},
		cols : [ [ {
			field : 'name',
			title : '流程分类',
			align : 'center',
//			fixed : 'left',
//			width : '200px',
			sort : true
		}, {
			field : 'id',
			title : '模型ID',
			align : 'center',
//			fixed : 'left',
			sort : true
		}, {
			field : 'key',
			title : '模型标识',
			sort : true
		},  {
			field : 'name',
			title : '模型名称',
			align : 'center',
			sort : true
		},  {
			field : 'version',
			title : '版本号'
		}, {
			field : 'createTime',
			title : '创建时间',
			align : 'center',
			sort : true,
			templet : function(d) {
				var v = new Date(d.createTime);
				if(v){
				    return v.Format("yyyy-MM-dd hh:mm:ss");
				}
			}
		},{
			field : 'lastUpdateTime',
			title : '最后更新时间',
			align : 'center',
			sort : true,
			templet : function(d) {
				var v = new Date(d.lastUpdateTime);
				if(v){
				    return v.Format("yyyy-MM-dd hh:mm:ss");
				}
			}
		},{
			title : '操作',
			align : 'center',
			// fixed : 'right',
			width : 300,
			templet : function(d){
				var str = '';
				str += '<a class="layui-btn layui-btn-xs" lay-event="design"><i class="fa fa-edit"></i>设计</a>';
				str += '<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="deplay"><i class="fa fa-share-square-o"></i>部署</a>';
				str += '<a class="layui-btn layui-btn-info layui-btn-xs" lay-event="authority"><i class="fa fa-share-square-o"></i>导出</a>';
				str += '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>';
                return str;
			}
		} ] ],
		page : true
	});

	// 监听表格复选框选择
	table.on('checkbox(' + Modeler.tableId + ')', function(obj) {
		// console.log(obj)
	});
	form.on('submit(component-form-role-query)', function(data) {
		return false;
	});
	// 监听工具条
	table.on('tool(' + Modeler.tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Modeler.icon + Modeler.moduleTitle + "详细",
				content : Modeler.detailUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		} else if (obj.event === 'del') {
			layer.confirm('确定删除选中的数据吗？', function() {
				$.ajax({
					type : 'POST',
					url : Modeler.delUrl + data.id,
					async : false,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(msg) {
						table.reload(Modeler.tableId);
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
		} else if (obj.event === 'deplay') {
			layer.confirm('确定部署选中的数据吗？', function() {
				$.ajax({
					type : 'POST',
					url : Modeler.deplayUrl + data.id,
					async : false,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(msg) {
						table.reload(Modeler.tableId);
						layer.msg(msg, {
							time : 2000
						});
					},
					error : function() {
						parent.layer.alert("部署失败。", {
							title : '提示'
						});
					}
				});
			});
		} else if (obj.event === 'edit') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Modeler.icon + Modeler.moduleTitle + "编辑",
				content : Modeler.updUrl + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		}else if (obj.event === 'design') {
			var index = parent.layui.layer.open({
				type : 2,
				title : Modeler.icon + Modeler.moduleTitle + "设计",
//				content : Modeler.designUrl + data.id,
				content : "act/modeler.jsp?modelId=" + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		}
	});
	var active = {
		add : function() {
			var index = parent.layui.layer.open({
				type : 2,
				title : Modeler.icon + Modeler.moduleTitle + "新增",
				content : Modeler.addUrl,
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
				content : Modeler.query_layer,
				cancel : function() {

				}
			});
		},
		query : function() {
			table.reload(Modeler.tableId, {
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

	$(Modeler.operate_btn + ' .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}();