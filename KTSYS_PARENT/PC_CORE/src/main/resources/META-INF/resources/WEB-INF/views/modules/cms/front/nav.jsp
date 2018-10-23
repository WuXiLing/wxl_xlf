<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/webjars/static" />
<div class="nav_bj">
	<div class="nav">
		<ul></ul>
		<div class="search">
			<input type="text" class="sea" name="" id="" value="请输入关键字" onfocus="if(this.value==this.defaultValue){this.value='';};" onblur="if(this.value==''){this.value=this.defaultValue;}" />
			<input type="submit" class="but" name="" id="" value="" />
		</div>
	</div>
</div>
		
<script src="${ctxStatic}/wxl/modules/cms/front/nav.js" type="text/javascript"></script>