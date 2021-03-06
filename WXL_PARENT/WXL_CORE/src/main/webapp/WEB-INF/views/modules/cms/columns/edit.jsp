<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>栏目新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
					<div class="layui-form-item">
						<label class="layui-form-label required">上级栏目：</label>
						<div class="layui-input-block">
							 <input id='parentId' name='parent.id' value="${columns.parent.id}" type="hidden">
				             <input id="parentName" name="parentName" value="${columns.parent.name}" lay-verify="required" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">栏目名称：</label>
						<div class="layui-input-block">
							<input id="name" name="name" value="${columns.name}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">缩略图：</label>
						<div class="layui-input-inline">
							<input name="image" id="image_id" value="<c:out value='${storgeEntity.id}'/>" type='hidden'>
							<input id="image_name" value="<c:out value='${storgeEntity.physicalName}'/>"  placeholder="图片地址" value="" class="layui-input">
						</div>
						<div class="layui-input-inline layui-btn-container" style="width: auto;">
							<button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
								<i class="layui-icon">&#xe67c;</i>上传图片
							</button>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">栏目编码：</label>
						<div class="layui-input-block">
							<input id="code" name="code" value="${columns.code}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text"> 
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">栏目类型：</label>
						<div class="layui-input-block">
						     <select name="type" lay-filter="aihao" readonly>
						        <c:forEach items="${fns:getDictItem('columns_type')}" var="fn">
									<option value="${fn.id}" <c:if test="${fn.id eq columns.type}">selected=""</c:if>>${fn.name}</option>
						        </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">是否首页栏目：</label>
						<div class="layui-input-block">
							<input type="checkbox" name="firstnav" value="${columns.firstnav}" lay-skin="switch" <c:if test="${columns.firstnav eq 'on'}">checked</c:if> lay-text="是|不是">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">打开目标：</label>
						<div class="layui-input-block">
							<input type="radio" name="target" value="_blank" <c:if test="${columns.target eq '_blank'}">checked</c:if> title="在新窗口中打开">
							<input type="radio" name="target" value="_self" <c:if test="${columns.target eq '_self'}">checked</c:if> title="在相同的框架中打开">
							<input type="radio" name="target" value="_parent" <c:if test="${columns.target eq '_parent'}">checked</c:if> title="在父框架集中打开">
							<input type="radio" name="target" value="_top" <c:if test="${columns.target eq '_top'}">checked</c:if> title="在整个窗口中打开">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">排序：</label>
						<div class="layui-input-block">
							<input type="text" name="sort" value="${columns.sort}" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">	
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="请输入内容" class="layui-textarea" readonly>${columns.remarks}</textarea>
						</div>
					</div>
					<div class="layui-card-footer">
					     <button class="layui-btn" lay-submit lay-filter="component-form-columns-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
						 <button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply" onclick="return false;"></i>重新填写</button>
					     <button class="layui-btn layui-btn-primary" data-type="close"  onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/cms/columns/edit.js" type="text/javascript"></script>
</body>
</html>