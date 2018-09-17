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
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group" enctype="multipart/form-data">
					<div class="layui-form-item">
						<label class="layui-form-label required">上级栏目：</label>
						<div class="layui-input-block">
							 <input id='parentId' name='parentId' type="hidden" value="${columns.parent.id}">
				             <input id="parentName" name="parentName" lay-verify="required" class="layui-input" value="${columns.parent.name}"  onclick="columnsTree('parentId','parentName',false);" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">栏目名称：</label>
						<div class="layui-input-block">
							<input id="name" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">缩略图：</label>
						<div class="layui-input-inline">
							<input name="image" id="image_id" type='hidden'>
							<input id="image_name" placeholder="图片地址" value="" class="layui-input">
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
							<input id="code" name="code" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label required">栏目类型：</label>
							<div class="layui-input-block">
								<c:forEach items="${fns:getDictItem('columns_type')}" var="yn">
									<input type="radio" name="type" value="${yn.id}" title="${yn.name}" <c:if test="${yn.id eq user.gender}">checked=""</c:if>>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">是否首页栏目:</label>
						<div class="layui-input-block">
							<input type="checkbox" name="firstnav" lay-skin="switch" lay-value="on|off" lay-text="是|否">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">打开目标:</label>
						<div class="layui-input-block">
							<input type="radio" name="target" value="_blank" checked title="在新窗口中打开">
							<input type="radio" name="target" value="_self" title="在相同的框架中打开">
							<input type="radio" name="target" value="_parent" title="在父框架集中打开">
							<input type="radio" name="target" value="_top" title="在整个窗口中打开">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">排序：</label>
						<div class="layui-input-block">
							<input type="text" name="sort" lay-verify="required" placeholder="请输入排序" autocomplete="off" class="layui-input">	
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
							<button class="layui-btn" lay-submit lay-filter="component-form-columns-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-reply" onclick="return false;"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary" data-type="close" onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/cms/columns/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/modules/cms/CmsTree.js" type="text/javascript"></script>
</body>
</html>