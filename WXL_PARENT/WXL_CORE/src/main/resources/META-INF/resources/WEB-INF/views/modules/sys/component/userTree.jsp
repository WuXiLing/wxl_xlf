<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>分配角色</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
<style type="text/css">
.ztree li a {
	border: 1px solid #999;
	padding: 3px 8px;
	border-radius: 5px;
	height: 24px;
}

.curSelectedNode {
	height: 24px !important;
	padding-top: 5px !important;
}
</style>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-sm4 layui-col-md4 layui-col-lg4">
				<div class="layui-card">
					<div class="layui-card-header">机构</div>
					<div class="layui-card-body" style="height: 570px; overflow-y: scroll; overflow-x: none;">
						<ul id="officeTree" class="ztree"></ul>
					</div>
				</div>
			</div>
			<div class="layui-col-sm4 layui-col-md4 layui-col-lg4">
				<div class="layui-card">
					<div class="layui-card-header">人员</div>
					<div class="layui-card-body" style="height: 570px; overflow-y: scroll; overflow-x: none;">
						<ul id="userTree" class="ztree"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input id="parentId" value="${id}" type="hidden" />
	<input id="parentName" value="${name}" type="hidden" />
	<script src="${ctxStatic}/wxl/utils/userTree.js" type="text/javascript"></script>
</body>
</html>
