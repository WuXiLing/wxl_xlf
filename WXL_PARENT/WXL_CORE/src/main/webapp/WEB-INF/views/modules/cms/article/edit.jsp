<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>文章新增</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-article-edit">
				    <input type="hidden" name="columnsId" value="${columns.id}"/>
				    <input type="hidden" name="id" value="${article.id}">
					<div class="layui-form-item">
						<label class="layui-form-label required">标题：</label>
						<div class="layui-input-block">
							<input type="text" name="title" lay-verify="required" value="${article.title}"  placeholder="请输入标题" autocomplete="off" class="layui-input">
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
						<div class="layui-inline">
							<label class="layui-form-label">置顶系数：</label>
							<div class="layui-input-block">
								<input type="text" name="stick" value="${article.stick}"  placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">来源：</label>
						<div class="layui-input-block">
							<input type="text" name="source" value="${article.source}"  placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">内容：</label>
						<div class="layui-input-block">
							<script id="content" name="content"  type="text/plain" style="width:100%;height:500px;">${article.content}</script>
						</div>
					</div>
					<%-- <div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">发布时间：</label>
							<div class="layui-input-block">
								<input type="text" name="releaseDate" id="releaseDate" lay-verify="datetime" value="${article.releaseDate}" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">发布状态：</label>
							<div class="layui-input-inline">
							    <input type="checkbox" name="status" lay-skin="switch" <c:if test="${article.status eq '1'}">checked</c:if> value="${article.status}" lay-text="发布|不发布" disabled>
							</div>
						</div>
					</div> --%>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-article-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="return false;"><i class="fa fa-reply"></i>重新填写</button>
							<button class="layui-btn layui-btn-primary" data-type="close" onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/cms/article/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8" ></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/plugins/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8" ></script>
	<script>
	    var ue = UE.getEditor('content');
	</script>
</body>
</html>
