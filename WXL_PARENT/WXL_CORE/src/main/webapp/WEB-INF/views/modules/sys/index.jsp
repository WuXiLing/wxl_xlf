<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>管理控制台</title>
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
	<link rel="icon" href="${ctxStatic}/images/favicon/16/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon/16/favicon.ico" type="image/x-icon" />
	
	<link href="${ctxStatic}/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" media="all" />
	<link href="${ctxStatic}/plugins/layui/css/layui.css" rel="stylesheet" media="all" />
	<link href="${ctxStatic}/wxl/modules/index/index.css" rel="stylesheet" media="all" />
	<script type="text/javascript">
	    var ctx = '${ctx}', cp = '${cp}', ctxf = '${ctxf}', ctxStatic = '${ctxStatic}';
	</script>	
</head>
<body class="main_body">
	<c:set var="user" value="${fns:getUser()}"/>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main mag0">
				<a href="${ctx}/sys/home/list" class="logo">管理控制台</a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="hideMenu icon-caidan"><i class="fa fa-align-justify" aria-hidden="true"></i></a>
				<!-- 顶级菜单 -->
				<ul class="layui-nav mobileTopLevelMenus" mobile>
					<li class="layui-nav-item" data-menu="contentManagement">
						<a href="javascript:;"><i class="seraph icon-caidan"></i><cite>${user.name}</cite></a>
						<dl class="layui-nav-child">
							<!-- <dd data-menu="2" class="layui-this" ><a href="javascript:;"><i class="fa fa-gear"></i><cite>系统设置</cite></a></dd>
							<dd data-menu="2"><a href="javascript:;"><i class="fa fa-user"></i><cite>用户中心</cite></a></dd>
							<dd data-menu="2"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>产品和服务</cite></a></dd>
							<dd data-menu="51e1e81ad3224da9bc11908be20cda32"><a href="javascript:;"><i class="fa fa-book"></i><cite>使用文档</cite></a></dd>
							<dd data-menu="24"><a href="javascript:;"><i class="fa fa-home"></i><cite>网站首页</cite></a></dd> -->
							<c:set var="i" value="0"/>
							<c:forEach items="${fns:getMenuList()}" var="menu">
							   <c:if test="${menu.parent.id eq '1'}">
									<dd data-menu="${menu.id}" class="<c:if test='${i == 0}'>layui-this</c:if>"><a href="javascript:;">${menu.icon}<cite>${menu.name}</cite></a></dd>
									<c:set var="i" value="${i + 1}"/>
							   </c:if>
						    </c:forEach>
						    
						</dl>
					</li>
				</ul>
				<ul class="layui-nav topLevelMenus" pc>
					<!-- <li class="layui-nav-item  layui-this" data-menu="2" pc>
						<a href="javascript:;"><i class="fa fa-gear"></i><cite>系统设置</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="2" pc>
						<a href="javascript:;"><i class="fa fa-user"></i><cite>用户中心</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="2">
						<a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>产品和服务</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="51e1e81ad3224da9bc11908be20cda32" pc>
						<a href="javascript:;"><i class="fa fa-book"></i><cite>使用文档</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="24" pc>
						<a href="javascript:;"><i class="fa fa-home"></i><cite>网站首页</cite></a>
					</li> -->
                    <c:set var="i" value="0"/>
					<c:forEach items="${fns:getMenuList()}" var="menu">
						<c:if test="${menu.parent.id eq '1'}">
							<li class="layui-nav-item <c:if test='${i == 0}'>layui-this</c:if>" data-menu="${menu.id}" pc>
								<a href="javascript:;">${menu.icon}<cite>${menu.name}</cite></a>
							</li>
							<c:set var="i" value="${i + 1}"/>
						</c:if>
					</c:forEach>
					<li class="layui-nav-item" data-menu="-1" pc>
					    <a href="${ctxf}/cms/front/first" target="_blank"><i class="fa fa-fa-rocket"></i><cite>网站首页</cite></a>
					</li>
				</ul>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="fa fa-arrows" aria-hidden="true"></i><cite>全屏</cite></a>
					</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="fa fa-lock" aria-hidden="true"></i><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item" pc>
						<a href="javascript:;" class="clearCache"><i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;">
							<c:if test="${empty user.photo}">
                                <img src="${ctxStatic}/wxl/modules/index/images/userface1.jpg" class="layui-nav-img userAvatar" width="35" height="35"/>
							</c:if>
							<c:if test="${not empty user.photo}">
								<img src="${ctx}/sys/storge/showImage/admin/user/${user.photo}" class="layui-nav-img userAvatar" width="35" height="35"/>
							</c:if>
							<cite class="adminName">${user.name}</cite>
						</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" id="user-info" data-id="${user.id}"><i class="fa fa-user-o" aria-hidden="true"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" id="user-login-history" data-id="${user.id}"><i class="fa fa-align-justify" aria-hidden="true"></i><cite>登录历史</cite></a></dd>
							<dd><a href="javascript:;" id="userPwd" data-id="${user.id}"><i class="fa fa-unlock-alt" aria-hidden="true"></i><cite>修改密码</cite></a></dd>
							<dd><a href="javascript:;" class="showNotice"><i class="fa fa-bell-o" aria-hidden="true"></i><cite>系统公告</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="functionSetting"><i class="fa fa-cogs" aria-hidden="true"></i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
							<dd><a href="${ctx}/logout" class="signOut"><i class="fa fa-power-off" aria-hidden="true"></i><cite>退出登录</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<%-- <div class="user-photo">
				<a class="img" title="我的头像" ><img src="${ctxStatic}/layui/cms/images/userface3.jpg" class="userAvatar"></a>
				<p>你好！<span class="userName">巫溪灵</span>, 欢迎登录</p>
			</div> --%>
			<!-- 搜索 -->
			<div class="layui-form component">
				<select name="search" id="search" lay-search lay-filter="searchPage">
					<option value="">搜索页面或功能</option>
					<option value="1">layer</option>
					<option value="2">form</option>
				</select>
				<i class="layui-icon">&#xe615;</i>
			</div>
			<div class="navBar layui-side-scroll" id="navBar">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-this">
						<a href="javascript:;" data-url="${ctx}/sys/home/list"><i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="fa fa-refresh" aria-hidden="true"></i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="fa fa-times" aria-hidden="true"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="fa fa-times-circle" aria-hidden="true"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="${ctx}/sys/home/list" style="width: 100%;" frameborder="0" class="layadmin-iframe"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p><span>copyright @2018 巫溪灵</span>　　<!-- <a onclick="donation()" class="layui-btn layui-btn-danger layui-btn-sm">捐赠作者</a> --></p>
		</div>
	</div>

	<!-- 移动导航 -->
	<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>
	<script src="${ctxStatic}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/utils/date.js"></script>
	<script type="text/javascript" src="${ctxStatic}/plugins/layui/layui.all.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/index/index.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/index/cache.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/index/user.js"></script>
</body>
</html>