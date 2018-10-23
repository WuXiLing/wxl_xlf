// 员工树
function userTree(id, name, multiple) {
	layer.open({
		type : 2,
		title : "弹出树",
		area : [ "600px", "700px" ],
		fixed : false, // 不固定
		maxmin : false,
		content : ctx + "/sys/select/tree/toUserTree?id=" + id + "&name="
				+ name + "&multiple=" + multiple + "&url=" + tree_type['user']
	});
	// selectTree("user", id, name, multiple);
}

// 部门树
function officeTree(id, name, multiple) {
	selectTree("office", id, name, multiple);
}

// 部门树
function menuTree(id, name, multiple) {
	selectTree("menu", id, name, multiple);
}

// 区域树
function areaTree(id, name, multiple) {
	selectTree("area", id, name, multiple);
}

// 图标树
function iconTree(id, multiple) {
	parent.layui.layer.open({
		type : 2,
		title : "弹出树",
		area : [ "900px", "500px" ],
		fixed : false, // 不固定
		maxmin : false,
		content : ctx + "/sys/select/tree/toIconSelect?id=" + id + "&multiple="
				+ multiple
	});
}

var tree_type = {
	"user" : "sys/user/treeData",
	"office" : "sys/office/treeData",
	"menu" : "sys/menu/treeData",
	"area" : "sys/area/treeData"
};

var tree_title = {
	"user" : "用户树",
	"office" : "组织机构树",
	"menu" : "菜单树",
	"area" : "区域树"
};

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