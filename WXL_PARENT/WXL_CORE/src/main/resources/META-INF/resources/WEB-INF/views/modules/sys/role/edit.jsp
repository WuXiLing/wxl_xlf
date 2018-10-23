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
				    <input type="hidden" value="${role.id}" name="id"/>
					<div class="layui-form-item">
					    <div class="layui-inline">
							<label class="layui-form-label">角色名称：</label>
							<div class="layui-input-block">
								<input name="name" value="${role.name}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
					    <div class="layui-inline">
							<label class="layui-form-label">英文名称：</label>
							<div class="layui-input-block">
								<input name="enname" value="${role.enname}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
					    <div class="layui-inline">
							<label class="layui-form-label">角色类型：</label>
							<div class="layui-input-block">
								<select name="roleType" lay-filter="aihao">
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
								<input type="checkbox" name="status" lay-filter="switchStatus" lay-skin="switch" ${role.status eq '1' ? 'checked': ''} value="${role.status}" lay-text="可用|不可用">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">数据范围：</label>
						<div class="layui-input-inline">
							<select name="dataScope" lay-filter="aihao">
								<option value=""></option>
								<c:forEach items="${fns:getDictItem('sys_data_scope')}" var="fn">
									<option value="${fn.id}" <c:if test="${role.dataScope eq fn.id}">selected=""</c:if>>${fn.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="layui-form-mid layui-word-aux">特殊情况下，设置为“按明细设置”，可进行跨机构授权</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入备注" class="layui-textarea">${role.remarks}</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-role-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="return false;"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary" onclick="return false;" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/role/edit.js" type="text/javascript"></script>
</body>
</html>