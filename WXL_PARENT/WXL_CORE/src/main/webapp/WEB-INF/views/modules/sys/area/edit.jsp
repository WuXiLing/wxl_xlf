<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>编辑</title>
	<meta name="decorator" content="bootstap3.3.5"/>
</head>
<body>
    <div class="container-fluid">
        <ul class="nav nav-tabs">
			  <li role="presentation"><a href="${ctx}/sys/area/">区域列表</a></li>
			  <li role="presentation"><a href="${ctx}/sys/area/add">区域添加</a></li>
			   <li role="presentation" class="active"><a href="#">区域编辑</a></li>
	    </ul>   
        <form:form id="inputForm" action="${ctx}/sys/area/save" modelAttribute="area" method="post" class="form-horizontal">
            <div class="panel panel-default">
			     <div class="panel-body" id="add_form">
			         <form:hidden path="id"/>
		               <div class="row">
		                 <div class="col-xs-12">
				              <div class="form-group">
						           <label class="col-sm-2 control-label"><span style="color:red;">*</span>上级区域：</label>
						           <div class="col-sm-8">
						                <input id='parentId' name='parent.id' type="hidden" value="${area.parent.id}">
				                        <input id="parentName" name="parent.name" value="${area.parent.name}" class="required form-control" onclick="areaTree('parentId','parentName',false);" readonly>
						           </div>
						      </div>
				         </div>
		             </div>
		              <div class="row">
		                 <div class="col-xs-12">
				              <div class="form-group">
						           <label class="col-sm-2 control-label"><span style="color:red;">*</span>区域名称：</label>
						           <div class="col-sm-8">
						                <form:input path="name" class="required form-control" maxlength="50"/>
						           </div>
						      </div>
				         </div>
		             </div>
		              <div class="row">
		                 <div class="col-xs-12">
				              <div class="form-group">
						           <label class="col-sm-2 control-label"><span style="color:red;">*</span>区域编码：</label>
						           <div class="col-sm-8">
						                <form:input path="code" class="required form-control" maxlength="50"/>
						           </div>
						      </div>
				         </div>
		             </div>
		              <div class="row">
		                 <div class="col-xs-12">
				              <div class="form-group">
						           <label class="col-sm-2 control-label">区域类型：</label>
						           <div class="col-sm-8">
						                <form:select path="type" class="form-control">
											<form:options items="${fns:getDictItem('sys_area_type')}" itemLabel="name" itemValue="id" htmlEscape="false"/>
										</form:select>
						           </div>
						      </div>
				         </div>
		             </div>
		             <div class="row">
				         <div class="col-xs-12">
				              <div class="form-group">
						           <label class="col-sm-2 control-label">备注：</label>
						           <div class="col-sm-8">
										<form:textarea path="remarks" class="form-control" maxlength="200"/>
						           </div>
						      </div>
				         </div>
		             </div>
	             </div>   
			    <div class="panel-footer" style="text-align: center;">
			       <input class="btn btn-success btn-xs" type="submit" value="保 存"/>&nbsp;
			       <a class="btn btn-default btn-xs" href="${ctx}/sys/area/">返 回</a>
			    </div>
			</div>
		</form:form>
	</div>
	<script type="text/javascript">
	    $(function(){
	    	$("#inputForm").validate();
	    	$("#add_form").height($(window).height()-160);
	    });
	</script>
</body>
</html>