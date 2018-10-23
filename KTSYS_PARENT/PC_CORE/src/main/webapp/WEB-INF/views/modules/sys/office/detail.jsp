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
				    <input name='id' type="hidden" value="${office.id}">
					<div class="layui-form-item">
						<label class="layui-form-label">上级机构：</label>
						<div class="layui-input-block">
				               <input id="parentName" name="parent.name" lay-verify="required" value="${office.parent.name}" class="layui-input" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构名称：</label>
						<div class="layui-input-block">
						    <input type="text" name="name" lay-verify="required" value="${office.name}" placeholder="" autocomplete="off" class="layui-input" disabled>						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构编码：</label>
						<div class="layui-input-block">
							<input type="text" name="code" lay-verify="required" value="${office.code}" placeholder="" autocomplete="off" class="layui-input" disabled>						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">排序号：</label>
						<div class="layui-input-block">
							<input type="text" name="sort" lay-verify="required" value="${office.sort}" placeholder="" autocomplete="off" class="layui-input" disabled>						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构类型：</label>
						<div class="layui-input-block">
							<select name="type" lay-filter="aihao" disabled>
								<option value=""></option>
								<c:forEach items="${fns:getItem('sys_office_type')}" var="yn">
								    <option value="${yn.id}" <c:if test="${yn.id eq office.type}">selected=""</c:if>>${yn.name}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构级别：</label>
						<div class="layui-input-block">
						    <select name="grade" lay-filter="aihao" disabled>
								<option value=""></option>
								<c:forEach items="${fns:getDictItem('sys_office_grade')}" var="yn">
								    <option value="${yn.id}" <c:if test="${yn.id eq office.grade}">selected=""</c:if>>${yn.name}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							 <textarea name="remarks" placeholder="" class="layui-textarea" disabled>${office.remarks}</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">系统数据：</label>
						<div class="layui-input-block">
						      <c:if test="${office.sysData}">
							      <div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled">
							          <i class="layui-anim layui-icon"></i>
							          <div><span class='error'>是</span></div>
							      </div>
						      </c:if>
						      <c:if test="${!office.sysData}">
							      <div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled">
							          <i class="layui-anim layui-icon"></i>
							          <div>否</div>
							      </div>
						      </c:if>
						</div>
					</div>
                    <div class="layui-form-item">
						<label class="layui-form-label">状态：</label>
						<div class="layui-input-block">
						      <c:if test="${office.status eq 1}">
							      <div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled">
							          <i class="layui-anim layui-icon"></i>
							          <div><span class='error'>禁用</span></div>
							      </div>
						      </c:if>
						      <c:if test="${office.status eq 0}">
							      <div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled">
							          <i class="layui-anim layui-icon"></i>
							          <div>正常</div>
							      </div>
						      </c:if>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-card-footer">
			     <button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/office/detail.js" type="text/javascript"></script>
</body>
</html>
