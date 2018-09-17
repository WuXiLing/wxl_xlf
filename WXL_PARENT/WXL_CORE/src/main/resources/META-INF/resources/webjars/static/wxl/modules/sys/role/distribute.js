var selected_user_ids = [];// 已选择用户ID
var active = {
	del : function() {
		var _this = this;
		var id = $(this).data("id");
		layer.confirm('确定删除选中的数据吗？', function() {
			$.ajax({
				type : "POST",
				url : ctx + "/sys/role/removeUserFromRole/" + $("#id").val() + "/" + id,
				data : {},
				success : function(data) {
					if (data && data.msg == 'do_ok') {
						selected_user_ids.del(id);
						$(_this).parent().parent().remove();
						layer.msg("操作成功。");
					}
				}
			});
		});
	},
	distribute : function() {
		layer.open({
			type : 1,
			shade : false,
			title : '分配人员',
			offset : [ '100px' ],
			area : [ '500px', '80%' ],
			content : $("#distribute_form"),
			shadeClose : true, // 开启遮罩关闭
			cancel : function() {
				$("#distribute_form").hide();
			}
		});
	},
	affirm : function() {
		$.ajax({
			type : "POST",
			url : ctx + "/sys/role/addUserToRole/" + $("#id").val(),
			data : {
				"userIds" : selected_user_ids
			},
			success : function(data) {
				if (data.msg == 'do_ok') {
					renderUser();
					$("#distribute_form").hide();
					layer.msg("分配角色成功。");
				}
			}
		});
	}
};

$(function() {
	renderUser();
	$(".selected-id").each(function(i, e) {
		selected_user_ids.push($(e).val());
	});
	// 按钮绑定点击方法
	$('.layui-btn').on('click', function() {
		var type = $(this).data('type');
		if(type != 'del'){
			active[type] ? active[type].call(this) : '';
		}
	});
});

// 组织机构树配置参数
var setting = {
	view : {
		dblClickExpand : false,
		showLine : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : function(e, treeId, treeNode) {
			$.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
			$.get(ctx + "/sys/user/findTreeDataByOffice/" + treeNode.id,
					function(userNodes) {
						$("#select_user").empty();
						if (userNodes && userNodes.length > 0) {
							$.each(userNodes, function(i, e) {
								var id = e.id;
								if (!selected_user_ids.contains(id)) {
									var str = "";
									str += "<tr>";
									str += "<td><a class='waiting' data-name='"
											+ e.name + "' data-id='" + e.id
											+ "' onclick='add_user(this);'>"
											+ e.name + "</a></td>";
									str += "</tr>";
									$("#select_user").append(str);
								}
							});
						}
					});
		}
	}
};

// 渲染组织机构树
$.get(ctx + "/sys/office/treeData", function(nodes) {
	var treeObj = $.fn.zTree.init($("#officeTree"), setting, nodes);
	treeObj.expandAll(true);
	$.each(nodes, function(i, e) {
		if (i == 0) {
			e.checked;
			treeObj.selectNode(e);
			return;
		}
	});
});

// 选择用户，添加选择的用户到已选择区域
function add_user(obj) {
	var id = $(obj).data("id");
	var name = $(obj).data("name");
	selected_user_ids.push(id);
	var str = "";
	str += "<tr>";
	str += "<td><a class='selected_user'  data-id='" + id
			+ "' onclick='remove_user(this);'>" + name + "</a></td>";
	str += "</tr>";
	$(obj).parents("tr").first().remove();
	$("#selected_user").append(str);
}

// 从已选择的区域移除用户
function remove_user(obj) {
	var id = $(obj).data("id");
	var name = $(obj).data("name");
	selected_user_ids.del(id);
	$(obj).parents("tr").first().remove();
}

// 渲染用户数据
function renderUser() {
	$("#role_user_table").empty();
	$.get(ctx + "/sys/role/getRoleAssignData/" + $("#id").val(),
			function(data) {
				if (data) {
					if (data.userList && data.userList.length > 0) {
						$.each(data.userList,function(i, e) {
							var s = "";
							s += "<tr>";
							s += "   <td style='display:none;'>";
							s += "       <input type='hidden' class='selected-id' value='" + e.id + "'/>";
							s += "   </td>";
							s += "   <td>" + e.company.name + "</td>";
							s += "   <td>" + e.office.name + "</td>";
							s += "   <td>" + e.loginName + "</td>";
							s += "   <td>" + e.name + "</td>";
							s += "   <td>" + e.phone + "</td>";
							s += "   <td>" + e.mobile+ "</td>";
							s += "   <td>";
							s += "       <a class='layui-btn layui-btn-danger layui-btn-xs' data-type='del' data-id='" + e.id + "'><i class='fa fa-trash-o'></i>删除</a>";
							s += "   </td>";
							s += "</tr>";
							$("#role_user_table").append(s);
						});
						// 按钮绑定点击方法
						$('.layui-btn').on('click', function() {
							var type = $(this).data('type');
							if(type == 'del'){
								active[type] ? active[type].call(this) : '';
							}
						});
					}
				}
			});
}