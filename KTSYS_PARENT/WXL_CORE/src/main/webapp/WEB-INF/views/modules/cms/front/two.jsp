<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>陕西空天飞行器设计技术重点实验室</title>
<meta name="decorator" content="layui" />
<link href="${ctxStatic}/wxl/css/cms.css" rel="stylesheet" media="all" />
<style type="text/css">
    .ktsys-two-nav .layui-nav-item a:hover {
	  background-color: #01439A;
	  color:#FFFFFF;
     }
     
     .ktsys-two-nav {
		background-color: #2267B1;
	}
	#right_nav_article{
	    padding-left:30px;
	    padding-right:30px;
	}
	.cmdlist-container img{
	  height:240px;
	  width:180px;
	}
	
	.cmdlist-container a{
	   font-size:18px;
	 }
</style>
</head>
<body>
    <input id="type" value="${columns.type}" type="hidden">
	<input id="id" value="${columns.id}" type="hidden">
		<jsp:include page="logo.jsp" />
	<div class="layui-fluid">
		<jsp:include page="nav.jsp" />
		<%-- <div class="layui-row">
		    <div class="layui-col-md12">
		        <div class="crumb">
			        <i class="fa fa-home"></i>&nbsp;&nbsp;当前位置：<a href='${ctxf}/cms/front/first' target="_blank">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='${ctxf}/cms/front/senond/${columns.id}' target="_blank">${columns.name}</a>
		        </div>
		    </div>
		</div> --%>
		<div class="layui-row">
		    <div class="layui-col-md12" id="left_nav">
		         <div class="layui-card">
			          <div class="layui-card-body">
			              <div class="layui-tab" lay-filter="component-tab-ktsys-two">
				              <ul class="layui-tab-title">
				                 <c:forEach items="${columnsList}" var="e" varStatus="s">
				                     <li class=" ${s.index eq 0 ? 'layui-this' : '' }" data-id="${e.id}" data-type="${e.type}" data-name="${e.name}">
				                        <a href="javascript:;" data-id="${e.id}" data-type="${e.type}"  data-name="${e.name}">${e.name}</a>
				                     </li>
				                 </c:forEach>
				              </ul>
				            </div>
			          </div>
			     </div>
		    </div>
		    <div class="layui-col-md12"  id="right_nav">
		        <div class="layui-card">
					<div class="layui-card-body">
					    <div class="layui-tab layui-tab-brief cms_tztg_ktsys">
							<%-- <ul class="layui-tab-title">
								<li class="layui-this" id="columns_title"><h2>${columns.name}</h2></li>
							</ul> --%>
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
		     <div class="layui-col-md12"  id="right_nav_article">
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
	</div>
	<jsp:include page="bottom.jsp" />
	<script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript"></script>
	<script type="text/javascript">
		layui.use([ 'table' ], function() {
			var $ = layui.$, element = layui.element;
			var table = layui.table;
			var type= $("#type").val();
			$("#right_nav_article").hide();
		    
			element.render('tab', 'component-tab-ktsys-two');
		    
		    element.on('tab(component-tab-ktsys-two)', function(elem){
		    	  //console.info(elem.elem.context);
			      var ele = elem.elem.context;
			      initTable(table,$(ele).data("id"),$(ele).data("type"));
		    });
		    
			if(type == "502fa94eb9b64516aaff1f254e71654f"){//栏目
				 var first_li = $("#left_nav").find("li").first()[0];
				 initTable(table,$(first_li).data("id"),$(first_li).data("type"));
			} else if(type == "0e0acb903a374b7e94aff42917a475af"){//列表
				if("${columns.name}" == "科研人员"){
					$("#cms_tztg_nr").hide();
					$.get(ctxf + "/cms/front/getArticleListByColumnsId/${columns.id}/1000",{},function(data){
						if(data && data.articleList && data.articleList.length > 0){
							var cms_kyrs = $("#cms_kyrs");
							var cms_kyrs_str = [];
							$.each(data.articleList,function(i,e){
							    if(i == 0 || (i  > 1 && i % 6 == 1)){
							    	cms_kyrs_str.push("<div class='layui-row layui-col-space30'>");
							    }
							    cms_kyrs_str.push("<div class='layui-col-md2 layui-col-sm4'>");
							    cms_kyrs_str.push("    <div class='cmdlist-container'>");
							    cms_kyrs_str.push("        <a href='javascript:;'>");
							    cms_kyrs_str.push("           <img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "'>");
							    cms_kyrs_str.push("        </a>");
							    cms_kyrs_str.push("        <a href='" + ctxf + "/cms/front/three/" + e.id + "' target='_blank' style='color:" + e.color + "'>");
							    cms_kyrs_str.push("            <div class='cmdlist-text center'>");
							    cms_kyrs_str.push("               " + e.title + "");
							    cms_kyrs_str.push("            </div>");
							    cms_kyrs_str.push("        </a>");
							    cms_kyrs_str.push("     </div>");
							    cms_kyrs_str.push("</div>");
							    if(i == (data.articleList-1) || (i > 1 && i % 6 == 0)){
							    	 cms_kyrs_str.push("</div>");	
							    }
							});
							cms_kyrs.append(cms_kyrs_str.join(""));
						}
					});
				} else {
					$("#cms_kyrs").hide();
					initTable(table,'${columns.id}',type);
				}
			} else if(type == "389e1a7f28ef4500bb68d9dba14207d4"){//内容
				
			}
			
			
		});
			
	 
		function initTable(table,id,type){
			var width = 1030;
            var columnsType= $("#type").val();
            //栏目
			if(columnsType == "502fa94eb9b64516aaff1f254e71654f"){
				//width = 830;
			}
            //内容
            if(type == "389e1a7f28ef4500bb68d9dba14207d4"){
            	$("#right_nav").hide();
            	$.get(ctxf + "/cms/front/getArticleListByColumnsId/" + id + "/10",function(res){
            		$("#right_nav_article").show();
            		var articleList = res.articleList;
            		if(articleList && articleList.length>0){
            			var article = articleList[0];
	            		$("#article_title").text(article.title);
	            		$("#article_title").css({ "color": article.color ? article.color : "#f51c40"});
            	
	            		$("#article_releaseDate").text(article.releaseDate.substr(0,10));
	            		if(article.source){
	            		$("#article_source").text("来源：" + article.source);
	            		}
	            		$("#article_content").html(article.content);
            		}
    			});
            } 
            //列表
            else if(type == "0e0acb903a374b7e94aff42917a475af"){
            	$("#right_nav_article").hide();
            	$("#right_nav").show();
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