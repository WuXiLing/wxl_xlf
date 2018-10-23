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
<<<<<<< HEAD
}
var Wxl = function Wxl(moduleKey, options) {
	this.defaults = {
		version : "1.2.1",
		moduleKey : "",// 模块唯一性字符
		baseUrl : "",// 模块相对URL
		icon : "",// 图标
		title : "",// 标题
		table : layui.table,// 表格
		treeTable : layui.treetable,// 树表格
		tableId : moduleKey + "-table",// 表格ID
		tableType : "table",// 表格类型
		tableButtonId : "#" + moduleKey + "-table-operate-bar",// 表格按钮ID
		operateButtonId : "." + moduleKey + "-operate-btn",// 查询按钮伪类
		queryLayerId : "." + moduleKey + "-query-layer",// 弹出查询按钮伪类
		queryContentId : "." + moduleKey + "-query-content",
		addOp : "add",// 新增标识符
		updOp : "upd",// 修改标识符
		delOp : "delete",// 删除标识符
		detailOp : "detail",// 详细标识符
		treeTableDataOp : "getManageData",//树表格数据
		tableDataOp : "selectLayuiPageList",//表格数据
		addChildrenOp : "addChildren",
		rowOp:null
	}

	this.options = $.extend({}, this.defaults, options)
	var self = this;
	// 获取新增
	this.getAddUrl = function() {
		return self.options.baseUrl + "/" + self.options.addOp;
	}
	this.getDelUrl = function() {
		return self.options.baseUrl + "/" + self.options.delOp + "/";
	}
	this.getUpdUrl = function() {
		return self.options.baseUrl + "/" + self.options.updOp+ "/";
	}
	this.getDetailUrl = function() {
		return self.options.baseUrl + "/" + self.options.detailOp + "/";
	}
	this.getAddChildrenUrl = function() {
		return self.options.baseUrl + "/" + self.options.addChildrenOp + "/";
	}
	this.getTableDataUrl = function() {
		return self.options.baseUrl + "/" + self.options.tableDataOp + "/";
	}
	this.getTreeTableDataUrl = function() {
		return self.options.baseUrl + "/" + self.options.treeTableDataOp + "/";
	}
	
	this.add = function() {
		var index = layui.layer.open({
			type : 2,
			title : self.options.icon + self.options.title + '新增',
			content : self.getAddUrl(),
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}

	this.upd = function(id) {
		var index = layui.layer.open({
			type : 2,
			title : self.options.icon + self.options.title + "编辑",
			content : self.getUpdUrl() + id,
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}

	this.del = function(id, callback) {
		layer.confirm('确定删除选中的数据吗？', function() {
			$.ajax({
				type : 'POST',
				url : self.getDelUrl() + id,
				async : false,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) {
					if(callback && callback instanceof Function){
						callback();
					}
					self.reloadTable();
					layer.msg('删除成功。', {
						time : 2000
					});
					// location.reload();
				},
				error : function() {
					parent.layer.alert("删除失败。", {
						title : '提示'
					});
				}
			});
		});
	}

	this.detail = function(id) {
		var index = parent.layui.layer.open({
			type : 2,
			title : self.options.icon + self.options.title + "详细",
			content : self.getDetailUrl() + id,
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}

	this.addChildren = function(id) {
		var index = layui.layer.open({
			type : 2,
			title : self.options.icon + self.options.title + "新增",
			content : self.getAddChildrenUrl() + id,
			area : [ '90%', '90%' ],
			maxmin : true
		});
	}

	this.toquery = function() {
		layer.open({
			type : 1,
			shade : false,
			title : false,
			offset : [ '100px' ],
			area : [ '500px', '240px' ],
			content : $(self.options.queryContentId),
			cancel : function() {
				alert();
				$(self.options.queryContentId).hide();
			}
		});
	}
	this.query = function() {
		if (self.options.tableType == "treeTable") {
			var keyword = $("#keyword").val();
			if (keyword == '') {
				layer.msg("请输入搜索内容", {
					icon : 5
				});
				return;
			}
			var searchCount = 0;
			$('#' + self.options.tableId).next('.treeTable').find('.layui-table-body tbody tr td').each(function() {
				$(this).css('background-color', 'transparent');
				var text = $(this).text();
				if (keyword != '' && text.indexOf(keyword) >= 0) {
					$(this).css('background-color', 'rgba(250,230,160,0.5)');
					if (searchCount == 0) {
						self.options.treeTable.expandAll('#' + self.options.tableId);
						$('html,body').stop(true);
						$('html,body').animate({
							scrollTop : $(this).offset().top - 150
						}, 500);
					}
					searchCount++;
				}
			});
			if (searchCount == 0) {
				layer.msg("没有匹配结果", {
					icon : 5
				});
			}
		} else if(self.options.tableType == "table"){
			parseQuery();
			
			layer.load(2);
			self.options.table.reload(self.options.tableId,{
			   where: { //设定异步数据接口的额外参数，任意设
				  aaaaaa: 'xxx'
				    ,bbb: 'yyy'
				    //…
				  }
				,page: {
				    curr: 1 //重新从第 1 页开始
				},
				done : function() {
					layer.closeAll('loading');
				}
			});
			
		}
	}
	this.initTreeTable = function() {
		// 渲染表格
		var renderTable = function() {
			layer.load(2);
			self.options.treeTable.render({
				treeColIndex : 1,
				treeSpid : 0,
				treeIdName : 'id',
				treePidName : 'pId',
				elem : '#' + self.options.tableId,
				url : self.getTreeTableDataUrl(),
				page : false,
				width : '100%',
				cols : [ self.options.columns ],
				height : 'full-70',
				done : function() {
					layer.closeAll('loading');
				}
			});
		};

		renderTable();

		// 监听工具条
		self.options.table.on('tool(' + self.options.tableId + ')', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				self.detail(data.id);
			} else if (obj.event === 'del') {
				self.del(data.id);
			} else if (obj.event === 'edit') {
				self.upd(data.id);
			} else if (obj.event === 'addChildren') {
				self.addChildren(data.id);
			}
		});
	}

	this.reloadTable = function(params){
		if (self.options.tableType == "table") {
			self.options.table.reload(self.options.tableId, params);
		} else if (self.options.tableType == "treeTable") {
			self.initTreeTable();
		}
	}
	
	this.bindEve = function() {
		var active = {
			add : function() {
				self.add();
			},
			toquery : function() {
				self.toquery();
			},
			query : function() {
				self.query();
			}
		};

		$('.layui-btn').on('click', function() {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	}

	this.initTable = function() {
		// 渲染表格
		var renderTable = function() {
			layer.load(2);
			self.options.table.render({
				elem : '#' + self.options.tableId,
				url : self.getTableDataUrl(),
				page : true,
				width : '100%',
				cols : [ self.options.columns ],
				height : 'full-100',
				done : function() {
					layer.closeAll('loading');
				}
			});
		};

		renderTable();

		// 监听工具条
		self.options.table.on('tool(' + self.options.tableId + ')', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				self.detail(data.id);
			} else if (obj.event === 'del') {
				self.del(data.id);
			} else if (obj.event === 'edit') {
				self.upd(data.id);
			} else if (obj.event === 'addChildren') {
				self.addChildren(data.id);
			} else {
				console.info(self.options.rowOp);
				(self.options.rowOp && self.options.rowOp[obj.event]) ? self.options.rowOp[obj.event].call(this,data.id) : '';
			}
		});
	}

	this.init = function() {
		layui.config({
			base : ctxStatic + '/plugins/layui/lay/modules/'
		}).extend({
			treetable : 'treetable'
		}).use([  'table','form','layer','treetable' ], function() {
			var form = layui.form;
			self.options.treeTable = layui.treetable;
			self.bindEve();
			if (self.options.tableType == "table") {
				self.initTable();
				form.on('submit(component-form-columns-query)', function(data) {
					return false;
				});
			} else if (self.options.tableType == "treeTable") {
				self.initTreeTable();
			}
		});
	}
}

function inheritObject(o) {
	// 声明一个过渡函数对象
	function F() {}
	// 过渡对象的原型继承父对象
	F.prototype = o;
	// 返回一个过渡对象的实例，该实例的原型继承了父对象
	return new F();
}
// 寄生式继承
// 寄生式继承就是对原型继承的第二次封装，使得子类的原型等于父类的原型。并且在第二次封装的过程中对继承的对象进行了扩展
function inheritPrototype(subClass, superClass) {
	// 复制一份父类的原型保存在变量中，使得p的原型等于父类的原型
	var p = inheritObject(superClass.prototype);
	// 修正因为重写子类原型导致子类constructor属性被修改
	p.constructor = subClass;
	// 设置子类的原型
	subClass.prototype = p;
}

function createObj(){
	var temp = function(moduleKey, options) {
		Wxl.call(this, moduleKey, options)
	}
	inheritObject(temp, Wxl);
	return temp;
}
=======
}
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
