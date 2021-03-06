<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>字典新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label">名称：</label>
						<div class="layui-input-block">
							<input id="name" name="name" lay-verify="required|unique" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">编号：</label>
						<div class="layui-input-block">
							<input id="code" name="code" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">排序:</label>
						<div class="layui-input-block">
							<input id="sort" name="sort" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否可用</label>
						<div class="layui-input-block">
							<input name="status" value="0" title="可用" checked="" type="radio"> 
							<input name="status" value="1" title="不可用" type="radio">
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注:</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-dit-type-edit"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary close"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/dict/type/edit.js" type="text/javascript"></script>
</body>
</html>