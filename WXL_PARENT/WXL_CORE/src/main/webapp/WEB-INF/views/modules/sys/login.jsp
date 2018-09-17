<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
	<link rel="icon" href="${ctxStatic}/images/favicon/16/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${ctxStatic}/images/favicon/16/favicon.ico" type="image/x-icon" />

	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta name="author" content="wuxiling" />
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-store">

	<link href="${ctxStatic}/wxl/modules/login/base.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/wxl/modules/login/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
</head>
<body>
	 <div class="bg"></div>
    <div class="container">
        <div class="line bouncein">
            <div class="xs6 xm4 xs3-move xm4-move">
                <div style="height:150px;"></div>
                <div class="media media-y margin-big-bottom">
                </div>
                <form action="${ctx}/login" method="post">
                    <div class="panel loginbox">
                        <div class="text-center margin-big padding-big-top">
                            <h1>后台管理中心</h1>
                        </div>
                        <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="text" class="input input-big" name="username" id="username" placeholder="登录账号" />
                                    <span class="icon icon-user margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="password" class="input input-big" name="password" id="password"  placeholder="登录密码" />
                                    <span class="icon icon-key margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field">
                                    <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" />
                                    <img src="${pageContext.request.contextPath}/servlet/validateCodeServlet" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onClick="this.src=this.src+'?'">
                                </div>
                            </div>
                        </div>
                        <div style="padding:30px;">
                            <input type="submit" id="button" class="button button-block bg-main text-big input-big" value="登录">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
