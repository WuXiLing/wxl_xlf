var table;
var tableId = "user-login-history-table-operate";
var baseUrl = ctx + "/sys/loginhistory/";

layui.use([ 'table'], function() {
	table = layui.table;
	table.render({
		elem : '#' + tableId,
		url : baseUrl + 'selectLayuiPageList',
		height : 'full-100',
		cols : [ [ {
			type : 'checkbox',
			fixed : 'left'
		}, {
			field : 'loginIp',
			title : '登录IP',
			width : 170
		}, {
			field : 'loginDate',
			title : '登录时间',
			width : 170,
			sort : true,
			templet : function(d) {
				var date = new Date();
				date.setTime(d.loginDate);
				return date.Format("yyyy-MM-dd hh:mm:ss");
			}
		} ] ],
		page : true,
		where : {
			key : {
				"userId" : $("#userId").val()
			}
		}
	});
});