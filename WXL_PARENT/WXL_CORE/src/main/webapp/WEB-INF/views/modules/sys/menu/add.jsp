<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>菜单新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label">上级菜单：</label>
						<div class="layui-input-block">
                                <input id='parentId' name='parentId' type="hidden" value="${menu.parent.id}">
				                <input id="parentName" name="parentName" lay-verify="required"  value="${menu.parent.name}" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">名称：</label>
						<div class="layui-input-block">
							<input id="name" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">连接：</label>
						<div class="layui-input-block">
							<input id="href" name="href" lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">图标：</label>
						<div class="layui-input-block">
							<input id="icon" name="icon" value='<i class="fa fa-user"></i>' lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">排序：</label>
						<div class="layui-input-block">
							<input id="queueNumber" name="queueNumber" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否可用</label>
						<div class="layui-input-block">
							<input name="status" value="1" title="可用" checked="" type="radio"> 
							<input name="status" value="0" title="不可用" type="radio">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">权限标识：</label>
						<div class="layui-input-block">
							<input id="permission" name="permission" lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
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
							<button class="layui-btn" lay-submit lay-filter="component-form-menu-edit"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/menu/edit.js" type="text/javascript"></script>
</body>
</html>