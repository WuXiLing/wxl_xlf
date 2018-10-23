<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>分配角色</title>
<meta name="decorator" content="bootstap3.3.5" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="${ctx}/sys/role/">角色列表</a></li>
			<li role="presentation" class="active"><a href="#">角色分配</a></li>
		</ul>
		<div class="panel panel-success">
			<input type="hidden" id="id" value="${role.id}" />
			<div class="panel-body" id="assign_form">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名称：</label>
						<div class="col-sm-4">
						     <input class="form-control" disabled value="${role.name}"/>
						</div>
						<label class="col-sm-2 control-label">归属机构：</label>
						<div class="col-sm-4">
						     <input class="form-control" disabled value="${role.office.name}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">英文名称：</label>
						<div class="col-sm-4">
						     <input class="form-control" disabled value="${role.enname}"/>
						</div>
						<label class="col-sm-2 control-label">角色类型：</label>
						<div class="col-sm-4">
						     <input class="form-control" disabled value="${role.roleType}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">数据范围：</label>
						<div class="col-sm-4">
						     <input class="form-control" disabled value="${fns:getItem(role.dataScope)}"/>
						</div>
					</div>
				</form>
				<div class="panel panel-success">
						<div class="panel-heading">
							<button type="button" class="btn btn-info btn-xs" id="btnclick">&nbsp;&nbsp;分配角色</button>
						</div>
						<table id="basic_table" class="table table-condensed table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>归属公司</th>
									<th>归属部门</th>
									<th>登录名</th>
									<th>姓名</th>
									<th>电话</th>
									<th>手机</th>
									<th style="width:50px;">操作</th>
								</tr>
							</thead>
							<tbody id="basic_table_body"></tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" id="NoPermissionModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="NoPermissionModalLabel">分配角色</h4>
				</div>
				<div class="modal-body" style="max-height: 500px;">
					<div class="row">
						<div class="col-md-4">
							<div class="panel panel-success">
								<div class="panel-heading">所在部门</div>
								<div class="panel-body"
									style="height: 500px; overflow-y: scroll;">
									<ul id="officeTree" class="ztree"></ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-success">
								<div class="panel-heading">待选人员</div>
								<div class="panel-body"
									style="height: 500px; overflow-y: scroll;">
									<ul id="userTree" class="ztree"></ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-success">
								<div class="panel-heading">已选人员</div>
								<div class="panel-body" style="height: 500px; overflow-y: scroll;">
									<ul id="selectedTree" class="ztree"></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info btn-xs" onclick="affirm()">确认</button>
					<button type="button" class="btn btn-success btn-xs" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctxStatic}/modules/sys/role/role.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(function(){
	    	$("#inputForm").validate();
	    	$("#assign_form").height($(window).height()-160);
	    });
	</script>
</body>
</html>
