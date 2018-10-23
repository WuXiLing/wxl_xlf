<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>角色新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
<<<<<<< HEAD
					    <div class="layui-inline">
							<label class="layui-form-label">角色名称：</label>
							<div class="layui-input-block">
								<input type="text" name="name" lay-verify="required" placeholder="" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">角色编码：</label>
							<div class="layui-input-block">
								<input type="text" name="enname" lay-verify="required" placeholder="" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">角色类型：</label>
							<div class="layui-input-block">
								<select name="roleType"  lay-verify="">
									<option value=""></option>
									<option value="assignment" <c:if test="${'assignment' eq role.roleType}">selected=""</c:if>>任务分配</option>
									<option value="security-role" <c:if test="${'security-role' eq role.roleType}">selected=""</c:if>>管理角色</option>
									<option value="user" <c:if test="${'user' eq role.roleType}">selected=""</c:if>>普通角色</option>
								</select>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">是否可用：</label>
							<div class="layui-input-block">
								<input type="checkbox" name="status" lay-skin="switch" value="1" lay-text="可用|不可用">
							</div>
						</div>
=======
						<label class="layui-form-label">角色名称：</label>
						<div class="layui-input-block">
							<input name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">角色编码：</label>
						<div class="layui-input-block">
							<input name="enname" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">角色类型：</label>
						<div class="layui-input-inline">
							<select name="roleType" lay-filter="aihao">
								<option value=""></option>
								<option value="assignment">任务分配</option>
								<option value="security-role">管理角色</option>
								<option value="user">普通角色</option>
							</select>
						</div>
						<div class="layui-form-mid layui-word-aux">工作流组用户组类型（任务分配：assignment、管理角色：security-role、普通角色：user）</div>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">数据范围：</label>
						<div class="layui-input-inline">
							<select name="dataScope" lay-filter="aihao">
								<option value=""></option>
								<c:forEach items="${fns:getDictItem('sys_data_scope')}" var="x">
									<option value="${x.id}">${x.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="layui-form-mid layui-word-aux">特殊情况下，设置为“按明细设置”，可进行跨机构授权</div>
					</div>
<<<<<<< HEAD
=======
					<div class="layui-form-item">
						<label class="layui-form-label">是否可用：</label>
						<div class="layui-input-block">
							<input name="status" value="1" title="可用" checked="" type="radio"> 
							<input name="status" value="0" title="不可用" type="radio">
						</div>
					</div>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
<<<<<<< HEAD
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-role-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="return false;"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary close" data-type="close" onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
=======
                    <div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
						</div>
					</div>

					
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-role-edit"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/modules/sys/role/edit.js" type="text/javascript"></script>
=======
	<script src="${ctxStatic}/wxl/modules/sys/role/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/ueditor.config.js"></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
	   UE.getEditor('editor');
	</script>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
</body>
</html>