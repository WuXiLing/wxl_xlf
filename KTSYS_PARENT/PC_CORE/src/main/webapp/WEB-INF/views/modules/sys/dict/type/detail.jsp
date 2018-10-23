<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>字典详细</title>
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
							<input id="name" name="name" value="${dictType.name}" lay-verify="required" placeholder="请输入" class="layui-input" type="text" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">编号：</label>
						<div class="layui-input-block">
							<input id="code" name="code" value="${dictType.code}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">排序：</label>
						<div class="layui-input-block">
							<input id="sort" name="sort" value="${dictType.sort}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否可用：</label>
						<div class="layui-input-block">
							<input name="status" value="0" title="可用" <c:if test="${dictType.status eq 1}">checked=""</c:if> type="radio" disabled/> 
							<input name="status" value="1" title="不可用" <c:if test="${dictType.status eq 0}">checked=""</c:if> type="radio" disabled/>
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea" disabled>${dictType.remarks}</textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-card-footer">
			     <button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/dict/edit.js" type="text/javascript"></script>
</body>
</html>