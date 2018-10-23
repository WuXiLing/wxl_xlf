$(function() {
	var Sys_Log_Title = createObj();
	var option = {
		title : "日志标题",
		baseUrl : ctx + "/sys/log/title",
		columns : [ {
			type : 'numbers'
		}, {
			field : 'uri',
			title : 'URI',
			align : 'center',
			width : 150,
			sort : true
		}, {
			field : 'title',
			title : '日志标题',
			align : 'center',
			width : 150,
			sort : true
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
			templet : function(d){
				var str = '';
				str += '<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="fa fa-search"></i>查看</a>';
				if(d.sysData == 0){
					str += '<a class="layui-btn layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i>修改</a>';
					str += '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>';
				}
                return str;
			}
		}  ],
		tableType : "table"
	};
	var t = new Sys_Log_Title('sys-log-title', option);
	t.init();
	
});