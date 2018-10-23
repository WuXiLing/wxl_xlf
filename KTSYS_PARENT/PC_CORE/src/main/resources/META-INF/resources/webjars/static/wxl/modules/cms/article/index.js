var table;
var tableId = "article-table-operate";
var treeId = "treeDemo";
var baseUrl = ctx + "/cms/article/";
var selectId = undefined;
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
				//var zTree = $.fn.zTree.getZTreeObj(treeId);
				//zTree.expandNode(treeNode);
			}
			reload(treeNode.id);
		}
	}
};

$(function() {
	$.get(ctx + "/cms/columns/treeData", function(nodes) {
		var treeObj = $.fn.zTree.init($("#" + treeId), setting, nodes);
		treeObj.expandAll(true);
		var nodes = treeObj.getNodes();
		if (nodes.length>0) {
			$("#"+nodes[0].tId+"_a").click(); // 点击节点
		}
	});
});

function reload(treeId) {
	selectId = treeId||selectId;
	table.reload(tableId, {
		page : {
			curr : 1
		// 重新从第 1 页开始
		},
		where : {
			key : {
				"columnsId" : treeId
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
		height : 'full-70',
		where : {
			key : {
				"xxx" : "yyy"
			}
		},
		cols : [ [ {
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'title',
			title : '标题',
			align : 'left',
			width : 300,
			fixed : 'left'
				
		}, {
			field : 'releasetName',
			title : '发布者',
			align : 'center',
			fixed : 'left',
			width : 130
		}, {
			field : 'status',
			title : '发布状态',
			align : 'center',
			width : 100,
			templet : '#statusTpl'
		}, {
			field : 'stick',
			title : '置顶系数',
			align : 'center',
			width : 80
		},  {
			field : 'releaseDate',
			title : '发布日期',
			align : 'center',
			width : 140,
			templet : function(d){
				if(d.releaseDate){
					var date = new Date(d.releaseDate);
					return date.Format("yyyy-MM-dd");
				}
				return '';
			}
		}, {
			field : 'sysData',
			title : '系统数据',
			width : 100,
			align : 'center',
			templet : function(d){
				return getEleById("st_sys_data_" + d.sysData);
			}
		}, {
			title : '操作',
			align : 'center',
			fixed : 'right',
			width: 270,
			toolbar : '#article-table-operate-bar'
		} ] ],
		page : true
	});

	// 监听表格复选框选择
	table.on('checkbox(article-table-operate)', function(obj) {
		//console.log(obj)
	});
	form.on('submit(component-form-article-query)', function(data) {
		return false;
	});
	// 监听工具条
	table.on('tool(article-table-operate)', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = parent.layui.layer.open({
				type : 2,
				title : "<i class='layui-icon layui-icon-read'></i> 文章详细",
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
		} else if (obj.event === 'release') {
			layer.confirm('确定发布选择的文章吗？', function() {
				$.ajax({
					type : 'POST',
					url : baseUrl + "release/" + data.id,
					async : false,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(res) {
						if(res.msg == 'release_ok'){
							table.reload(tableId);
							layer.msg('发布成功。', {
								time : 2000
							});
						} else {
							layer.alert("发布失败。", {
								title : '提示'
							});
						}
					},
					error : function() {
						layer.alert("发布失败。", {
							title : '提示'
						});
					}
				});
			});
		} else if (obj.event === 'edit') {
			var index = layui.layer.open({
				type : 2,
				title : "<i class='layui-icon layui-icon-read'></i> 文章编辑",
				content : baseUrl + 'upd/' + data.id,
				area : [ '90%', '90%' ],
				maxmin : true
			});
		}
		
	});
	var active = {
		add : function(){
			var index = layui.layer.open({
				type: 2,
				title:"<i class='layui-icon layui-icon-read'></i> 文章新增",
				content: baseUrl + 'add?columnsId=' + selectId,
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
					$('.demo-component-layer').hide();
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
	
	$('.article-table-operate-btn .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
});