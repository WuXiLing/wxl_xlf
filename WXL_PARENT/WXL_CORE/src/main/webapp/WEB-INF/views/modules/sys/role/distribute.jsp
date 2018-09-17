<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>角色详细</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
<style type="text/css">
  .waiting ,.selected_user{
  display:inline-block;
	vertical-align: middle;
	height: 28px;
	width:90%;
	line-height: 28px;
	padding: 2px 0px 2px 6px;
	background-color: #e6e6e6;
	white-space: nowrap;
	font-size: 14px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	margin-top: 5px;
	margin-bottom: 5px;;
}
</style>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 15px;">
				<form class="layui-form layui-form-pane" action="#" lay-filter="component-form-group">
				    <input type="hidden" id="id" value="${role.id}"/>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">角色名称：</label>
							<div class="layui-input-block">
								<input type="text" name="name" value="${role.name}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">英文名称：</label>
							<div class="layui-input-block">
								<input type="text" name="enname" value="${role.enname}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">角色类型：</label>
							<div class="layui-input-block">
								<input type="text" name="roleType" value="${role.roleType}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">数据范围：</label>
							<div class="layui-input-block">
								<input type="text" name="dataScope" value="${fns:getItem(role.dataScope)}" placeholder="" class="layui-input" disabled>
							</div>
						</div>
					</div>
					<div class="layui-form-item  layui-form-text">
						<label class="layui-form-label">备注：</label>
						<div class="layui-input-block">
							<textarea name="remarks" placeholder="" class="layui-textarea" disabled>${role.remarks}</textarea>
						</div>
					</div>
					<div class="layui-card layui-card-danger">
					    <div class="layui-card-header">角色用户 <div style="float:right;"><a class="layui-btn layui-btn-normal layui-btn-xs" data-type="distribute" lay-event="del"><i class="fa fa-share-square-o"></i>分配</a></div></div>
						<div class="layui-card-body" style="max-height:500px;overflow-y:auto;">
						    <table class="layui-table">
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
						       <tbody id="role_user_table"></tbody>
						    </table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="layui-card role-query-layer max-height" id="distribute_form" style="display: none;">
		<div class="layui-fluid max-height" id="LAY-component-grid-list">
		    <div class="layui-row layui-col-space10 max-height">
		        <div class="layui-col-sm4 layui-col-md4 layui-col-lg4 max-height">
		           <div class="layui-card layui-card-danger">
		               <div class="layui-card-header ">待选择</div>
		               <div class="layui-card-body" style="max-height:500px;overflow-y:auto;">
		                   <ul id="officeTree" class="ztree"></ul>
		               </div>
		           </div>
		        </div>
		        <div class="layui-col-sm4 layui-col-md4 layui-col-lg4 max-height">
		           <div class="layui-card layui-card-success">
		              <div class="layui-card-header">已选择</div>
		              <div class="layui-card-body" style="max-height:500px;overflow-y:auto;">
		                  <table>
		                    <tbody id="select_user"></tbody>
		                 </table>
		              </div>
		           </div>
		        </div>
		        <div class="layui-col-sm4 layui-col-md4 layui-col-lg4 max-height">
		           <div class="layui-card layui-card-info">
		             <div class="layui-card-header">已分配</div>
		             <div class="layui-card-body" style="max-height:500px;overflow-y:auto;">
		                 <table>
		                    <tbody id="selected_user">
		                            <c:forEach items="${role.userList}" var="user" varStatus="s">
						            <tr>
										<td><a class='selected_user' data-id='${user.id}' onclick='remove_user(this);'>${user.name}</a></td>
									</tr>
						           </c:forEach>
		                    </tbody>
		                 </table>
		             </div>
		           </div>
		        </div>
	         </div>
	         <div class="layui-row layui-col-space10" style="position:absolute;bottom:10px;width:90%;">
	              <div class="layui-btn-container" style="text-align:center;">
		                <a class="layui-btn layui-btn-xs" data-type="affirm"><i class="fa fa-edit"></i>确认</a>
		                <a class="layui-btn layui-btn-xs"><i class="fa fa-edit"></i>关闭</a>
		        </div>
	         </div>
         </div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/role/distribute.js" type="text/javascript"></script>
</body>
</html>
