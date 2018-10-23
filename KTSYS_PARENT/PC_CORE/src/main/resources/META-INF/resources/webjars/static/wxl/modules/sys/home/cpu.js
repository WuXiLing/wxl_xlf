var optionCPU = {
	title: 'CPU实时使用率',
	x: 40,
	x2: 10,
	type: 'line',
	mainId: 'mainCpu',
	url: ctx + '/sys/realtime/info/cpuInfo',
	params: {
		"proMdsItemId": $("#proMdsItemId").val(),
		"manufactureLotno": $("#manufactureLotno").val(),
		"manufactHhrDeptCode": $("#manufactHhrDeptCode").val()
	}
}
$(function () {
	parseDataCPU();
});

var packetdataCPU = [];
var packetCPU = [];// x轴数据
var lengedsCPU = [];
function parseDataCPU() {
	$.get(optionCPU.url, optionCPU.params, function (res) {

		var datas = res.datas;
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetCPU.contains(e[0])) {
					packetCPU.push(e[0]);
				}
				if (!lengedsCPU.contains(e[2])) {
					lengedsCPU.push(e[2]);
				}
				var obj = {
					name: e[2],
					type: optionCPU.type,
					data: [e[1]]
				}
				packetdataCPU.push(obj);
			});
			lengedsCPU.sort();
			initChartsCPU();
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

function initChartsCPU() {
	var echartsOptionCPU = {
		tooltip: {
			trigger: 'axis',
			axisPointer: { // 坐标轴指示器，坐标轴触发有效
				type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}
			,
			formatter: function (params, ticket, callback) {
				var str = "CPU实时使用率： <br>";
				for (var i = 0; i < params.length; i++) {
					var obj = params[i];
					str += obj[0] + "：" + parseFloat(obj[2]).toFixed(2) + "%<br>";
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
			data: lengedsCPU,
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
			data: packetCPU,
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
				formatter: '{value}%'
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
		series: packetdataCPU
	};
	myChartCPU = echarts.init(document.getElementById(optionCPU.mainId));
	myChartCPU.setOption(echartsOptionCPU);

}


timeTicketCPU = setInterval(function () {

	$.get(optionCPU.url, optionCPU.params, function (res) {
		var datas = res.datas;
		var obj = {};
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetCPU.contains(e[0])) {
					packetCPU.push(e[0]);
				}
				for (var i = 0; i < packetdataCPU.length; i++) {
					if (packetdataCPU[i].name == e[2]) {
						var x = packetdataCPU[i].data;
						x.push(e[1]);
						packetdataCPU[i].data = x;
						break;
					}
				}
			});
		}
		if (packetCPU && packetCPU.length > 10) {
			packetCPU.splice(0, 1);
		}
		if (packetdataCPU && packetdataCPU.length > 10) {
			packetdataCPU.splice(0, 1);
		}
		myChartCPU.setOption({
			xAxis: [{
				//type: 'category',
				data: packetCPU
			}],
			series: packetdataCPU
		})
		// 动态数据接口 addData
		//myChart1.setSeries(packetdata);
	});
}, 1000000);

//clearInterval(timeTicketCPU);
