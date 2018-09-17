<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>模型新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label">模型分类：</label>
						<div class="layui-input-block">
							<input name="category" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">模型名称：</label>
						<div class="layui-input-block">
							<input name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">模型标识：</label>
						<div class="layui-input-block">
							<input name="key" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-modeler-edit"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/act/modeler/edit.js" type="text/javascript"></script>
</body>
</html>