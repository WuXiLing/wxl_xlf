var optionSysInfo = {
	title: '系统信息',
	url: ctx + '/sys/realtime/info/sysInfo',
	params: {
		"proMdsItemId": $("#proMdsItemId").val(),
		"manufactureLotno": $("#manufactureLotno").val(),
		"manufactHhrDeptCode": $("#manufactHhrDeptCode").val()
	}
}
$(function () {
parseSysInfo();
});

function parseSysInfo() {
    var params = ['ip','hostName','jv','os','cpucount','memery'];
	$.get(optionSysInfo.url, optionSysInfo.params, function (res) {
        for (let index = 0; index < params.length; index++) {
            $("#" + params[index]).html(res[params[index]]);
        }
	});
}