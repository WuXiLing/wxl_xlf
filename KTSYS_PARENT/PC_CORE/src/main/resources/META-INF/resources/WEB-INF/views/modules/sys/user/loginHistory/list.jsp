<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录历史管理</title>
<meta name="decorator" content="layui" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<table class="layui-hide" id="user-login-history-table-operate" lay-filter="user-login-history-table-operate"></table>
		</div>
	</div>
	<input type="hidden" id="userId" value="${userId}"/>
    <script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript" ></script>
    <script src="${ctxStatic}/wxl/modules/sys/user/loginHistory/index.js" type="text/javascript" ></script>
</body>
</html>