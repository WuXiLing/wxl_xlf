<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>人员管理</title>
<meta name="decorator" content="layui" />
<%@include file="/WEB-INF/views/layui/treeview.jsp"%>
<style type="text/css">
    #wxl_left{
       height:80%;
    }
    #treeDemo{
       height:100%;
		margin-top: 10px;
		overflow-y: scroll;
		overflow-x: auto;
	}
</style>
</head>
<body>
	<div class="layui-fluid">
	    <div class="wxl_left"><ul id="treeDemo" class="ztree"></ul></div>
        <div class="wxl_right">
            <div class="layui-card">
			    <div class="layui-btn-group user-table-operate-btn">
					<button class="layui-btn layui-btn-sm" data-type="add"><i class="fa fa-plus"></i>新增</button>
					<button class="layui-btn layui-btn-sm" data-type="toquery"><i class="fa fa-search"></i>查询</button>
				</div>
				<table class="layui-hide" id="user-table-operate" lay-filter="user-table-operate"></table>
			</div>
        </div>
	</div>
		<div class="layui-card demo-component-layer" style="display:none;">
          <div class="layui-card-header">查询</div>
          <div class="layui-card-body">
              <form class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">姓名</label>
							<div class="layui-input-block">
								<input type="text" name="name" placeholder="请输入姓名" class="layui-input condition">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">登录名</label>
							<div class="layui-input-block">
								<input type="text" name="loginName" placeholder="请输入登录名" class="layui-input condition">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block user-table-operate-btn">
							<button class="layui-btn layui-btn-sm"  lay-submit data-type="query"  lay-filter="component-form-user-query"><i class="fa fa-search"></i>查询</button>
							<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary"><i class="fa fa-reply"></i>重新填写</button>
						</div>
					</div>
				</form>
          </div>
	</div>
	<c:forEach items="${fns:getDictItem('sex')}" var="yn">
		<input type="hidden" id="st_sex_${yn.id}" value="${yn.name}">
	</c:forEach>
	<script type="text/html" id="user-table-operate-bar">
		 <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="fa fa-search"></i>查看</a>
		 {{# if(d.sysData == 0){ }}
         <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i>修改</a>
		 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>
		 {{#  } }}
    </script>
    <script src="${ctxStatic}/wxl/utils/date.js" type="text/javascript" ></script>
    <script src="${ctxStatic}/wxl/modules/sys/user/index.js" type="text/javascript" ></script>
</body>
</html>