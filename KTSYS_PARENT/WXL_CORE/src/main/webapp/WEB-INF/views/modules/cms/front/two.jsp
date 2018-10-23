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
		<jsp:include page="logo.jsp" />
	<div class="layui-fluid">
		<jsp:include page="nav.jsp" />
		<div class="layui-row">
		    <div class="layui-col-md12">
		        <div class="crumb">
			        <i class="fa fa-home"></i>&nbsp;&nbsp;当前位置：<a href='${ctxf}/cms/front/first' target="_blank">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='${ctxf}/cms/front/senond/${columns.id}' target="_blank">${columns.name}</a>
		        </div>
		    </div>
		</div>
		<div class="layui-row">
		    <div class="layui-col-md2" id="left_nav">
		         <div class="layui-card">
			          <div class="layui-card-body">
			              <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="component-nav-active" style="margin-right: 10px;">
			                 <c:forEach items="${columnsList}" var="e" varStatus="s">
				                 <li class="layui-nav-item" onclick="initTable('${e.id}');">
				                    <a href="javascript:;" data-id="${e.id}">${e.name}</a>
				                 </li>
			                 </c:forEach>
			              </ul>
			          </div>
			     </div>
		    </div>
		    <div class="layui-col-md10"  id="right_nav">
		        <div class="layui-card">
					<div class="layui-card-body">
					    <div class="layui-tab layui-tab-brief cms_tztg">
							<ul class="layui-tab-title">
								<li class="layui-this"><h2>${columns.name}</h2></li>
							</ul>
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show " id="cms_tztg_nr">
									<table class="layui-hide" id="news-table-operate" lay-filter="news-table-operate"></table>
								</div>
								<div id="cms_kyrs">
									
								</div>
							</div>
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
	<jsp:include page="bottom.jsp" />
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script type="text/javascript">
		layui.use([ 'table' ], function() {
			var $ = layui.$, element = layui.element;
			var table = layui.table;
			var type= $("#type").val();
			var initTable = function(id){
				table.render({
					elem : '#news-table-operate',
					url : ctxf + '/cms/front/selectLayuiPageList',
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
						width : 1030,
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
			
			if(type == "502fa94eb9b64516aaff1f254e71654f"){//栏目
				$("#left_nav").find("li").first().click();
			} else if(type == "0e0acb903a374b7e94aff42917a475af"){//列表
				$("#left_nav").hide();
			    $("#right_nav").removeClass("layui-col-md10").addClass("layui-col-md12");
				if("${columns.name}" == "科研人员"){
					$("#cms_tztg_nr").hide();
					$.get(ctxf + "/cms/front/getArticleListByColumnsId/${columns.id}/1000",{},function(data){
						if(data && data.articleList && data.articleList.length > 0){
							var cms_kyrs = $("#cms_kyrs");
							var cms_kyrs_str = "";
							$.each(data.articleList,function(i,e){
							    if(i == 0 || (i  > 1 && i % 6 == 1)){
							    	cms_kyrs_str.append("<div class='layui-row layui-col-space30'>");
							    }
							    cms_kyrs_str.append("<div class='layui-col-md2 layui-col-sm4'>");
							    cms_kyrs_str.append("    <div class='cmdlist-container'>");
							    cms_kyrs_str.append("        <a href='javascript:;'>");
							    cms_kyrs_str.append("           <img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "'>");
							    cms_kyrs_str.append("        </a>");
							    cms_kyrs_str.append("        <a href='" + ctxf + "/cms/front/three/" + d.id + "' target='_blank'>");
							    cms_kyrs_str.append("            <div class='cmdlist-text'>");
							    cms_kyrs_str.append("               <p class='info'>" + e.title + "</p>");
							    cms_kyrs_str.append("            </div>");
							    cms_kyrs_str.append("        </a>");
							    cms_kyrs_str.append("     </div>");
							    cms_kyrs_str.append("</div>");
							    if(i == (data.articleList-1) || (i > 1 && i % 6 == 0)){
							    	 cms_kyrs_str.append("</div>");	
							    }
							});
							cms_kyrs.append(cms_kyrs_str);
						}
					});
				} else {
					$("#cms_kyrs").hide();
					initTable('${columns.id}');
				}
			} else if(type == "389e1a7f28ef4500bb68d9dba14207d4"){//内容
				
			}
			
			
		});
			
		
	</script>
</body>
</html>