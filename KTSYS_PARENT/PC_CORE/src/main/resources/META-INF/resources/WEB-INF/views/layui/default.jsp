<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="http://java.sun.com/jsp/jstl/wxl/shiro"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fns" uri="http://java.sun.com/jsp/jstl/wxl/fns"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<c:set var="ctx" value="${pageContext.request.contextPath}${fns:getAdminPath()}" />
<c:set var="ctxf" value="${pageContext.request.contextPath}${fns:getFrontPath()}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/webjars/static" />
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title /></title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta name="author" content="wuxiling" />
	<meta name="renderer" content="webkit" />
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="${ctxStatic}/images/favicon/ktsys/32/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${ctxStatic}/images/favicon/ktsys/32/favicon.ico" type="image/x-icon" />

	<link href="${ctxStatic}/plugins/layui/css/layui.css" rel="stylesheet" media="all" />
	<link href="${ctxStatic}/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" media="all" />
	<link href="${ctxStatic}/wxl/css/wxl.css" rel="stylesheet" media="all" />
    <script src="${ctxStatic}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/plugins/layui/layui.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/utils/wxl.js" type="text/javascript"></script>
	<script type="text/javascript">
		var ctx = '${ctx}', cp = '${cp}', ctxf = '${ctxf}', ctxStatic = '${ctxStatic}';
	</script>
	<sitemesh:head />
</head>
<body>
	<sitemesh:body />
		<input type="hidden" id="st_sys_data_false" value="否">
		<input type="hidden" id="st_sys_data_true" value="<span class='error'>是</span>">

		<input type="hidden" id="st_status_0" value="正常">
		<input type="hidden" id="st_status_1" value="<span class='error'>禁用</span>">
</body>
</html>