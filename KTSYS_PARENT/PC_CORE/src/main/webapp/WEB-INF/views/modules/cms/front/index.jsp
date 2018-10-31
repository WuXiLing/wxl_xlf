<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<title>西安鹏创信息科技有限公司</title>
		<meta name="decorator" content="layui" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/wxl/modules/cms/front/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/wxl/modules/cms/front/css/style.css" />
		
	</head>

	<body>
		<!--顶部-->
		<div class="nav_top">
			<div class="nav_top_in">
				<p>鹏创信息科技 欢迎您！！！</p>
				<ul>
					<li>
						<a href="javascript:void(0)" onclick="SetHome(this,window.location)">设为首页</a>
					</li>
					<li class="wx">
						<a>微信关注</a>
						<img src="${ctxStatic}/wxl/modules/cms/front/img/wx.jpg" />
					</li>
					<li>
						<a href="${ctxf}/columnsThree/b7fab07a1f5f4714b77f0efe8e215d5f">联系我们</a>
					</li>
				</ul>
			</div>
		</div>
		<!--logo-->
		<jsp:include page="logo.jsp" />
		<!--导航-->
		<jsp:include page="nav.jsp" />
		<!--banner-->
		<div id="slideBox" class="slideBox">
			<div class="hd">
				<ul>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="bd">
				<ul>
					<li>
						<a href=" "><img src="${ctxStatic}/wxl/modules/cms/front/img/banner1.jpg" /></a>
					</li>
					<li>
						<a href=" "><img src="${ctxStatic}/wxl/modules/cms/front/img/banner1.jpg" /></a>
					</li>
				</ul>
			</div>
			<!--前/后按钮-->
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>
		</div>
		<!--企业文化-->
		<div class="index_1">
			<dl id="gsjs">
				<a href=""><img src="${ctxStatic}/wxl/modules/cms/front/img/wh_3.jpg" /></a>
				<dt>公司介绍</dt>
				<dd></dd>
			</dl>
			<dl id="qywh">
				<a href=""><img src="${ctxStatic}/wxl/modules/cms/front/img/wh_1.jpg" /></a>
				<dt>企业文化</dt>
				<dd></dd>
			</dl>
			<dl id="gsqh">
				<a href=""><img src="${ctxStatic}/wxl/modules/cms/front/img/wh_2.jpg" /></a>
				<dt>公司情怀</dt>
				<dd></dd>
			</dl>
		</div>
		
		<!--业务内容-->
		<div class="index_3">
			<dl class="tit">
				<dt>业务内容</dt>
				<dd>business</dd>
			</dl>
			<div class="index_3_in">
				<a href="">
					<dl id="znjg">
						<dt><img src="${ctxStatic}/wxl/modules/cms/front/img/yw_1.png"/></dt>
						<dd>
							<h2>智能井盖监控云平台</h2>
							<span>Smart covers</span>
							<p></p>
						</dd>
					</dl>
				</a>
				<a href="">
					<dl id="cxjqr">
						<dt><img src="${ctxStatic}/wxl/modules/cms/front/img/yw_2.png"/></dt>
						<dd>
							<h2>管道成像机器人</h2>
							<span>Pipeline imaging robot</span>
							<p></p>
						</dd>
					</dl>
				</a>
				<a href="">
					<dl id="znsjfx">
						<dt><img src="${ctxStatic}/wxl/modules/cms/front/img/yw_3.png"/></dt>
						<dd>
							<h2>智能数据分析平台</h2>
							<span>Intelligent data analysis platform</span>
							<p></p>
						</dd>
					</dl>
				</a>
			</div>
		</div>
		<!--新闻中心-->
		<div class="index_4">
			<dl class="tit">
				<dt>资讯中心</dt>
				<dd>News Center</dd>
			</dl>
			<div class="outBox">
				<div class="hd">
					<ul>
						<li>公司新闻</li>
						<li>行业资讯</li>
					</ul>
				</div>
				<div class="bd">
					<div class="inBox" id="news">
						<div class="inHd">
							<ul></ul>
						</div>
						<div class="inBd"></div>
					</div>
					<div class="inBox" id="message">
						<div class="inHd">
							<ul></ul>
						</div>
						<div class="inBd"></div>
					</div>
				</div>
			</div>
		</div>
		<!--关于我们-->
		<div class="index_2_bj">
			<div class="index_2">
				<dl class="tit">
					<dt>关于鹏创信息科技</dt>
					<dd>ABOUT US</dd>
				</dl>
				<h3>为客户提供最优质的整体解决方案</h3>
				<p id="about_text"><a class="more1" href="${ctxf}/columnsThree/9cbc7544c1574f42850223f13406bc17">【了解更多】</a>
				</p>
				<ul>
					<li><img src="${ctxStatic}/wxl/modules/cms/front/img/gy_1.jpg" /></li>
					<li><img src="${ctxStatic}/wxl/modules/cms/front/img/gy_2.jpg" /></li>
					<li><img src="${ctxStatic}/wxl/modules/cms/front/img/gy_3.jpg" /></li>
				</ul>
			</div>
		</div>
		<!--底部-->
		<!-- <a class="top" href="#logo">返回顶部</a> -->
		<jsp:include page="bottom.jsp"/>
		<script src="${ctxStatic}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ctxStatic}/wxl/modules/cms/front/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ctxStatic}/wxl/modules/cms/front/js/sc.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
		<script src="${ctxStatic}/wxl/modules/cms/front/index.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				//banner
				jQuery(".slideBox").slide({
					mainCell: ".bd ul",
					effect: "leftLoop",
					autoPlay: true,
				});
			});
		</script>
	</body>

</html>