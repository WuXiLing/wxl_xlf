<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>陕西空天飞行器设计技术重点实验室</title>
<meta name="decorator" content="layui" />
<link href="${ctxStatic}/wxl/css/cms.css" rel="stylesheet" media="all" />
</head>
<body>
    <input id="type" value="${columns.type}" type="hidden">
	<input id="id" value="${columns.id}" type="hidden">
	<div class="layui-fluid">
		<jsp:include page="logo.jsp" />
		<jsp:include page="nav.jsp" />
		<div class="layui-row">
		    <div class="layui-col-md12">
		        <div class="crumb">
		            <c:if test="${columns.type eq '389e1a7f28ef4500bb68d9dba14207d4'}">
			            <i class="fa fa-home"></i>&nbsp;&nbsp;当前位置：<a href='${ctxf}/cms/front/first' target="_blank">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='${ctxf}/cms/front/columnsThree/${columns.id}' style="color: #5886e8;" target="_blank">${columns.name}</a>
		            </c:if>
		             <c:if test="${columns.type ne '389e1a7f28ef4500bb68d9dba14207d4'}">
			            <i class="fa fa-home"></i>&nbsp;&nbsp;当前位置：<a href='${ctxf}/cms/front/first' target="_blank">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='${ctxf}/cms/front/senond/${columns.id}' style="color: #5886e8;" target="_blank">${columns.name}</a>
		            </c:if>
		        </div>
		    </div>
		</div>
		
		<c:if test="${not empty msg and msg eq '10001'}">
		    <div class="layui-row cms_content_msg">
		    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
		         请维护栏目<span style="color: red"> 【${columns.name}】</span>文章信息。
		    </div>
		</div>
		</c:if>
		<c:if test="${not empty article}">
		<div class="layui-row cms_content_title">
		    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
		         <span><c:out value="${article.title}"></c:out></span>
		    </div>
		</div>
		<div class="layui-row cms_content_info">
		    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
		          <span><fmt:formatDate value="${article.releaseDate}" type="date"/></span>
		          
		          <span>来源：<c:out value="${article.source}"></c:out></span>
		         <%--  <span>点击数：<c:out value="${article.hits}"></c:out></span> --%>
		          <span>字体：【<a href="javascript:" onclick="changeFontSize(18)">大</a>  <a href="javascript:" onclick="changeFontSize(16)">中</a>  <a href="javascript:" onclick="changeFontSize(14)">小</a>】</span>
		    </div>
		</div>
		<div class="layui-row cms_content_txt">
		     <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
		        ${article.content}
		     </div>
		</div>
		</c:if>
		<jsp:include page="bottom.jsp" />
		<input id="type" value="${columns.type}" type="hidden">
	</div>
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script type="text/javascript">
		layui.use([ 'table' ], function() {
			var $ = layui.$, element = layui.element;
			var table = layui.table;
			var type= $("#type").val();
			
			$.get(ctxf + "/cms/front/article/${id}",function(res){
				var article = res.article;
				var columns = res.columns;
			});
		});
		function changeFontSize(size){
			$(".cms_content_txt").css("font-size",size);
		}
	</script>
</body>
</html>