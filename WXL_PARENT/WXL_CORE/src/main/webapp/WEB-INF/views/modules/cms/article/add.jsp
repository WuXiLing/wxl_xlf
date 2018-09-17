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
				    <input type="hidden" name="columnsId" value="${columnsId}"/>
					<div class="layui-form-item">
						<label class="layui-form-label required">标题：</label>
						<div class="layui-input-block">
							<input type="text" name="title" lay-verify="required" value="" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">缩略图：</label>
						<div class="layui-input-inline">
							<input name="image" id="image_id" type='hidden'> <input lay-verify="required" id="image_name" placeholder="图片地址" value="" class="layui-input">
						</div>
						<div class="layui-input-inline layui-btn-container" style="width: auto;">
							<button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
								<i class="layui-icon">&#xe67c;</i>上传图片
							</button>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label required">置顶系数：</label>
							<div class="layui-input-block">
								<input type="text" name="stick" lay-verify="required"  placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label required">来源：</label>
						<div class="layui-input-block">
							<input type="text" name="source" lay-verify="required"  placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">内容：</label>
						<div class="layui-input-block">
							<script id="content" type="text/plain" style="width:100%;height:500px;"></script>
						</div>
					</div>
					<!-- <div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">发布日期：</label>
							<div class="layui-input-block">
								<input type="text" name="releaseDate" id="releaseDate" lay-verify="datetime" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">发布状态：</label>
							<div class="layui-input-inline">
							    <input type="checkbox" name="status" lay-skin="switch" value="1" lay-text="发布|不发布">
							</div>
						</div>
					</div> -->
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
	   UE.getEditor('content');
	</script>
</body>
</html>
