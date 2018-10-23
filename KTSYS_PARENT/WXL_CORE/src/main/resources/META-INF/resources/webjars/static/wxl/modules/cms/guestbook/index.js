var table;
var tableId = "guestbook-table-operate";
var baseUrl = ctx + "/cms/guestbook/";

$(function() {
	
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
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'snippet',
			title : '发布者',
			align : 'center',
			fixed : 'left',
			sort : true
		}, {
			field : 'status',
			title : '发布状态',
			align : 'center',
			sort : true
		}, {
			field : 'stick',
			title : '置顶',
			align : 'left'
		},  {
			field : 'releaseDate',
			title : '发布时间',
			align : 'center',
			templet : function(d){
				if(d.releaseDate){
					var date = new Date(d.releaseDate);
					return date.Format("yyyy-MM-dd HH:mm");
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
			minWidth: 220,
			unresize : true,
			toolbar : '#guestbook-table-operate-bar'
		} ] ],
		page : true
	});

	// 监听表格复选框选择
	table.on('checkbox(guestbook-table-operate)', function(obj) {
		//console.log(obj)
	});
	form.on('submit(component-form-guestbook-query)', function(data) {
		return false;
	});
	// 监听工具条
	table.on('tool(guestbook-table-operate)', function(obj) {
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
				title:"<i class='fa fa-user-plus'></i>文章新增",
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
	
	$('.guestbook-table-operate-btn .layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});
});