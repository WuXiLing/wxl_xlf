var optionJvm = {
	title: 'JVM实时使用情况',
	x: 40,
	x2: 10,
	type: 'line',
	mainId: 'mainJvm',
	url: ctx + '/sys/realtime/info/jvmInfo',
	params: {
		"proMdsItemId": $("#proMdsItemId").val(),
		"manufactureLotno": $("#manufactureLotno").val(),
		"manufactHhrDeptCode": $("#manufactHhrDeptCode").val()
	}
}
$(function () {
	$("#" + optionJvm.mainId).width($("#" + optionCPU.mainId).width());
	$("#" + optionJvm.mainId).height($("#" + optionCPU.mainId).height());
	parseData6();
});

var packetdataJvm = [];
var packetJvm = [];// x轴数据
var lengedsJvm = [];
function parseData6() {
	$.get(optionJvm.url, optionJvm.params, function (res) {

		var datas = res.datas;
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetJvm.contains(e[0])) {
					packetJvm.push(e[0]);
				}
				if (!lengedsJvm.contains(e[2])) {
					lengedsJvm.push(e[2]);
				}
				var obj = {
					name: e[2],
					type: optionJvm.type,
					data: [e[1]]
				}
				packetdataJvm.push(obj);
			});
			lengedsJvm.sort();
			initChartsJvm();
		}
	});
}

Array.prototype.contains = function (needle) {
	for (i in this) {
		if (this[i] == needle)
			return true;
	}
	return false;
}

function initChartsJvm() {
	var echartsOptionMemery = {
		tooltip: {
			trigger: 'axis',
			axisPointer: { // 坐标轴指示器，坐标轴触发有效
				type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}
			,
			formatter: function (params, ticket, callback) {
				var str = "JVM实时使用情况： <br>";
				for (var i = 0; i < params.length; i++) {
					var obj = params[i];
					str += obj[0] + "：" + parseFloat(obj[2]) + "M<br>";
				}
				// setTimeout(function () {
				// 	// 仅为了模拟异步回调
				// 	callback(ticket, str);
				// }, 1000)
				return str;
			}
		},

		// dataZoom: {
		// 	show: false,
		// 	realtime: true,
		// 	start: 50,
		// 	end: 100
		// },
		legend: {
			data: lengedsJvm,
			y: 'top',
			formatter: function (val) {
				return val;
			}
		},
		calculable: true,
		axis: {
			splitLine: {
				show: false
			}
		},
		xAxis: [{
			type: 'category',
			data: packetJvm,
			nameTextStyle: {
				color: '#CFF3FD'
			},
			axisLabel: {
				formatter: '{value}'
			},
			splitLine: {
				show: false,
				lineStyle: {
					type: 'dashed'
				}
			}
		}],
		yAxis: [{
			type: 'value',
			name: '',
			axisLabel: {
				formatter: '{value}'
			},
			splitLine: {
				show: false,
				lineStyle: {
					type: 'dashed'
				}
			}
		}],
		axis: {
			splitLine: {
				show: false
			}
		},
		series: packetdataJvm,
		color: optionJvm.color
	};
	myChartJvm = echarts.init(document.getElementById(optionJvm.mainId));
	myChartJvm.setOption(echartsOptionMemery);

}

//clearInterval(timeTicket);
timeTicketJvm = setInterval(function () {

	$.get(optionJvm.url, optionJvm.params, function (res) {
		var datas = res.datas;
		var obj = {};
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetJvm.contains(e[0])) {
					packetJvm.push(e[0]);
				}
				for (var i = 0; i < packetdataJvm.length; i++) {
					if (packetdataJvm[i].name == e[2]) {
						var x = packetdataJvm[i].data;
						x.push(e[1]);
						packetdataJvm[i].data = x;
						break;
					}
				}
			});
		}
		if (packetJvm && packetJvm.length > 10) {
			packetJvm.splice(0, 1);
		}
		if (packetdataJvm && packetdataJvm.length > 10) {
			packetdataJvm.splice(0, 1);
		}
		myChartJvm.setOption({
			xAxis: [{
				//type: 'category',
				data: packetJvm
			}],
			series: packetdataJvm
		})
		// 动态数据接口 addData
		//myChart1.setSeries(packetdataJvm);
	});
}, 1000000);
