<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>区域新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label">上级区域：</label>
						<div class="layui-input-block">
							 <input id='parentId' name='parentId' type="hidden">
				             <input id="parentName" name="parentName" value="${area.parent.name}" lay-verify="required" class="layui-input" onclick="areaTree('parentId','parentName',false);" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">区域名称：</label>
						<div class="layui-input-block">
							<input id="name" name="name" value="${area.name}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">区域编码：</label>
						<div class="layui-input-block">
							<input id="code" name="code" value="${area.code}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">区域类型：</label>
						<div class="layui-input-block">
						     <select name="type" lay-filter="aihao">
						        <c:forEach items="${fns:getDictItem('sys_area_type')}" var="fn">
									<option value="${fn.id}" <c:if test="${fn.id eq area.type}">selected=""</c:if>>${fn.name}</option>
						        </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">排序：</label>
						<div class="layui-input-block">
							<input type="text" name="queueNumber" value="${area.queueNumber}" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">	
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注:</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea">${area.remarks}</textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-card-footer">
			     <button class="layui-btn layui-btn-primary" data-type="close"><i class="fa fa-remove"></i>关闭页面</button>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/area/edit.js" type="text/javascript"></script>
</body>
</html>