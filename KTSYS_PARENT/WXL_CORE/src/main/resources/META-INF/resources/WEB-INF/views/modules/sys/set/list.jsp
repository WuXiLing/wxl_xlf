<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>你热忱的沿着宿命的轨道行走，以为可以看到想要的风景，风景却总是将你辜负</title>
<meta name="decorator" content="bootstap3.3.5" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-info">
			  <div class="panel-heading">初始化指定用户密码(8888)</div>
			  <div class="panel-body">
			      <div class="row">
			          <div class="col-md-3">
					      <input id='userId' type="hidden">
						  <input id="userName" name="userName" class="required form-control" onclick="userTree('userId','userName',false);" readonly>
			          </div>
			           <div class="col-md-3">
					      <button type="button" class="btn btn-success" onclick='pwdReset();'>重置</button>
			           </div>
			      </div>
			  </div>
		</div>
	    <div class="panel panel-info">
			  <div class="panel-heading">初始化所有用户密码(8888)</div>
			  <div class="panel-body">
			      <button type="button" class="btn btn-success" onclick='pwdUserReset();'>初始化</button>
			  </div>
		</div>
		<div class="panel panel-info">
			  <div class="panel-heading">清除缓存</div>
			  <div class="panel-body">
			      <button type="button" class="btn btn-success" onclick='clearCache();'>清除缓存</button>
			  </div>
		</div>
	</div>

	<script type="text/javascript">
		function pwdReset() {
			layer.msg('确定要重置密码吗？', {
				time : 0, 
				btn : [ '重置', '取消' ],
				yes : function(index) {
					$.ajax({
						type : "POST",
						url : ctx + "/sys/set/pwdReset",
						data : {},
						success : function(data) {
							if (data && data.msg == 'do_ok') {
								layer.msg("重置成功！");
							} else {
								layer.msg("重置失败！");
							}
						}
					});
				}
			});
		}
		
		function pwdUserReset() {
			layer.msg('确定要重置密码吗？', {
				time : 0, 
				btn : [ '重置', '取消' ],
				yes : function(index) {
					$.ajax({
						type : "POST",
						url : ctx + "/sys/set/pwdUserReset",
						data : {},
						success : function(data) {
							if (data && data.msg == 'do_ok') {
								layer.msg("重置成功！");
							} else {
								layer.msg("重置失败！");
							}
						}
					});
				}
			});
		}
		
		function clearCache() {
			layer.msg('确定要清除系统缓存吗？', {
				time : 0, 
				btn : [ '重置', '取消' ],
				yes : function(index) {
					$.ajax({
						type : "POST",
						url : ctx + "/sys/set/clearCache",
						data : {},
						success : function(data) {
							if (data && data.msg == 'do_ok') {
								layer.msg("操作成功！");
							} else {
								layer.msg("操作失败！");
							}
						}
					});
				}
			});
		}
	</script>
</body>
</html>