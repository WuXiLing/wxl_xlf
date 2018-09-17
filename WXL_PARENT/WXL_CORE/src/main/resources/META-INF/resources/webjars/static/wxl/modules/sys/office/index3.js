var table;
var baseUrl = ctx + "/sys/office/";
var page_id = "office_list";
var Office = {
	tableId : "office-table-operate",
	icon : "<i class='fa fa-sitemap'></i> ",
	table_btn : "office-table-operate-bar",
	operate_btn : ".office-operate-btn",
	query_layer : $(".office-query-layer"),
	tableUrl : baseUrl + "treeData",
	addUrl : baseUrl + "add",
	updUrl : baseUrl + "upd/",
	delUrl : baseUrl + "delete/",
	detailUrl : baseUrl + "detail/",
	moduleTitle : "组织机构",
	setting : {
		view : {
			showLine : false,
			showIcon : false
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	},
	columns : [ {
		filed : 'name',
		title : '机构名称',
		align : 'center',
		width : "200px"
	}, {
		filed : 'code',
		title : '机构编码',
		align : 'center',
		width : "100px"
	}, {
		filed : 'sysData',
		title : '系统数据',
		align : 'center',
		width : "100px",
		formatter : function(treeNode) {
			return getEleById("st_sys_data_" + treeNode.sysData);
		}
	}, {
		filed : 'status',
		title : '状态',
		align : 'center',
		width : "100px",
		formatter : function(treeNode) {
			return getEleById("st_status_" + treeNode.status);
		}
	}, {
		title : '操作',
		align : 'center',
		width : "270px",
		formatter : formatHandle
	} ]
}

function formatHandle(treeNode) {
	var htmlStr = '';
	htmlStr += '<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="detail" data-id="'
			+ treeNode.id + '" href="#"><i class="fa fa-search"></i>查看</a>';
	if (!treeNode.sysData) {
		htmlStr += '<a class="layui-btn layui-btn-xs" data-type="upd" data-id="'
				+ treeNode.id + '" href="#"><i class="fa fa-edit"></i>修改</a>';
		htmlStr += '<a class="layui-btn layui-btn-danger layui-btn-xs" data-type="del" data-id="'
				+ treeNode.id
				+ '" href="#"><i class="fa fa-trash-o"></i>删除</a>';
	}
	htmlStr += '<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="addChildren" data-id="'
			+ treeNode.id + '" href="#"><i class="fa fa-plus"></i>新增下级</a>';
	return htmlStr;
}

$(function() {
	form = layui.form;
	form.on('submit(component-form-office-query)', function(data) {
		return false;
	});
	console.info(layui);
	 var editObj = null,ptable = null,treeGrid=null,tableId='treeTable',layer=null;
	    layui.config({
	    	 base: ctxStatic + '/plugins/layui/extend/'
	    }).extend({
	        treeGrid:'treeGrid'
	    }).use(['jquery','dltable','treeGrid','layer'], function(){
		    	treeGrid = layui.treeGrid;// 很重要
		    	ptable = treeGrid.render({
		    		id : Office.tableId,
		    		elem : '#' + Office.tableId,
		    		idField : 'id',
		    		url : Office.tableUrl,
		    		cellMinWidth : 100,
		    		treeId : 'id',
		    		treeUpId : 'pId',
		    		treeShowName : 'name',
		    		cols : [ Office.columns ],
		    		page : false
		    		
		    	});
		    	
		    	treeGrid.on('tool(' +  Office.tableId + ')', function(obj) {
		    		if (obj.event === 'del') {// 删除行
		    			//del(obj);
		    		} else if (obj.event === "add") {// 添加行
		    			//add(obj.data);
		    		}
		    	});
	    });
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
		},
		upd : function() {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type : 2,
				title : Office.icon + Office.moduleTitle + '编辑',
				content : Office.updUrl + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		addChildren : function() {
			var id = $(this).data("id");
			var index = parent.layui.layer.open({
				type : 2,
				title : Office.icon + Office.moduleTitle + '新增',
				content : baseUrl + 'addChildren' + '/' + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		detail : function() {
			var id = $(this).data("id");
			console.info(parent);
			var index = parent.layui.layer.open({
				type : 2,
				title : Office.icon + Office.moduleTitle + '详细',
				content : Office.detailUrl + id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		},
		del : function() {
			var id = $(this).data("id");
			var self = $(this);
			var haschild = $(this).parents("tr").first().attr("haschild");
			if (haschild == 'true') {
				layer.msg('有下级' + Office.moduleTitle + '，不能删除。', {
					time : 2000
				});
				return;
			} else {
				layer.msg('确定要删除记录吗？', {
					btn : [ '删除', '取消' ],
					yes : function(index) {
						$.ajax({
							type : "POST",
							url : Office.delUrl + id,
							data : {},
							success : function(data) {
								if (data && data.msg == 'del_ok') {
									$(self).parents("tr").first().remove();
									layer.msg('删除成功。', {
										time : 2000
									});
								} else {
									layer.msg('删除失败。', {
										time : 2000
									});
								}
							}
						});
					}
				});
			}
		}
	};

	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
}