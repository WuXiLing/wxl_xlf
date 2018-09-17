<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>角色管理</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space12">
			<div class="layui-card">
				<div class="layui-btn-group role-operate-btn">
					<button class="layui-btn layui-btn-sm" data-type="add">
						<i class="fa fa-plus"></i>新增
					</button>
					<button class="layui-btn layui-btn-sm" data-type="toquery">
						<i class="fa fa-search"></i>查询
					</button>
				</div>
				<table class="layui-hide" id="role-table-operate" lay-filter="role-table-operate"></table>
			</div>
		</div>
	</div>
	<div class="layui-card role-query-layer" style="display: none;">
		<div class="layui-card-header">查询</div>
		<div class="layui-card-body">
			<form class="layui-form layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">角色名称</label>
						<div class="layui-input-block">
							<input type="text" name="name" placeholder="请输入姓名" class="layui-input condition">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">英文名称</label>
						<div class="layui-input-block">
							<input type="text" name="enname" placeholder="请输入登录名" class="layui-input condition">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block role-operate-btn">
						<button class="layui-btn layui-btn-sm" lay-submit data-type="query" lay-filter="component-form-role-query">
							<i class="fa fa-search"></i>查询
						</button>
						<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">
							<i class="fa fa-reply"></i>重新填写
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/modules/sys/role/index.js" type="text/javascript"></script>
</body>
</html>