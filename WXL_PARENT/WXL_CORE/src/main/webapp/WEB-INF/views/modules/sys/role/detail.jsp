<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>角色详细</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">角色名称：</label>
							<div class="layui-input-block">
								<input type="text" name="name" value="${role.name}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">角色编码：</label>
							<div class="layui-input-block">
								<input type="text" name="enname" value="${role.enname}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">角色类型：</label>
							<div class="layui-input-block">
								<select name="roleType" lay-filter="aihao" disabled>
									<option value=""></option>
									<option value="assignment" <c:if test="${'assignment' eq role.roleType}">selected=""</c:if>>任务分配</option>
									<option value="security-role" <c:if test="${'security-role' eq role.roleType}">selected=""</c:if>>管理角色</option>
									<option value="user" <c:if test="${'user' eq role.roleType}">selected=""</c:if>>普通角色</option>
								</select>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">数据范围：</label>
							<div class="layui-input-block">
							    <select name="dataScope" lay-filter="aihao" disabled>
									<option value=""></option>
									<c:forEach items="${fns:getDictItem('sys_data_scope')}" var="fn">
										<option value="${fn.id}" <c:if test="${role.dataScope eq fn.id}">selected=""</c:if>>${fn.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="" class="layui-textarea" disabled>${role.remarks}</textarea>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-body" style="padding: 15px;max-height:500px;overflow-y:auto;">
						    <table class="layui-table">
						       <thead>
						           <tr>
										<th>归属公司</th>
										<th>归属部门</th>
										<th>登录名</th>
										<th>姓名</th>
										<th>电话</th>
										<th>手机</th>
									</tr>
						       </thead>
						       <tbody>
						           <c:forEach items="${role.userList}" var="user" varStatus="s">
						            <tr>
										<td>${user.company.name}</td>
										<td>${user.office.name}</td>
										<td>${user.loginName}</td>
										<td>${user.name}</td>
										<td>${user.phone}</td>
										<td>${user.mobile}</td>
									</tr>
						           </c:forEach>
						       </tbody>
						    </table>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-card-footer">
			     <button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/role/edit.js" type="text/javascript"></script>
</body>
</html>
