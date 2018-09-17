<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')}</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>	
	<link href="${ctxStatic}/bootstrap/3.3.5/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" >
	<style type="text/css">
		.mobile-title {
			text-align: center;
			font-weight: bold;
			background-color: rgb(6, 193, 174);
			height: 50px;
		}
		
		.mobile-title .title-text {
			height: 100%;
			vertical-align: baseline;
			font-size: 24px;
		}
		
		.mobile-body {
			padding: 50 10 0 10;
		}
		
		.container-fluid {
			padding: 0;
		}
		.form-group .input-group{
		    width:100%;
		}
		.form-group .input-group .btn{
		    width:80%;
		    margin-left:10%;
		    margin-right:10%;
		}
		.wxl_circle_nav {
			padding: 25px 10px 5px;
			max-width: 100%;
		}
		
		.wxl_circle_nav_list {
			max-width: 100%;
			overflow: hidden;
		}
		.wxl_circle_nav_list a {
			border-radius: 50%;
			width: 55px;
			height: 55px;
			display: block;
			margin: 0 auto;
			color: #fff;
			text-align: center;
			line-height: 55px;
			font-size: 35px;
			-webkit-transition: all 0.2s ease;
			transition: all 0.2s ease;
		}
		
		.wxl_circle_nav_list li {
			width: 25%;
			float: left;
			margin-bottom: 15px;
		}
		.iconfont {
			font-family: "iconfont" !important;
			font-size: 12px;
			font-style: normal;
			-webkit-font-smoothing: antialiased;
			-webkit-text-stroke-width: 0.2px;
			-moz-osx-font-smoothing: grayscale;
		}
		ul, li {
			list-style: none;
			padding: 0;
			margin: 0;
		}	
		.wxl_circle_nav_list p {
			display: block;
			width: 100%;
			line-height :20px;
			text-align: center;
			padding-top: 5px;
			font-size: 12px;
		}
		
		.panel-heading{
		    height: 40px;
		}
		
		.pet_content_block .am-paragraph-default img {
			border: none;
			padding: 0;
			margin: 0 auto;
			max-width: 100%;
		}
		
		.pet_content_article img {
			border-radius: 5px;
		}
		
		.c_body{
		   padding-left:30px;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="panel-group" id="accordion" aria-multiselectable="true">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style='float: left;'>
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 
						     <span class="glyphicon glyphicon-menu-hamburger"></span>
						</a> 
					</div>
					<div style='float: right;'>
						<c:set var='user' value='${fns:getUser()}'/>
							${user.name}
						<c:if test="${empty user.photo}">
					          <img style="border-radius:40%;height:20px;" src="${ctxStatic}/common/homePage/images/a9.jpg">
					    </c:if>
					    <c:if test="${not empty user.photo}">
					          <img style="border-radius:50%;height:20px;" src="${user.photo}">
					    </c:if>
					</div>
				</div>
				<div id="collapseOne" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<ul class="list-group">
						<!-- 	<li class="list-group-item"><a class='btn' href="${ctx}/sys/user/info"> <span class="glyphicon glyphicon-user"></span>个人信息</a></li> -->
							<li class="list-group-item"><a class='btn' href="${ctx}/logout"> <span class="glyphicon glyphicon-off"></span>退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class='wxl_circle_nav'>
				<ul class="wxl_circle_nav_list">
					<li><a href="${ctx}/sys/user/info" class="iconfont " style='background-color: #fe9700;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a9.jpg">
					    </a> 
					    <p>信息</p>
					</li>
					<li><a href="${ctx}/train/evalmanage/assessSend/listQuery" class="iconfont " style='background-color: #f26765;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a1.jpg">
					    </a>
					    <p>评估</p>
					</li>
					<li><a href="${ctx}/train/photo/coursePhoto/photo" class="iconfont " style='background-color: #6f68df;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a2.jpg">
					    </a>
					    <p>相册</p>
					</li>
					<li><a href="${ctx}/baseinfo/project/listQuery" class="iconfont " style='background-color: #7f2d00;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a3.jpg">
					    </a>
					    <p>证书</p>
					</li>
					<li><a href="${ctx}/train/mobile/mailListTree" class="iconfont " style='background-color: #fd7a49;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a4.jpg">
					    </a>
					    <p>通讯录</p>
					</li>
					<li><a href="${ctx}/train/mobile/studentNotice" class="iconfont " style='background-color: #19cf8a;'>
					          <img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a5.jpg">
					    </a>
					    <p>学员须知</p>
					</li>
					<!-- <li><a href="#" class="iconfont " style='background-color: #4493f7;'><img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a6.jpg"></a><p>成绩</p></li>
					<li><a href="#" class="iconfont " style='background-color: #7fd02b;'><img style="border-radius:50%;height:55px;" class="img-circle" src="${ctxStatic}/common/homePage/images/a7.jpg"></a><p>更多</p></li> -->
				</ul>
			</div>
		</div>
		<div class="panel panel-default" id="projectContent"></div>
		<script src="${ctxStatic}/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="${ctxStatic}/bootstrap/3.3.5/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
               $(function(){
            	    initProject();
                });
               function initProject(){
            	    $.ajax({
						  type : "POST",
						  url : "${ctx}/baseinfo/project/listMobileQuery",
						  dataType : 'json',
						  success : function(result) {
							  var a = result.listProject;
							  console.info(a);
							  if(a && a.length > 0){
								  var tips = ['success','danger','info','error'];
							      $.each(a,function(i){
								       var c = $(this);
                                       var str = "<div class='alert alert-" + tips[i%4] + " alert-dismissible fade in' role='alert'>";
                                       str += "<h4><a href='${ctx}/train/mobile/projectPersonList?personId=" + ${user.id} + "&classId=" + c[0].id + "'>" + c[0].bjmc + "</a></h4>";
                                       str += "<p>" + c[0].fremarks + "</p>";
                                       str += "</div>";
                                       $("#projectContent").append(str);
								  });
							  }
					      }
					});
               }
        </script>
</body>
</html>