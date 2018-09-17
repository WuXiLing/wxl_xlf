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
	</style>
</head>
<body>
    <div class="container-fluid">
	    <div class='mobile-title'>
	           <div class="title-text"> <span>陕西安源科技有限公司</span></div>
	    </div>
	    <div class='mobile-body'>
				<form class="form-horizontal" action="${ctx}/login" method="post">
				    <div class="form-group" style='text-align:center;font-size: 18px;'>用户登录</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							</div>
							<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							</div>
							<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
						    <button type="submit" class="btn btn-danger">登录</button>
						</div>
					</div>
				</form>
	    </div>
	    <div class="mobile-foot">
	       
	    </div>
    </div>
    	<script src="${ctxStatic}/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
	    <script src="${ctxStatic}/bootstrap/3.3.5/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
