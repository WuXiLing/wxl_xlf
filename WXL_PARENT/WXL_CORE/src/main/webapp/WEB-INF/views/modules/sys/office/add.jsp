<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>编辑</title>
    <meta name="decorator" content="layui" />
</head>
<body>
    <div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" id="form1" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label required">上级机构：</label>
						<div class="layui-input-block">
						       <input id='parentId' name='parentId' type="hidden" value="${office.parent.id}">
				               <input id="parentName" name="parentName" lay-verify="required" value="${office.parent.name}" class="layui-input tree" 
				               data-id="parentId" data-name="parentName" data-type="office" data-multiple="false"
				                readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">机构名称：</label>
						<div class="layui-input-block">
						    <input type="text" name="name" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">机构编码：</label>
						<div class="layui-input-block">
							<input type="text" name="code" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">排序号：</label>
						<div class="layui-input-block">
							<input type="text" name="sort" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">						
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构类型：</label>
						<div class="layui-input-block">
							<select name="type" lay-filter="aihao">
								<option value=""></option>
								<c:forEach items="${fns:getDictItem('sys_office_type')}" var="yn">
								    <option value="${yn.id}">${yn.name}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构级别：</label>
						<div class="layui-input-block">
						    <select name="grade" lay-filter="aihao">
								<option value=""></option>
								<c:forEach items="${fns:getDictItem('sys_office_grade')}" var="yn">
								    <option value="${yn.id}">${yn.name}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-office-edit"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/office/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
</body>
</html>