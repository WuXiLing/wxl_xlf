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
<<<<<<< HEAD
							<input type="text" name="title" lay-verify="required" value="${article.title}" placeholder="请输入标题" autocomplete="off" class="layui-input" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">缩略图：</label>
=======
							<input type="text" name="title" lay-verify="required" value="${article.title}" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">缩略图：</label>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
						<div class="layui-input-inline" style="height:50px;">
						    <c:if test="${not empty article.image}">
							  <img alt="" src="${ctxf}/sys/storge/showImage/cms/article/${article.image}" style="height:100%;">
							</c:if>
						</div>
<<<<<<< HEAD
						<div class="layui-inline">
							<label class="layui-form-label">置顶系数：</label>
							<div class="layui-input-block">
								<input type="text" name="stick"  value="${article.stick}" placeholder="请输入" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">来源：</label>
						<div class="layui-input-block">
<<<<<<< HEAD
							<input type="text" name="source" lay-verify="required" value="${article.source}" placeholder="请输入" autocomplete="off" class="layui-input" disabled>
=======
							<input type="text" name="source" lay-verify="required" value="${article.source}" placeholder="请输入" autocomplete="off" class="layui-input">
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">内容：</label>
						<div class="layui-input-block">
<<<<<<< HEAD
							<script id="content" type="text/plain" style="width:100%;height:500px;">${article.content}</script>
=======
							<script id="content" type="text/plain" style="width:100%;height:500px;"></script>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">发布时间：</label>
							<div class="layui-input-block">
<<<<<<< HEAD
								<input type="text" name="releaseDate" id="releaseDate" value="${article.releaseDate}" lay-verify="datetime" placeholder="" autocomplete="off" class="layui-input" disabled>
=======
								<input type="text" name="releaseDate" id="releaseDate" value="${article.releaseDate}" lay-verify="datetime" placeholder="" autocomplete="off" class="layui-input">
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">发布状态：</label>
							<div class="layui-input-inline">
<<<<<<< HEAD
							    <input type="checkbox" name="status" value="${article.status}" <c:if test="${article.status eq '1'}">checked</c:if> lay-skin="switch" value="1" lay-text="发布|不发布" disabled>
=======
							    <input type="checkbox" name="status" value="${article.status}" <c:if test="${article.status eq '1'}">checked</c:if> lay-skin="switch" value="1" lay-text="发布|不发布">
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
							</div>
						</div>
					</div>
					<div class="layui-form-item">
<<<<<<< HEAD
						<div class="layui-input-block center">
=======
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="component-form-article-edit" onclick="return false;"><i class="fa fa-check"></i>确认保存</button>
							<button type="reset" class="layui-btn layui-btn-primary" onclick="return false;"><i class="fa fa-reply"></i>重新填写</button>
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
							<button class="layui-btn layui-btn-primary" data-type="close" onclick="return false;"><i class="fa fa-remove"></i>关闭页面</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/cms/article/edit.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/tree.js" type="text/javascript"></script>
<<<<<<< HEAD
	<script src="${ctxStatic}/plugins/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8" ></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/plugins/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8" ></script>
	<script>
	var ue = UE.getEditor('content');
	  ue.ready(function() {
=======
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/ueditor.config.js"></script>
	<script src="${ctxStatic}/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
	var ue = UE.getEditor('content');
	  ue.ready(function() {
		    ue.setContent('${article.content}');
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	        ue.setDisabled();
	  });
	</script>
</body>
</html>
