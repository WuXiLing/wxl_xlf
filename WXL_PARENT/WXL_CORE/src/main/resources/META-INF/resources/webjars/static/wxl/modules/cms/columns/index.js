<<<<<<< HEAD
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
=======
var table;
var treetable;
var baseUrl = ctx + "/cms/columns/";
var page_id = "columns_list";
var columns_tree;
var Columns = {
	tableId : "tableMain",
	icon : "<i class='layui-icon layui-icon-template-1'></i> ",
	table_btn : "columns-table-operate-bar",
	operate_btn : ".columns-operate-btn",
	query_layer : $(".columns-query-layer"),
	tableUrl : baseUrl + "columnsManageData",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	addChildrenUrl : baseUrl + "addChildren/",
	moduleTitle : "栏目"
}

$(function() {
	form = layui.form;
	form.on('submit(component-form-columns-query)', function(data) {
		return false;
	});
	layui.config({
		base : ctxStatic + '/plugins/layui/lay/modules/'
	}).extend({
		treetable : 'treetable'
	}).use([ 'layer','table','treetable', 'form', 'tree' ], function() {
		var layer = layui.layer;
	    table = layui.table;
		treetable = layui.treetable;

		// 渲染表格
		var renderTable = function () {
            layer.load(2);
			treetable.render({
				treeColIndex : 1, 
				treeSpid : 0, 
				treeIdName : 'id', 
				treePidName : 'pId', 
				elem : '#' + Columns.tableId,
				url : Columns.tableUrl,
				page: false,
				width : '100%',
				cols : [ [ {
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
				}] ],
				height : 'full-70',
                done: function () {
                    layer.closeAll('loading');
                }
			});
		};

        renderTable();
		
		 // 监听工具条
		table.on('tool(' + Columns.tableId + ')', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Columns.icon + Columns.moduleTitle + "详细",
					content : Columns.detailUrl + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'del') {
				layer.confirm('确定删除选中的数据吗？', function() {
					$.ajax({
						type : 'POST',
						url : Columns.delUrl + data.id,
						async : false,
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						success : function(msg) {
//							table.reload(Columns.tableId);
							layer.msg('删除成功。', {
								time : 2000
							});
							location.reload();
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
					title : Columns.icon + Columns.moduleTitle + "编辑",
					content : Columns.updUrl + '/' + data.id,
					area : [ '90%', '90%' ],
					maxmin : true
				});
			} else if (obj.event === 'addChildren') {
				var index = parent.layui.layer.open({
					type : 2,
					title : Columns.icon + Columns.moduleTitle + "新增",
					content : Columns.addChildrenUrl + data.id,
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
				title : Columns.icon + Columns.moduleTitle + '新增',
				content : Columns.addUrl,
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
				content : $('.columns-component-layer'),
				cancel : function() {
					$('.columns-component-layer').hide();
				}
			});
		},
		query : function() {
			var keyword = $("#keyword").val();
			if (keyword == '') {
                layer.msg("请输入搜索内容", {icon: 5});
                return;
            }
			var searchCount = 0;
			$('#' + Columns.tableId).next('.treeTable').find('.layui-table-body tbody tr td').each(function () {
                $(this).css('background-color', 'transparent');
                var text = $(this).text();
                if (keyword != '' && text.indexOf(keyword) >= 0) {
                    $(this).css('background-color', 'rgba(250,230,160,0.5)');
                    if (searchCount == 0) {
                        treetable.expandAll('#' + Columns.tableId);
                        $('html,body').stop(true);
                        $('html,body').animate({scrollTop: $(this).offset().top - 150}, 500);
                    }
                    searchCount++;
                }
            });
			if (searchCount == 0) {
                layer.msg("没有匹配结果", {icon: 5});
            }
		}
	};

	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
