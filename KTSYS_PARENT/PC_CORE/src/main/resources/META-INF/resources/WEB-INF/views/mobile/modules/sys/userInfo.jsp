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
		
		.form-group .input-group {
			width: 100%;
		}
		
		.form-group .input-group .btn {
			width: 80%;
			margin-left: 10%;
			margin-right: 10%;
		}
		
		.key {
			text-align: right;
			width: 100px;
			float:left;
			margin-left:10px;
		}
		
		.value {
			text-align: left;
			float:left;
			word-wrap:break-word;
			width:70%;
		}
		
		.value input {
			width:80%;
		}
		
		.form-horizontal {
		    padding: 10px;
		}
		.img {
		   padding-left:20px;
		}
		
		.error{
		   color:red;
		}
		.panel-heading{
		    height: 40px;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			  <div class="panel panel-info">
			       <div class="panel-heading" role="tab" id="headingOne">
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
    
				     <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					      <div class="panel-body">
					            <ul class="list-group">
					                  <li class="list-group-item">
									       <a class='btn' href="${ctx}/">
					                             <span class="glyphicon glyphicon-th-large"></span>  首页
					                       </a>
									  </li>
									  <li class="list-group-item"><a class='btn' href="${ctx}/logout"> <span class="glyphicon glyphicon-off"></span>退出</a></li>
									  <!-- <li class="list-group-item">
									       <a class='btn' href="#">
					                             <span class="glyphicon glyphicon-user"></span>  个人信息
					                       </a>
									  </li> 
									  <li class="list-group-item">
									       <a class='btn' href="#">
					                             <span class="glyphicon glyphicon-edit"></span>  评估表填写
					                       </a>
					                        </li>
									  <li class="list-group-item">
									       <a class='btn' href="#">
					                             <span class="glyphicon glyphicon-camera"></span>  相册预览
					                       </a>
									  </li>
									  <li class="list-group-item">
									       <a class='btn' href="#">
					                             <span class="glyphicon glyphicon-search"></span>  查询
					                       </a>
									  </li>-->
								</ul>
					      </div>
				    </div>
         </div>
		<div>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">基本信息</a></li>
			    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">个人简历</a></li>
			    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">联系方式</a></li>
			    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">修改密码</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="home">
					 <form class="form-horizontal">
					        <div class="form-group">
					            <div class='img'>
							        <c:if test="${empty user.photo}">
							          <img class=" img" src="${ctxStatic}/common/homePage/images/a9.jpg">
								    </c:if>
								    <c:if test="${not empty user.photo}">
								          <img class=" img" src="${user.photo}">
								    </c:if>
							    </div>
						    </div>
			               <div class="form-group">
								  <div class="key">用户名：</div>
								  <div class="value">${user.loginName}</div>
							</div>
							<div class="form-group">
								  <div class="key">身份证号：</div>
								  <div class="value">${user.idcard}</div>
							</div>
							<div class="form-group">
								  <div class="key">姓名：</div>
								  <div class="value">${user.name}</div>
							</div>
							<div class="form-group">
								  <div class="key">性别：</div>
								  <div class="value">${user.gender}</div>
							</div>
							<div class="form-group">
								  <div class="key">出生日期：</div>
								  <div class="value"><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></div>
							</div>
							<div class="form-group">
								  <div class="key">民族：</div>
								  <div class="value">${user.nation}</div>
							</div>
			         </form>
			    
			    </div>
			    <div role="tabpanel" class="tab-pane" id="profile">
			         <form class="form-horizontal">
			               <div class="form-group">
								  <div class="key">毕业时间：</div>
								  <div class="value">${user.graduateDate}</div>
							</div>
							<div class="form-group">
								  <div class="key">毕业院校：</div>
								  <div class="value">${user.graduateSchool}</div>
							</div>
							<div class="form-group">
								  <div class="key">学历：</div>
								  <div class="value">${user.degree}</div>
							</div>
							<div class="form-group">
								  <div class="key">职务：</div>
								  <div class="value">${user.position}</div>
							</div>
							<div class="form-group">
								  <div class="key">职称：</div>
								  <div class="value">${user.professional}</div>
							</div>
							<div class="form-group">
								  <div class="key">技能等级：</div>
								  <div class="value">${user.professLevel}</div>
							</div>
							<div class="form-group">
								  <div class="key">工作单位：</div>
								  <div class="value">${user.depName}</div>
							</div>
			         </form>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="messages">
			        <form class="form-horizontal">
			               <div class="form-group">
								  <div class="key">电话：</div>
								  <div class="value">${user.phone}</div>
							</div>
							<div class="form-group">
								  <div class="key">手机：</div>
								  <div class="value">${user.mobile}</div>
							</div>
							<div class="form-group">
								  <div class="key">邮箱：</div>
								  <div class="value">${user.email}</div>
							</div>
							<div class="form-group">
								  <div class="key">微信号：</div>
								  <div class="value">${user.qq}</div>
							</div>
			         </form>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="settings">
			         <form class="form-horizontal" action="${ctx}/sys/user/modifyPwd" method="post" id='pwdForm'>
			               <div class="form-group">
								  <div class="key">原密码：</div>
								  <div class="value">
								       <input id="oldPassword" name="oldPassword" type="password" value="" maxlength="50" minlength="3"/>
								  </div>
							</div>
							<div class="form-group">
								  <div class="key">新密码：</div>
								  <div class="value">
								       <input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3"/>
								  </div>
							</div>
							<div class="form-group">
								  <div class="key">新密码：</div>
								  <div class="value">
								       <input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3"/>
								  </div>
							</div>
							<div class="form-group">
							      <div class="input-group">
								        <input class="btn btn-info" type="submit" id='updPwdBtn' value="修   改"/>
								  </div>
							</div>
							
			         </form>
			    </div>
			 </div>
	    </div>
	</div>
	<script src="${ctxStatic}/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/bootstrap/3.3.5/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
		$(function() {
			$("#pwdForm").validate({
				submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
                //    alert("提交表单");   
                  //  form.submit();   //提交表单   
                     $("#updPwdBtn").attr("disabled");
                    $.ajax({
						type : "POST",
						url : "${ctx}/sys/user/updPwd",
						data : {
							"id" : '${user.id}'
							"loginName" : '${user.loginName}',
							"newPassword" : $("#newPassword").val()
						},
						dataType : 'json',
						success : function(result) {
							alert("修改成功。");
							$("#updPwdBtn").removeAttr("disabled");
						}
					});
					
                },
				rules: {
					oldPassword: {
						required: true,
						minlength: 3,
						maxlength: 20,
						equalTo: "#oldpwd"
					},
					newPassword: {
						required: true,
						minlength: 3,
						maxlength: 20,
						equalTo: "#confirmNewPassword"
					},
					confirmNewPassword : {
						required: true,
						minlength: 3,
						maxlength: 20,
						equalTo: "#newPassword"
					}
				},
				messages: {
					oldPassword: {
						required: "请输入原密码",
						minlength: "密码最少3个字符",
						maxlength: "密码最少20个字符",
						equalTo: "原密码错误"
					},
					newPassword: {
						required: "请输入新密码",
						minlength: "密码最少3个字符",
						maxlength: "密码最少20个字符",
						equalTo: "两次新密码不一致"
					},
					confirmNewPassword: {
						required: "请输入新密码",
						minlength: "密码最少3个字符",
						maxlength: "密码最少20个字符",
						equalTo: "两次新密码不一致"
					}
				}
			});
		});
	</script>
</body>
</html>