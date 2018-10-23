<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>机构管理</title>
<meta name="decorator" content="layui" />
<<<<<<< HEAD
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-btn-group sys-office-operate-btn">
=======
<%@include file="/WEB-INF/views/layui/treetable.jsp"%>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-btn-group office-operate-btn">
			<button class="layui-btn layui-btn-sm" data-type="add">
				<i class="fa fa-plus"></i>新增
			</button>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
			<button class="layui-btn layui-btn-sm" data-type="toquery">
				<i class="fa fa-search"></i>查询
			</button>
		</div>
<<<<<<< HEAD
		<table id="sys-office-table" class="layui-table" lay-filter="sys-office-table"></table>
	</div>
	<div class="layui-card sys-office-query-content" style="display: none;">
		<div class="layui-card-header"><i class="fa fa-search"></i> 查询</div>
=======
		<table id="tableMain" class="layui-table" lay-filter="tableMain"></table>
	</div>
	<div class="layui-card office-component-layer" style="display: none;">
		<div class="layui-card-header">查询</div>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		<div class="layui-card-body">
			<form class="layui-form layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-inline">
<<<<<<< HEAD
						<label class="layui-form-label">关键词：</label>
						<div class="layui-input-block">
							<input type="text" id="keyword" placeholder="请输入关键词" class="layui-input condition">
=======
						<label class="layui-form-label">名称：</label>
						<div class="layui-input-block">
							<input type="text" name="name" placeholder="请输入" class="layui-input condition">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">编码：</label>
						<div class="layui-input-block">
							<input type="text" name="code" placeholder="请输入" class="layui-input condition">
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
						</div>
					</div>
				</div>
				<div class="layui-form-item">
<<<<<<< HEAD
					<div class="layui-input-block sys-office-operate-btn">
						<button class="layui-btn layui-btn-sm" lay-submit data-type="query" lay-filter="component-form-sys-office-query" onclick="return false;" ><i class="fa fa-search"></i>查询</button>
						<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary"><i class="fa fa-reply" onclick="return false;"></i>重新填写</button>
=======
					<div class="layui-input-block office-operate-btn">
						<button class="layui-btn layui-btn-sm" lay-submit data-type="query" lay-filter="component-form-office-query"><i class="fa fa-search"></i>查询</button>
						<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/html" id="oper-col">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="fa fa-search"></i>查看</a>
			{{# if (!d.sysData) { }}
				<a class="layui-btn layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i>修改</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>
			{{# } }}
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="addChildren"><i class="fa fa-plus"></i>新增下级</a>
	</script>
	<script src="${ctxStatic}/wxl/modules/sys/office/index.js" type="text/javascript"></script>
</body>
</html>