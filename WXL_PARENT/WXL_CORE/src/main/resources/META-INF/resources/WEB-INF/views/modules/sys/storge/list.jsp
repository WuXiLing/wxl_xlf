<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>你热忱的沿着宿命的轨道行走，以为可以看到想要的风景，风景却总是将你辜负</title>
<meta name="decorator" content="bootstap3.3.5" />
</head>
<body>
	<div class="container-fluid">
	    <ul class="nav nav-tabs">
			  <li role="presentation" class="active"><a href="#">存储</a></li>
			  <li role="presentation"><a href="${ctx}/sys/storge/toUpload">上传</a></li>
		</ul>
		   <div class="panel panel-success">
			    <div class="panel-heading" role="tab" id="headingOne">
			        <h4 class="panel-title">
			           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">查询</a>
			         </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body">
				          <table class="table">
							  <tbody>
					               <tr>
					                  <td style="text-align:right;width:10%;">逻辑名：</td>
					                  <td style="text-align:left;width:40%;">
					                          <input type="text" name="logicalName" class="condition form-control">
					                  </td>
					                  <td style="text-align:right;width:10%;">物理名：</td>
					                  <td style="text-align:left;width:40%;">
					                      <input type="text" name="physicalName" class="condition form-control">
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
				<div style="max-height: 600px; overflow: auto;">
						 <table id="grid-basic" data-toggle="bootgrid" class="table table-condensed table-hover table-striped">
							   <thead>
									<tr>
									    <!-- <th data-column-id="commands" data-width="30px;" data-formatter="commands" data-sortable="false"></th> -->
									    <th data-column-id="sys" data-sortable="false" data-align="center" data-header-align="center">系统</th>
										<th data-column-id="type" data-sortable="false" data-align="center" data-header-align="center">类型</th>
										<th data-column-id="physicalName" data-sortable="false" data-align="center" data-header-align="center">物理名</th>
										<th data-column-id="fileSize" data-sortable="false" data-align="center" data-header-align="center">大小</th>
										<th data-column-id="fileType" data-sortable="false" data-align="center" data-header-align="center">类型</th>
										<th data-column-id="commands" data-formatter="commands" data-width="150px;" data-sortable="false" data-align="center" data-header-align="center">操作</th>
									</tr>
						       </thead>
						</table>
				</div>
		   </div>
	</div>
    <a id="load_a"  href=""></a>
	<script type="text/javascript">
	
	    $(function(){
	    	dd();
	    });

	    function dd(){
			var grid = $("#grid-basic").bootgrid({
				navigation : 2,
				ajax : true,
				url : "${ctx}/sys/storge/findByPage",
				initData : {
					status : '0'
				},
				formatters : {
					"commands" : function(column, row) {
						    var str = "<button class='btn btn-danger btn-xs del' data-id='" + row.id + "' data-sys='" + row.sys + "' data-type='" + row.type + "'><span class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;删除</button>&nbsp;&nbsp;";
						    str += "<button class='btn btn-info btn-xs download' data-id='" + row.id + "' data-sys='" + row.sys + "' data-type='" + row.type + "'><span class='glyphicon glyphicon-download-alt'></span>&nbsp;&nbsp;下载</button>&nbsp;&nbsp;";
						return str;
					}
				},
				labels : {
					all : "所有",
					infos : "当前 {{ctx.start}} / {{ctx.end}} 共 {{ctx.total}} 条",
					loading : "数据君正在努力加载中...",
					noResults : "没有查询到记录",
					refresh : "刷新",
					search : "查询"
				}
			}).on("loaded.rs.jquery.bootgrid",function() {
				  grid.find(".del").on("click",function(e) {
					  var id = $(this).data("id"),sys = $(this).data("sys"),type = $(this).data("type");
					  $.ajax({
						   type: "POST",
						   url: "${ctx}/sys/storge/delete/" + sys + "/" + type + "/" + id,
						   data: {},
						   success: function(data){
							   if(data && data.msg == 'del_ok'){
								   $("#grid-basic").bootgrid("reload");
								   showTip("删除成功！");
							   } else {
								   showTip("删除失败！");
							   }
						   }
						});
				  });
				  grid.find(".download").on("click",function(e) {
					  var id = $(this).data("id"),sys = $(this).data("sys"),type = $(this).data("type");
					  $.ajax({
						   type: "POST",
						   url: "${ctx}/sys/storge/checkexist/" + sys + "/" + type + "/" + id,
						   data: {},
						   success: function(data){
							   if(data && data == 1){
								   location.href = "${ctx}/sys/storge/download/" + sys + "/" + type + "/" + id;
							   } else if(data && data == 2){
								   showTip("文件不存在，下载失败！");
							   } else {
								   showTip("下载失败！");
							   }
						   }
						});
				  });
			});
			//查询
			$(".query_demo1").on("click", function() {
				grid.bootgrid("setInitData", conditionValue($("#collapseOne")));
				grid.bootgrid("search", $(".condition").val());
				grid.bootgrid("reload");
			});

	    }
	</script>
</body>
</html>