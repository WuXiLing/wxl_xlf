<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>区域管理</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treetable.jsp"%>
</head>
<body>
	<div class="layui-fluid" id="LAY-component-grid-list">
		<div class="layui-row layui-col-space10 demo-list">
			<div class="layui-col-sm4 layui-col-md3 layui-col-lg12">
				<div class="layui-card">
					<div class="layui-btn-group area-operate-btn">
						<button class="layui-btn layui-btn-sm" data-type="add">
							<i class="fa fa-plus"></i>新增
						</button>
						<button class="layui-btn layui-btn-sm" data-type="toquery">
							<i class="fa fa-search"></i>查询
						</button>
					</div>
					<table id="area-table-operate" class="layui-table tree-table">
						<thead>
							<tr>
								<th>区域名称</th>
								<th>区域编码</th>
								<th>区域类型</th>
								<th>排序</th>
								<th>系统数据</th>
								<th>状态</th>
								<th style="width: 275px;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="entity">
								<tr id="${entity.id}" pId="${entity.parent.id}">
									<td class="left">${entity.name}</td>
									<td>${entity.code}</td>
									<td>${fns:getItem(entity.type)}</td>
									<td class="center">${entity.queueNumber}</td>
									<td class="center">${entity.sysData ? '<span class=\'error\'>是</span>' : '否'}</td>
									<td class="center">${entity.status eq '1' ? '<span class=\'error\'>禁用</span>' : '正常'}</td>
									<td>
										<div class="layui-btn-container area-operate-btn">
											<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="detail" data-id="${entity.id}" href="#"><i class="fa fa-search"></i>查看</a> 
											<a class="layui-btn layui-btn-xs" data-type="upd" data-id="${entity.id}" href="#"><i class="fa fa-edit"></i>修改</a> 
											<a class='layui-btn layui-btn-danger layui-btn-xs' data-type="del" data-id='${entity.id}' href="#"><i class="fa fa-trash-o"></i>删除</a> 
											<a class="layui-btn layui-btn-primary layui-btn-xs" data-type="addChildren" data-id="${entity.id}" href="#"><i class="fa fa-plus"></i>新增下级</a>
                                        </div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="layui-card area-component-layer" style="display: none;">
		<div class="layui-card-header">查询</div>
		<div class="layui-card-body">
			<form class="layui-form layui-form-pane">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">区域名称：</label>
						<div class="layui-input-block">
							<input type="text" name="name" placeholder="请输入姓名" class="layui-input condition">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">区域编码：</label>
						<div class="layui-input-block">
							<input type="text" name="code" placeholder="请输入登录名" class="layui-input condition">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block user-table-operate-btn">
						<button class="layui-btn layui-btn-sm" lay-submit data-type="query" lay-filter="component-form-area-query"><i class="fa fa-search"></i>查询</button>
						<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctxStatic}/wxl/modules/sys/area/index.js" type="text/javascript"></script>
</body>
</html>