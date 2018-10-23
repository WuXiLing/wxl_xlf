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
	<div class="layui-fluid">
		<jsp:include page="logo.jsp" />
		<jsp:include page="nav.jsp" />
		<div class="layui-row">
			<!-- slider -->
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body">
						<div class="layui-carousel" id="logo-carousel-normal" lay-filter="logo-carousel-normal">
							<div carousel-item="" id="cms_logo_carousel"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<!-- news -->
			<div class="layui-col-md8">
				<div class="layui-card">
					<div class="layui-card-body">
						<div class="layui-tab layui-tab-brief">
							<ul class="layui-tab-title" id="news_title">
								<li class="layui-this"><h2>新闻动态</h2></li>
								<li id="news_more"><a href="#" target="_blank">更多&nbsp;<i class="layui-icon layui-icon-next" style="font-size: 12px;"></i></a></li>
							</ul>
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show">
									<div class="layui-row">
										<!-- photos -->
										<div class="layui-col-md6">
										    <div class="layui-row">
											    <div class="layui-card">
													<div class="layui-card-body">
														<div class="layui-carousel" id="news-carousel-normal" lay-filter="news-carousel-normal">
															<div carousel-item="" id="cms_news_photo"></div>
														</div>
													</div>
												</div>
										    </div>
										</div>
										<!-- news -->
										<div class="layui-col-md6">
										       <div class="layui-row">
											       <div class="layui-card">
												        <div class="layui-card-body">
														      <table class="layui-hide" id="news-table-operate" lay-filter="news-table-operate"></table>
												        </div>
												   </div>
										       </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- notice -->
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-body">
						<div class="layui-tab layui-tab-brief cms_tztg">
							<ul class="layui-tab-title" id="notice_title">
								<li class="layui-this"><h2>通知通告</h2></li>
								<li id="notice_more"><a href="#" target="_blank">更多&nbsp;<i class="layui-icon layui-icon-next" style="font-size: 12px;"></i></a></li>
							</ul>
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show " id="cms_tztg_nr"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
		    <div class="layui-card">
				<div class="layui-card-body">
					<div class="layui-tab layui-tab-brief">
						<ul class="layui-tab-title" id="academic_title">
							<li class="layui-this"><h2>学术研究</h2></li>
							<li id="academic_more"><a href="#" target="_blank">更多&nbsp;<i class="layui-icon layui-icon-next" style="font-size: 12px;"></i></a></li>
						</ul>
						<div class="layui-tab-content cms_xsyj">
							<div class="layui-tab-item layui-show">
							    <!-- Academic -->
							     <div class="layui-row layui-col-space15" id="cms_xsyj_image"></div>
							     <div class="layui-row layui-col-space15" id="cms_xsyj_title"></div>
							     <div class="layui-row layui-col-space15" id="cms_xsyj_content"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="bottom.jsp" />
	</div>
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script src="${ctxStatic}/wxl/modules/cms/front/index.js" type="text/javascript"></script>
</body>
</html>