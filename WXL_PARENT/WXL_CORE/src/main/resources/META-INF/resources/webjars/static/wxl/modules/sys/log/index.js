var table;
var tableId = "log-table-operate";
var baseUrl = ctx + "/sys/log/";

layui.use([ 'table', 'form' ], function() {
	table = layui.table, form = layui.form;
	table.render({
		elem : '#' + tableId,
		url : baseUrl + 'selectLayuiPageList',
		height : 'full-100',
		cols : [ [ {
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'title',
			fixed : 'left',
			title : '标题',
			width : 100
		}, {
			field : 'opreatUser',
			title : '操作人',
			width : 100,
			sort : true
		}, {
			field : 'remoteAddr',
			width : 90,
			title : 'IP'
		}, {
			field : 'requestUri',
			title : 'URI'
		}, {
			field : 'browser',
			title : '浏览器',
			width : 60
		}, {
			field : 'browserVersion',
			title : '浏览器版本',
			width : 90
		}, {
			field : 'terminal',
			title : '访问终端',
			width : 80
		}, {
			field : 'terminalType',
			title : '终端类型',
			width : 80
		},{
			field : 'timeDuration',
			title : '访问时长(ms)',
			width : 100,
			templet : function(d) {
				return d.timeDuration ? d.timeDuration/1000 : 0;
			}
		}, {
			field : 'createDate',
			title : '时间',
			width : 150,
			sort : true,
			templet : function(d) {
				var date = new Date();
				date.setTime(d.createDate);
				return date.Format("yyyy-MM-dd hh:mm:ss");
			}
		}/*, { 
			title : '操作',
			width : 80,
			align : 'center',
			fixed : 'right',
			toolbar : '#log-table-operate-toolbar'
		} */] ],
		page : true
	});

	// 监听工具条
	table.on('tool(' + tableId + ')', function(obj) {
		var data = obj.data;
		if (obj.event === 'detail') {
			var index = layer.open({
				type : 2,
				title : "日志详细",
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
			//layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});

	form.on('submit(component-form-log-query)', function(data) {
		alert();
		return false;
	});

	var active = {
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
	}

	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		active[type] && active[type].call(this);
	});
});