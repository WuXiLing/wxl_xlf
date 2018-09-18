<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>栏目管理</title>
<meta name="decorator" content="layui" />
</head>
<body>
    <div class="layui-fluid">
		<div class="layui-btn-group cms-columns-operate-btn">
			<button class="layui-btn layui-btn-sm" data-type="toquery">
				<i class="fa fa-search"></i>查询
			</button>
		</div>
		<table id="cms_columns-table" class="layui-table" lay-filter="cms_columns-table"></table>
	</div>
	<div class="layui-card cms-columns-component-layer" style="display: none;">
		<div class="layui-card-header">查询</div>
		<div class="layui-card-body">
			<form class="layui-form layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">关键词：</label>
						<div class="layui-input-block">
							<input type="text" id="keyword" placeholder="请输入关键词" class="layui-input condition">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block cms-columns-table-operate-btn">
						<button class="layui-btn layui-btn-sm" lay-submit data-type="query" lay-filter="component-form-cms-columns-query"><i class="fa fa-search"></i>查询</button>
						<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
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
	<script type="text/html" id="imageTpl"> 
        {{# if (d.image) { }}
		<img style="display: inline-block; width: 50%; height: 100%;" src= {{ ctx + '/sys/storge/showImage/cms/columns/' + d.image }}>
        {{# } }}
	 </script> 
	 <script type="text/html" id="firstnavTpl">
         <input type="checkbox" name="firstnav" lay-skin="switch" lay-text="是|否" value="{{ d.firstnav }}" {{ d.firstnav == 'on' ? 'checked' : '' }} disabled>
     </script>
	<c:forEach items="${fns:getDictItem('columns_type')}" var="yn">
		<input type="hidden" id="st_columns_type_${yn.id}" value="${yn.name}">
	</c:forEach>
	<script src="${ctxStatic}/wxl/modules/cms/columns/index2.js" type="text/javascript"></script>
</body>
</html>