<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>日志标题新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label">URI：</label>
						<div class="layui-input-block">
							<input type="text" name="uri" lay-verify="required" placeholder="" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">标题：</label>
						<div class="layui-input-block">
							<input type="text" name="title" lay-verify="required" placeholder="" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否可用：</label>
						<div class="layui-input-block">
							<input type="checkbox" name="status" lay-skin="switch" value="1" lay-text="可用|不可用">
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
							<button class="layui-btn" lay-submit lay-filter="component-form-log-title-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="return false;"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary close" data-type="close" onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/modules/sys/log/title/edit.js" type="text/javascript"></script>
</body>
</html>