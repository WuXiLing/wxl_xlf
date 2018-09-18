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
							<ul class="layui-tab-title">
								<li class="layui-this"><h2>新闻动态</h2></li>
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
							<ul class="layui-tab-title">
								<li class="layui-this"><h2>通知通告</h2></li>
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
						<ul class="layui-tab-title">
							<li class="layui-this"><h2>学术研究</h2></li>
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
	<script>
		layui.use(['table','carousel'], function() {
			var $ = layui.$, element = layui.element;
			var carousel = layui.carousel;
			var table = layui.table;
			
			//常规轮播
		    /* carousel.render({
		      elem: '#logo-carousel-normal'
		      ,arrow: 'always'
		    }); */
		    
		    
			table.render({
				elem : '#news-table-operate',
				url : ctxf + '/cms/front/selectLayuiPageList',
				//height : 'full-70',
				where : {
					key : {
						
						"status" : 1,
						"columnsId" : '4e04bedf842d40ddaba5794bb5985928'
					}
				},
				cols : [ [ {
					field : 'title',
					title : '标题',
					align : 'left',
					width : 340,
					templet : function(d){
						return "&nbsp;&nbsp;&nbsp;&nbsp;<span>▶</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + ctxf + "/cms/front/three/" + d.id + "' target='_blank'>" + d.title +"</a>";
					}
				}, {
					field : 'releaseDate',
					title : '发布时间',
					align : 'center',
					width : '100px',
					templet : function(d){
						if(d.releaseDate){
							var date = new Date(d.releaseDate);
							return date.Format("yyyy-MM-dd");
						}
						return '';
					}
				}] ],
				page : false,
				limit: 8,
				done : function(res, curr, count){
					$(".layui-table-header").hide();
				},
				skin : 'nob'
			});
			
			//newsPhoto
			$.get(ctxf + "/cms/front/getImageListByColumnsId/4e04bedf842d40ddaba5794bb5985928/5",{},function(data){
				if(data && data.articleList && data.articleList.length > 0){
					var cms_news_photo = $("#cms_news_photo");
					$.each(data.articleList,function(i,e){
					    cms_news_photo.append("<div><img src='${ctxf}/sys/storge/showImage/cms/article/" + e.image + "'></div>");
					});
					carousel.render({
				      elem: '#news-carousel-normal'
				      ,arrow: 'always'
				    }); 
				}
			});
			//logoPhoto
			$.get(ctxf + "/cms/front/getImageListByColumnsId/f7b3dc3ab4e94274b8053d95da0aaf95/6",{},function(data){
				if(data && data.articleList && data.articleList.length > 0){
					var cms_logo_carousel = $("#cms_logo_carousel");
					$.each(data.articleList,function(i,e){
						cms_logo_carousel.append("<div><img src='${ctxf}/sys/storge/showImage/cms/article/" + e.image + "'></div>");
					});
					carousel.render({
				      elem: '#logo-carousel-normal'
				      ,arrow: 'always'
				    }); 
				}
			});
			
			//nav
			$.get(ctxf + "/cms/front/getFirstNavColumns",{},function(data){
				if(data && data.columnsList && data.columnsList.length > 0){
					var cms_nav_menu = $("#cms_nav_menu");
					console.info(data.columnsList);
					$.each(data.columnsList,function(i,e){
						var str = [];
						str.push("<li class='layui-nav-item'>");
						var target = e.target || "_blank";
						if(e.type == "389e1a7f28ef4500bb68d9dba14207d4"){//three page
							str.push("<a href='" + ctxf + "/cms/front/columnsThree/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
						} else if(e.type == "502fa94eb9b64516aaff1f254e71654f"){//coolumns
							str.push("<a href='" + ctxf + "/cms/front/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
						} else if(e.type == "0e0acb903a374b7e94aff42917a475af"){//list
							str.push("<a href='" + ctxf + "/cms/front/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
						}
						if(e.childrens && e.childrens.length > 0){
							str.push("<dl class='layui-nav-child'>");
							$.each(e.childrens,function(k,el){
								if(el.target == "_blank"){
							        str.push("<a href='" + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
								} else if(e.target == "_top") {
									 str.push("<a href='" + ctxf + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
								} else {
									var target = el.target || "_blank";
									if(el.type == "389e1a7f28ef4500bb68d9dba14207d4"){//three page
										str.push("<a href='" + ctxf + "/cms/front/columnsThree/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
									} else if(el.type == "502fa94eb9b64516aaff1f254e71654f"){//coolumns
										str.push("<a href='" + ctxf + "/cms/front/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
									} else if(el.type == "0e0acb903a374b7e94aff42917a475af"){//list
										str.push("<a href='" + ctxf + "/cms/front/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
									}
								}
							});
							str.push("</dl>");
						}
						str.push("</li>");
						cms_nav_menu.append(str.join(""));
					});
					element.render('nav', 'component-nav');
					element.render('nav', 'component-nav-active');

					element.on('nav(component-nav-active)', function(elem) {
						layer.msg(elem.text());
					});
				}
			});
		});
		
		$(function(){
			
			//Academic
			$.get(ctxf + "/cms/front/getImageListByColumnsId/87ad7806570346b58f1405557f7248ee/4",{},function(data){
				if(data && data.articleList && data.articleList.length > 0){
					var cms_xsyj_iamge = $("#cms_xsyj_image");
					var cms_xsyj_title = $("#cms_xsyj_title");
					var cms_xsyj_content = $("#cms_xsyj_content");
					$.each(data.articleList,function(i,e){
						cms_xsyj_iamge.append("<div class='layui-col-md3'><img src='${ctxf}/sys/storge/showImage/cms/article/" + e.image + "'></div>");
						cms_xsyj_title.append("<div class='layui-col-md3 cms_xsyj_title'><span class='symbol'>■</span><a href='" + ctxf + "/cms/front/three/" + e.id + "' target='_blank'>" + e.title + "</a></div>");
						cms_xsyj_content.append("<div class='layui-col-md3'><blockquote class='layui-elem-quote layui-quote-nm'>" + autoAddEllipsis(e.content,20*4) + "</blockquote></div>");
					});
				}
			});
			
			//notice
			$.get(ctxf + "/cms/front/getImageListByColumnsId/06bcb807af8b4b409b4b3d0f8aaeaf32/3",{},function(data){
				if(data && data.articleList && data.articleList.length > 0){
					var cms_tztg_nr = $("#cms_tztg_nr");
					$.each(data.articleList,function(i,e){
						var releaseDate = new Date(e.releaseDate);
						var str = [];
						str.push("<div class='layui-row " + (i==0 ? "active" : "") + "'>");
						str.push("   <div class='layui-col-md3 cms_tztg_sj'>");
						str.push("       <div class='layui-row'><div class='layui-col-md12'><h1>" + releaseDate.getDate() + "</h1></div></div>");
						str.push("       <div class='layui-row'><div class='layui-col-md12'>" + (releaseDate.getMonth() + 1) + "月</div></div>");
						str.push("   </div>");
						str.push("   <div class='layui-col-md9 cms_tztg_js'>");
						str.push("       <div class='layui-row'><div class='layui-col-md12'><a class='" + (i==0 ? "active" : "") + "' href='" + ctxf + "/cms/front/three/" + e.id + "' target='_blank'><h3>" + e.title + "</h3></a></div></div>");
						str.push("       <div class='layui-row'><div class='layui-col-md12'><h4>" + autoAddEllipsis(e.content,19) + "</h4></div></div>");
						str.push("   </div>");
						str.push("</div>");
						cms_tztg_nr.append(str.join(""));
					});
				}
			});
		});
	</script>
</body>
</html>