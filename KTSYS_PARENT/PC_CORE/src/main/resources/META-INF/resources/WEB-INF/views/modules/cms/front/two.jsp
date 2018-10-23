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
		    <div class="layui-col-md12">
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
							</div>
						</div>
					</div>
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
			if(type == "502fa94eb9b64516aaff1f254e71654f"){//栏目
				
			} else if(type == "0e0acb903a374b7e94aff42917a475af"){//列表
				table.render({
					elem : '#news-table-operate',
					url : ctxf + '/selectLayuiPageList',
					height : 600,
					where : {
						key : {
							"columnsId" : "${columns.id}",
							"status" : 1,
							"frontQuery" : "y"
						}
					},
					cellMinWidth : 80,
					cols : [ [ {
						field : 'title',
						title : '标题',
						align : 'left',
						width : 1200,
						templet : function(d){
							return "&nbsp;&nbsp;&nbsp;&nbsp;<span>▶</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + ctxf + "/three/" + d.id + "' target='_blank'>" + d.title +"</a>";
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
			} else if(type == "389e1a7f28ef4500bb68d9dba14207d4"){//内容
				
			}
		});
	</script>
</body>
</html>