<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>日志管理</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
				   <div class="layui-btn-group log-table-operate-btn">
						<button class="layui-btn layui-btn-sm" data-type="toquery">查询</button>
					</div>
					<div class="layui-card-body">
						<table class="layui-hide" id="log-table-operate" lay-filter="log-table-operate"></table>
						<script type="text/html" id="log-table-operate-toolbar">
                           <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                        </script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="layui-card demo-component-layer" style="display:none;">
          <div class="layui-card-header">查询</div>
          <div class="layui-card-body">
              <form class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">标题</label>
							<div class="layui-input-block">
								<input type="text" name="name" placeholder="请输入标题" class="layui-input condition">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">IP</label>
							<div class="layui-input-block">
								<input type="text" name="no" placeholder="请输入IP" class="layui-input condition">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-sm"  lay-submit data-type="query"  lay-filter="component-form-log-query">查询</button>
							<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">重新填写</button>
						</div>
					</div>
				</form>
          </div>
    </div>
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript" ></script>
	<script src="${ctxStatic}/wxl/modules/sys/log/index.js" type="text/javascript" ></script>
</body>
</html>