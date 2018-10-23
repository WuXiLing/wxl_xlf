<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>权限管理</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<ul id="authorityTree" class="ztree"></ul>
			</div>
			<div class="layui-card-footer right">
				<a class="layui-btn layui-btn-primary layui-btn-xs authority" onclick="return false;"><i class="fa fa-edit"></i>提交</a>
			</div>
		</div>
	</div>

	<SCRIPT type="text/javascript">
		var setting = {
			check : {
				enable : true,
				nocheckInherit : true
			},
			data : {
				simpleData : {
					enable : true
				}
			}
		};

		$(document).ready(function() {
			$.get("${ctx}/sys/menu/treeData", function(nodes) {
				var tree = $.fn.zTree.init($("#authorityTree"), setting, nodes);
				$.get("${ctx}/sys/role/getMenuByRole/${role.id}", function(res) {
					$.each(res.menus, function(i,e) {
				        var node = tree.getNodeByTId(e.menuId);
				        if(node){
				           tree.checkNode(node, true, true,false);
				        }
					});
				});
			});

			$(".authority").on("click",function(){
				authority();
			});
		});

		function authority() {
			var zTree = $.fn.zTree.getZTreeObj("authorityTree");
			var selectNodes = zTree.getCheckedNodes(true);
			var selected_ids = [];
			if (selectNodes.length == 0) {
				layer.msg("请选择授权的菜单。");
			} else {
				$.each(selectNodes, function(i,e) {
					selected_ids.push(e.id);
				});
	
				$.ajax({
					type : "POST",
					url : ctx + "/sys/role/addMenuToRole/${role.id}",
					data : {
						"menuIds" : selected_ids
					},
					success : function(data) {
						if (data.msg == 'do_ok') {
							layer.msg("授权成功。");
						}
					}
				});
			}
		}
	</SCRIPT>
</body>
</html>
