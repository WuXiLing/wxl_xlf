var optionMemery = {
	title: '内存实时使用率',
	x: 40,
	x2: 10,
	type: 'line',
	mainId: 'mainMemery',
	url: ctx + '/sys/realtime/info/memeryInfo',
	params: {
		"proMdsItemId": $("#proMdsItemId").val(),
		"manufactureLotno": $("#manufactureLotno").val(),
		"manufactHhrDeptCode": $("#manufactHhrDeptCode").val()
	}
}
$(function () {
	$("#" + optionMemery.mainId).width($("#" + optionCPU.mainId).width());
	$("#" + optionMemery.mainId).height($("#" + optionCPU.mainId).height());
	parseDataMemery();
});

var packetdataMemery = [];
var packetMemery = [];// x轴数据
var lengedsMemery = [];
function parseDataMemery() {
	$.get(optionMemery.url, optionMemery.params, function (res) {

		var datas = res.datas;
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetMemery.contains(e[0])) {
					packetMemery.push(e[0]);
				}
				if (!lengedsMemery.contains(e[2])) {
					lengedsMemery.push(e[2]);
				}
				var obj = {
					name: e[2],
					type: optionMemery.type,
					data: [e[1]]
				}
				packetdataMemery.push(obj);
			});
			lengedsMemery.sort();
			initChartsMemery();
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

function initChartsMemery() {
	var echartsOptionMemery = {
		tooltip: {
			trigger: 'axis',
			axisPointer: { // 坐标轴指示器，坐标轴触发有效
				type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}
			,
			formatter: function (params, ticket, callback) {
				var str = "内存实时使用率： <br>";
				for (var i = 0; i < params.length; i++) {
					var obj = params[i];
					str += obj[0] + "：" + obj[2] + "<br>";
				}
				return str;
			}
		},

		legend: {
			data: lengedsMemery,
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
			data: packetMemery,
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
				formatter: '{value}M'
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
		series: packetdataMemery
	};
	myChartMemery = echarts.init(document.getElementById(optionMemery.mainId));
	myChartMemery.setOption(echartsOptionMemery);

}


timeTicketMemery = setInterval(function () {

	$.get(optionMemery.url, optionMemery.params, function (res) {
		var datas = res.datas;
		var obj = {};
		if (datas && datas.length > 0) {
			$.each(datas, function (i, e) {
				if (!packetMemery.contains(e[0])) {
					packetMemery.push(e[0]);
				}
				for (var i = 0; i < packetdataMemery.length; i++) {
					if (packetdataMemery[i].name == e[2]) {
						var x = packetdataMemery[i].data;
						x.push(e[1]);
						packetdataMemery[i].data = x;
						break;
					}
				}
			});
		}
		if (packetMemery && packetMemery.length > 10) {
			packetMemery.splice(0, 1);
		}
		if (packetdataMemery && packetdataMemery.length > 10) {
			packetdataMemery.splice(0, 1);
		}
		myChartMemery.setOption({
			xAxis: [{
				data: packetMemery
			}],
			series: packetdataMemery
		})
		// 动态数据接口 addData
		//myChart1.setSeries(packetdata);
	});
}, 1000000);

//clearInterval(timeTicketMemery);
