<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/webjars/static" />
<div class="layui-row" id="cms_first_nav">
	<div class="layui-col-md12">
		<div class="layui-card">
			<div class="layui-card-body">
				<ul class="layui-nav" lay-filter="component-nav" id="cms_nav_menu"></ul>
			</div>
		</div>
	</div>
</div>
<script src="${ctxStatic}/wxl/modules/cms/front/nav.js" type="text/javascript"></script>