<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>控制台首页</title>
<meta name="decorator" content="wxl" />
<link rel="stylesheet" href="${ctxStatic}/layui/cms/css/admin.css"
	media="all" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">查询sql</div>
					<div class="layui-card-body">
						<form class="layui-form layui-form-pane">
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">查询sql语句</label>
								<div class="layui-input-block">
									<textarea placeholder="请输入内容" id="query" class="layui-textarea"></textarea>
								</div>
							</div>
						</form>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" onclick="aa('query');">查询</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-card">
					<div class="layui-card-header">执行sql</div>
					<div class="layui-card-body">
						<form class="layui-form layui-form-pane">
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">sql语句</label>
								<div class="layui-input-block">
									<textarea placeholder="请输入内容" id="exec" class="layui-textarea"></textarea>
								</div>
							</div>
						</form>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" onclick="aa('exec');">执行</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctxStatic}/plugins/jquery/jquery/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.all.js"></script>

	<script type="text/javascript">
		function aa(x) {
			$.ajax({
				type : "POST",
				url : ctx + "/sys/dbtool/" + x,
				data : {
					'sql' : encodeURI($("#" + x).val())
				}
				success : function(data) {
					if (data) {
						if (data.msg == "do_ok") {
							if (data.data) {
								console.info(data.data);
							}
							layer.msg("执行成功！");
						}
					}
				}
			});
		}
	</script>
</body>
</html>