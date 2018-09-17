var table;
var baseUrl = ctx + "/sys/office/";
var page_id = "office_list";
var office_tree;
var Office = {
	tableId : "tableMain",
	icon : "<i class='fa fa-pencil'></i> ",
	table_btn : "office-table-operate-bar",
	operate_btn : ".office-operate-btn",
	query_layer : $(".office-query-layer"),
	tableUrl : baseUrl + "officeManageData",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	addChildrenUrl : baseUrl + "addChildren/",
	moduleTitle : "菜单"
}

$(function() {
	form = layui.form;
	form.on('submit(component-form-office-query)', function(data) {
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
				elem : '#' + Office.tableId,
				url : Office.tableUrl,
				page: false,
				width : '100%',
				cols : [ [ {
					type : 'numbers'
				}, {
					field : 'name',
					title : '名称',
					minWidth: 200
				}, {
					field : 'code',
					title : '编码',
					align: 'center',
					width : 100
				},{
					field : 'abbreviation',
					title : '简称',
					align: 'center',
					width : 100
				},{
					field : 'type',
					title : '类型',
					width : 200
				}, {
					field : 'grade',
					title : '等级',
					align: 'center',
					width : 50
				},  {
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
		table.on('tool(' + Office.tableId + ')', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Office.icon + Office.moduleTitle + "详细",
					content : Office.detailUrl + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'del') {
				layer.confirm('确定删除选中的数据吗？', function() {
					$.ajax({
						type : 'POST',
						url : Office.delUrl + data.id,
						async : false,
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						success : function(msg) {
							table_type.reload(Office.tableId);
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
					title : Office.icon + Office.moduleTitle + "编辑",
					content : Office.updUrl + '/' + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'addChildren') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Office.icon + Office.moduleTitle + "新增",
					content : Office.addChildrenUrl + '/' + data.id,
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
				title : Office.icon + Office.moduleTitle + '新增',
				content : Office.addUrl,
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
				content : $('.office-component-layer'),
				cancel : function() {
					$('.office-component-layer').hide();
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