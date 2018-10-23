<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>你热忱的沿着宿命的轨道行走，以为可以看到想要的风景，风景却总是将你辜负</title>
	<meta name="decorator" content="bootstap3.3.5" />
</head>
<body>
    <div class="container-fluid">
	    <ul class="nav nav-tabs">
			  <li role="presentation" class="active"><a href="#">企业信息列表</a></li>
			  <li role="presentation"><a href="${ctx}/baseinfo/firmInfo/form">企业信息维护</a></li>
		</ul>
			   <div class="panel panel-success"  style="max-height: 700px; overflow: auto;">
		    <div class="panel-heading" role="tab" id="headingOne">
		        <h4 class="panel-title">
		           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">查询</a>
		         </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body">
			          <table class="table" class="table table-condensed table-hover table-striped">
						  <tbody>
				               <tr>
				                  <td style="text-align:right;width:10%;">企业名称：</td>
				                  <td style="text-align:left;width:40%;">
				                        <input class="form-control">
				                  </td>
				                  <td style="text-align:right;width:10%;">简称：</td>
				                  <td style="text-align:left;width:40%;">
				                        <input class="form-control">
				                  </td>
				               </tr>
				           </tbody>
				           <tfoot>
				               <tr>
				                  <td colspan="4" style="text-align:center;">
				                       <button type="button" class="btn btn-info btn-xs query_demo1"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;查询</button>
				                       <button type="button" class="btn btn-default btn-xs" onclick="$('.condition').val('');"><span class="glyphicon glyphicon-refresh"></span>&nbsp;&nbsp;重置</button>
				                  </td>
				               </tr>
				           </tfoot>
						</table>
			      </div>
		    </div>
			 <table id="grid-basic" class="table table-condensed table-hover table-striped">
				   <thead>
						<tr>
						    <th>企业名称</th>
							<th>简称</th>
							<th>联系人</th>
							<th>移动电话</th>
							<th>邮箱</th>
							<th>通信地址</th>
							<th>网址</th>
							<th style="width:150px;">操作</th>
						</tr>
			       </thead>
			       <tbody>
			           <c:forEach items="${firmInfoList}" var="entity">
							<tr>
							    <td> 
							        ${entity.name}<span id="span_${entity.id}" data-id="${entity.id}" class=" ${entity.status eq 1 ? 'display ss' : 'hidden'}"><font color="red">[当前企业]</font></span>
								</td>
								<td>${entity.simpleName}</td>
								<td>${entity.contactor}</td>
								<td>${entity.mobilePhone}</td>
								<td>${entity.email}</td>
								<td>${entity.address}</td>
								<td>${entity.website}</td>
								<td>
									<a id="start_${entity.id}" class="btn btn-warning btn-xs start ${entity.status ne 1 ? 'display' : 'hidden'}" href="#" data-id="${entity.id}">切换</a>
				    				<a class="btn btn-info btn-xs" href="${ctx}/baseinfo/firmInfo/form?id=${entity.id}">修改</a>
									<a class="btn btn-danger btn-xs del" href="#" data-id="${entity.id}">删除</a>
								</td>
							</tr>
					    </c:forEach>
			       </tbody>
			</table>
	   </div>
	</div>
	<script type="text/javascript">
	    $(function(){
	    	$(".del").each(function(){
	    		$(this).on("click",function(){
	    			var obj = $(this);
	    			var id = $(this).data("id");
				    $.ajax({
						   type: "POST",
						   url: "${ctx}/sys/firmInfo/" + id + "/delete",
						   data: {},
						   success: function(data){
							   if(data && data.msg == 'del_ok'){
								   $(obj).parent().parent().parent().remove();
								   showTip("删除成功！");
							   } else {
								   showTip("删除失败！");
							   }
						   }
					});
	    		});
	    	});
	    	$(".start").each(function(){
	    		$(this).on("click",function(){
	    			var obj = $(this);
	    			var id = $(this).data("id");
				    $.ajax({
						   type: "POST",
						   url: "${ctx}/sys/firmInfo/" + id + "/start",
						   data: {},
						   success: function(data){
							   if(data && data.msg == 'start_ok'){
								   var old_id = $(".ss").first().data("id");
								   //原来名称隐藏
								   $("#span_" + old_id).hide().removeClass("ss");
								   //按钮显示
								   $("#start_" + old_id).show().removeClass("hidden");
								   
								   //
								   $("#span_" + id).show().addClass("ss").removeClass("hidden");
								   $("#start_" + id).hide();
								   showTip("切换成功！");
							   } else {
								   showTip("切换失败！");
							   }
						   }
					});
	    		});
	    	});
	    });
	</script>
</body>
</html>