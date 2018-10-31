<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>西安鹏创信息科技有限公司</title>
    <meta name="decorator" content="layui" />
    <link href="${ctxStatic}/wxl/css/cms.css" rel="stylesheet" media="all" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/wxl/modules/cms/front/css/index.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/wxl/modules/cms/front/css/style.css" />
	<script src="${ctxStatic}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/wxl/modules/cms/front/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/wxl/modules/cms/front/js/sc.js" type="text/javascript" charset="utf-8"></script>
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
			        <i class="fa fa-home"></i>&nbsp;&nbsp;当前位置：<a href='${ctxf}'>首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='${ctxf}/senond/${columns.id}' target="_blank">${columns.name}</a>
		        </div>
		    </div>
		</div>
		<div class="layui-row">
		    <div class="layui-col-md2" id="left_nav">
		         <div class="layui-card">
			          <div class="layui-card-body">
			              <ul class="layui-nav layui-nav-tree layui-inline ktsys-two-nav" lay-filter="component-nav-ktsys-two" style="margin-right: 10px;">
			                 <c:forEach items="${columnsList}" var="e" varStatus="s">
				                 <li class="layui-nav-item" data-id="${e.id}" data-type="${e.type}" data-name="${e.name}">
				                    <a href="javascript:;" data-id="${e.id}" data-type="${e.type}" data-name="${e.name}">${e.name}</a>
				                 </li>
			                 </c:forEach>
			              </ul>
			          </div>
			     </div>
		    </div>
		    <div class="layui-col-md10" id="right_nav">
		        <div class="layui-card">
					<div class="layui-card-body">
					    <div class="layui-tab layui-tab-brief cms_tztg">
							<ul class="layui-tab-title">
								<li class="layui-this" id="columns_title"><h2>${columns.name}</h2></li>
							</ul>
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show " id="cms_tztg_nr">
									<table class="layui-hide" id="news-table-operate" lay-filter="news-table-operate"></table>
								</div>
								<div id="cms_kyrs"></div>
							</div>
						</div>
					</div>
				</div>
		    </div>
		    <div class="layui-col-md10"  id="right_nav_article">
		          <div class="layui-row cms_content_title">
					    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					         <span id="article_title"></span>
					    </div>
					</div>
					<div class="layui-row cms_content_info">
					    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					          <span id="article_releaseDate"></span>
					          <span id="article_source"></span>
					          <span>字体：【<a href="javascript:" onclick="changeFontSize(18)">大</a>  <a href="javascript:" onclick="changeFontSize(16)">中</a>  <a href="javascript:" onclick="changeFontSize(14)">小</a>】</span>
					    </div>
					</div>
					<div class="layui-row cms_content_txt">
					     <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" id="article_content"></div>
					</div>
		     </div>
		</div>
		<jsp:include page="bottom.jsp" />
	</div>
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script type="text/javascript">
		layui.use([ 'table' ], function() {
			var $ = layui.$, element = layui.element;
			var table = layui.table;
			var type= $("#type").val();
			
			$("#right_nav_article").hide();
		    element.render('nav', 'component-nav-ktsys-two');
		    element.on('nav(component-nav-ktsys-two)', function(elem){
			      var ele = elem[0];
			      $("#columns_title").html("<h2>" + $(ele).data("name")+ "</h2>");
			      initTable(table,$(ele).data("id"),$(ele).data("type"));
		    });
			
			if(type == "502fa94eb9b64516aaff1f254e71654f"){//栏目
			
				 var first_li = $("#left_nav").find("li").first();
				 $("#columns_title").html("<h2>" + $(first_li).data("name")+ "</h2>");
				 initTable(table,$(first_li).data("id"),$(first_li).data("type"));
				
			} else if(type == "0e0acb903a374b7e94aff42917a475af"){//列表
				$("#left_nav").hide();
			    $("#right_nav").removeClass("layui-col-md10").addClass("layui-col-md12");
				$("#cms_kyrs").hide();
				initTable('${columns.id}',type);
			} else if(type == "389e1a7f28ef4500bb68d9dba14207d4"){//内容
				
			}
		});
		
		function initTable(table,id,type){
			var width = 1030;
            var columnsType= $("#type").val();
            //栏目
			if(columnsType == "502fa94eb9b64516aaff1f254e71654f"){
				width = 830;
			}
            //内容
            if(type == "389e1a7f28ef4500bb68d9dba14207d4"){
            	$("#right_nav").hide();
            	$.get(ctxf + "/getArticleListByColumnsId/" + id + "/10",function(res){
            		$("#right_nav_article").show();
            		var articleList = res.articleList;
            		if(articleList && articleList.length>0){
            			var article = articleList[0];
	            		$("#article_title").text(article.title);
	            		$("#article_title").css({ "color": article.color ? article.color : "#f51c40"});
            	
	            		$("#article_releaseDate").text(article.releaseDate.substr(0,10));
	            		$("#article_source").text("来源：" + article.source);
	            		$("#article_content").html(article.content);
            		} else {
            			alert("请先维护内容。");
            		}
    			});
            } 
            //列表
            else if(type == "0e0acb903a374b7e94aff42917a475af"){
            	$("#right_nav_article").hide();
            	$("#right_nav").show();
				table.render({
					elem : '#news-table-operate',
					url : ctxf + '/selectLayuiPageList',
					height : 600,
					where : {
						key : {
							"columnsId" : id,
							"status" : 1,
							"frontQuery" : "y"
						}
					},
					cellMinWidth : 80,
					cols : [ [ {
						field : 'title',
						title : '标题',
						align : 'left',
						width : width,
						templet : function(d){
							return "&nbsp;&nbsp;&nbsp;&nbsp;<span>▶</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + ctxf + "/cms/front/three/" + d.id + "' target='_blank'>" + d.title +"</a>";
						}
					}, {
						field : 'releaseDate',
						title : '发布时间',
						align : 'center',
						width : '200px',
						templet : function(d) {
							if (d.releaseDate) {
								var date = new Date(d.releaseDate);
								return date.Format("yyyy-MM-dd hh:mm");
							}
							return '';
						}
					} ] ],
					page : true,
					done : function(res, curr, count) {
						$(".layui-table-header").hide();
					},
					skin : 'nob'
				});
            }
		}
		
		function changeFontSize(size){
			$(".cms_content_txt").css("font-size",size);
		}
	</script>
</body>
</html>