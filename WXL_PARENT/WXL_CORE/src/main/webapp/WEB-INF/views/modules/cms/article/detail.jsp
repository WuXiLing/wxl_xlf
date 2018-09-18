<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>文章详细</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-article-edit">
				    <input type="hidden" name="columnsId" value="${columns.id}"/>
					<div class="layui-form-item">
						<label class="layui-form-label required">标题：</label>
						<div class="layui-input-block">
							<input type="text" name="title" lay-verify="required" value="${article.title}" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">缩略图：</label>
						<div class="layui-input-inline" style="height:50px;">
						    <c:if test="${not empty article.image}">
							  <img alt="" src="${ctxf}/sys/storge/showImage/cms/article/${article.image}" style="height:100%;">
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">来源：</label>
						<div class="layui-input-block">
							<input type="text" name="source" lay-verify="required" value="${article.source}" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">内容：</label>
						<div class="layui-input-block">
							<script id="content" type="text/plain" style="width:100%;height:500px;">${article.content}</script>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">发布时间：</label>
							<div class="layui-input-block">
								<input type="text" name="releaseDate" id="releaseDate" value="${article.releaseDate}" lay-verify="datetime" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">发布状态：</label>
							<div class="layui-input-inline">
							    <input type="checkbox" name="status" value="${article.status}" <c:if test="${article.status eq '1'}">checked</c:if> lay-skin="switch" value="1" lay-text="发布|不发布">
							</div>
						</div>
					</div>
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
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/ueditor.config.js"></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
	var ue = UE.getEditor('content');
	  ue.ready(function() {
	        ue.setDisabled();
	  });
	</script>
</body>
</html>
