;
!function(win) {
	"use strict";
	var wxl = {
		v : '1.0.1',
		config : function(options, fn) {
			options = options || {};
			return this;
		},
		msg : {
			key : 'msg',
			insert_ok : '',
			update_ok : '',
			del_ok : '',

			pass_ok : '',
			denial_ok : '',
			start_ok : '',
			stop_ok : '',
			import_ok : '',
			export_ok : '',
			save_ok : '',
			do_ok : '',
			do_error : ''
		},
		url : {
			list : 'list',
			add : 'add',
			upd : 'upd',
			del : 'delete',
			save : 'save',
			aysnsave : 'aysnsave',
			pass : 'pass',
			denial : 'denial',
			start : 'start',
			stop : 'stop',
			selectPageList : 'selectPageList',
			selectLayuiPageList : 'selectLayuiPageList',
			selectJqgridPageList : 'selectJqgridPageList'
		}
	}
}

function parseQuery() {
	var query_data = {};
	$(".condition").each(function(i, ele) {
		var name = $(this).attr("name");
		var type = $(this).attr("type");
		if (type == 'checkbox' || type == "radio") {
			var obj = document.getElementsByName(name);
			var check_val = [];
			for (k in obj) {
				if (obj[k].checked) {
					check_val.push(obj[k].value);
				}
			}
			query_data[name] = check_val.join(",");
		} else {
			var value = $(this).val();
			query_data[name] = value;
		}
	});
	return query_data;
}

//数组包含函数
Array.prototype.contains = function(needle) {
	for (i in this) {
		if (this[i] == needle)
			return true;
	}
	return false;
}

//数组删除函数
Array.prototype.del = function(val) {
	for (var i = 0; i < this.length; i++) {
		if (this[i] == val) {
			this.splice(i, 1);
			break;
		}
	}
}

function getEleById(id){
   var x = $("#" + id).val();
   return x ? x : "";
}

$.ajaxSetup({
	error : function(XMLHttpRequest, status, e) {
      layer.msg("操作失败。");
	},
	complete : function(XMLHttpRequest, status) {
		layer.closeAll('loading');
	},
	beforeSend : function(XMLHttpRequest) {
		layer.load(1);
	}
});

function subString1111(str, len){  
    var regexp = /[^\x00-\xff]/g;// 正在表达式匹配中文  
    // 当字符串字节长度小于指定的字节长度时  
    if (str.replace(regexp, "aa").length <= len) {  
        return str;  
    }  
    // 假设指定长度内都是中文  
    var m = Math.floor(len/2);  
    for (var i = m, j = str.length; i < j; i++) {  
        // 当截取字符串字节长度满足指定的字节长度  
        if (str.substring(0, i).replace(regexp, "aa").length >= len) {  
            return str.substring(0, i) + "...";  
        }  
    }  
    return str;  
}  

function autoAddEllipsis(pStr, pLen) {
	return subString1111(pStr, pLen*2);
}