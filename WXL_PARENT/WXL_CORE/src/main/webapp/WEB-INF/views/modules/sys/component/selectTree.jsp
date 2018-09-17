<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>树</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
<style type="text/css">
html {
	height: 100%;
	margin: 0;
}

body {
	height: 100%;
	margin: 0;
}

.div {
	width: 90%;
	height: 100%;
	z-index: 1;
}
</style>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<!-- <div class="layui-card-header"></div> -->
			<div class="layui-card-body layadmin-text">
				<ul id="initTree" class="ztree"></ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		layui.use([], function() {
			var $ = layui.$;
			var setting = {
				view : {
					selectedMulti : false,
					nameIsHTML : true,
					showTitle : false,
					dblClickExpand : false
				},
				data : {
					simpleData : {
						enable : true
					}
				},
				callback : {
					onClick : function(event, treeId, treeNode, clickFlag) {
						$.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
						parent[parent.length-2].layui.$('#${id}').val(treeNode.id);
						parent[parent.length-2].layui.$('#${name}').val(treeNode.name);
					}
				}
			};

			$.ajax({
				type : "POST",
				url : ctx + "/${url}",
				data : {
				/* idsArr : ids.join(",") */
				},
				success : function(data) {
					if (data) {
						var nodes = [];
						$.each(data, function(i, e) {
							nodes.push({
								id : e.id,
								pId : e.pId ? e.pId : '1',
								name : e.name
							});
						});
						var treeObj = $.fn.zTree.init($("#initTree"), setting,
								nodes);
						treeObj.expandAll(true);
					}
				}
			});
		});
	</script>
</body>
</html>
