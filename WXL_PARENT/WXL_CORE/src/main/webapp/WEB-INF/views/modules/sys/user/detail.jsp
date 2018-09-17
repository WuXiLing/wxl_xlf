<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>用户详细</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<input type="hidden" name="id" value="${user.id}">
					<div class="layui-form-item">
						<label class="layui-form-label">头像</label>
						<div class="layui-input-inline">
						    <c:if test="${not empty user.photo}">
							    <img src="${ctx}/sys/storge/showImage/admin/user/${user.photo}" class="userAvatar">
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">姓名</label>
							<div class="layui-input-block">
								<input type="text" name="name" lay-verify="required" value="${user.name}" placeholder="请输入姓名" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">工号</label>
							<div class="layui-input-block">
								<input type="text" name="no" lay-verify="title" value="${user.no}" autocomplete="off" placeholder="请输入工号" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">登录名</label>
							<div class="layui-input-block">
								<input type="text" name="loginName" lay-verify="required" value="${user.loginName}" placeholder="请输入登录名" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">身份证</label>
							<div class="layui-input-block">
								<input type="text" name="idcard" lay-verify="identity" value="${user.idcard}" placeholder="请输入身份证" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">归属公司</label>
							<div class="layui-input-block">
								<input id='companyId' name='company.id' type="hidden" value="${user.company.id}"> 
								<input id="companyName" name="company.name" value="${user.company.name}" lay-verify="required" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">归属公司</label>
							<div class="layui-input-block">
								<input id='officeId' name='office.id' type="hidden" value="${user.office.id}"> 
								<input id="officeName" name="office.name" value="${user.office.name}" lay-verify="required" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">民族</label>
							<div class="layui-input-block">
								<select name="nation" lay-filter="aihao" disabled>
									<option value=""></option>
									<option value="0" <c:if test="${0 eq user.nation}">selected=""</c:if>>汉</option>
									<option value="1" <c:if test="${1 eq user.nation}">selected=""</c:if>>藏</option>
									<option value="2" <c:if test="${2 eq user.nation}">selected=""</c:if>>回</option>
									<option value="3" <c:if test="${3 eq user.nation}">selected=""</c:if>>蒙</option>
									<option value="4" <c:if test="${4 eq user.nation}">selected=""</c:if>>壮</option>
								</select>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<c:forEach items="${fns:getDictItem('sex')}" var="yn">
									<input type="radio" name="gender" value="${yn.id}" title="${yn.name}" <c:if test="${yn.id eq user.gender}">checked=""</c:if> disabled>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">出生日期</label>
							<div class="layui-input-block">
								<input type="text" name="birthday" value="<fmt:formatDate value='${user.birthday}' type='date' pattern='yyyy-MM-dd'/>" id="LAY-component-form-group-date" lay-verify="date" placeholder="" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">QQ</label>
							<div class="layui-input-block">
								<input type="tel" name="qq" autocomplete="off" value="${user.qq}" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">手机</label>
							<div class="layui-input-block">
								<input type="tel" name="mobile" lay-verify="required|phone" value="${user.mobile}" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input type="text" name="email" lay-verify="email" value="${user.email}" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea" disabled>${user.remarks}</textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-card-footer">
			     <button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/user/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
</body>
</html>
