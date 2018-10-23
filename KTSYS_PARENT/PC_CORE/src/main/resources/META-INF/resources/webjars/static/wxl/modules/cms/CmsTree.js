
// 栏目树
function columnsTree(id, name, multiple) {
	selectTree("columns", id, name, multiple);
}

var tree_type = {
	"columns" : "cms/columns/treeData"
};

var tree_title = {
	"columns" : "栏目树"
};

function columnsTree(id, name, multiple){
	selectTree("columns", id, name, multiple);
}
// 选择树
function selectTree(type, id, name, multiple) {
	parent.layui.layer.open({
		type : 2,
		title : tree_title[type],
		area : [ "350px", "700px" ],
		fixed : false, // 不固定
		maxmin : false,
		content : ctx + "/sys/select/tree/to?id=" + id + "&name=" + name
				+ "&multiple=" + multiple + "&url=" + tree_type[type]
	});
}

$(function() {
	$(".tree").each(function(i, e) {
		var _this = e;
		$(_this).on("click", function() {
			selectTree($(_this).data("type"),$(_this).data("id"),$(_this).data("name"),$(_this).data("multiple"));
		});
	});
})