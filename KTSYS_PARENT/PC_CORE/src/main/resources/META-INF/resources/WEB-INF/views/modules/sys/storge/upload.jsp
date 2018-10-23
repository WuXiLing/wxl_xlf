<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>你热忱的沿着宿命的轨道行走，以为可以看到想要的风景，风景却总是将你辜负</title>
<meta name="decorator" content="bootstap3.3.5" />
<link href="${ctxStatic}/plugins/bootstrap/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet" />
<script src="${ctxStatic}/plugins/bootstrap/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/plugins/bootstrap/bootstrap-fileinput/js/locales/zh.js" type="text/javascript"></script>
</head>
<body>
	<div class="container-fluid">
	    <ul class="nav nav-tabs">
			  <li role="presentation"><a href="${ctx}/sys/storge/">存储</a></li>
			  <li role="presentation" class="active"><a href="#">上传</a></li>
		</ul>
		   <div class="panel panel-success">
			    <div class="panel-heading" role="tab" id="headingOne">
			        <h4 class="panel-title">
			           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">上传一</a>
			         </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body">
				            <input id="input-700" name="kartik-input-700[]" type="file" multiple class="file-loading">
				            <div id="kv-error-2" style="margin-top:10px;display:none"></div>
				            <div id="kv-success-2" class="alert alert-success fade in" style="margin-top:10px;display:none"></div>
				      </div>
			    </div>
		   </div>
		   <c:forEach items="${list}" var="entity">
		       <input class="im" data-id="${entity.id}" data-type="${entity.type}" data-sys="${entity.sys}" data-size="${entity.fileSize}" data-name="${entity.physicalName}" type="hidden">
		   </c:forEach>
	</div>
	<script type="text/javascript">
	    $(function(){
	    	var a = [],b=[];
	    	$.each($(".im"),function(i,e){
	    		a.push("<img style='height:160px' src='${ctx}/sys/storge/download/" + $(e).data("sys") + "/" + $(e).data("type") + "/" + $(e).data("id") + "'></img>");
	    		b.push({
	    			caption: $(e).data("name"), size: $(e).data("size"), width: "120px", url: "/site/file-delete", key: i
	    		});
	    	});
			$("#input-700").fileinput({
			    uploadUrl: "${ctx}/sys/storge/upload/admin/demo", // server upload action
			    uploadAsync: true,
			    minFileCount: 1,
			    maxFileCount: 5,
			    showPreview: true,
			    showBrowse: true,
			    showUpload: false, // hide upload button
			    showRemove: false, // hide remove button
			    browseOnZoneClick: true,
			    elErrorContainer: '#kv-error-2',
			    allowedFileExtensions: ['jpg', 'png', 'gif'],
			    initialPreview: [a],
			    initialPreviewConfig: [b],
			    uploadExtraData: {
			        img_key: "1000",
			        img_keywords: "happy, nature",
			    }
			}).on('filebatchpreupload', function(event, data, id, index) {
			    $('#kv-success-2').html('<h4>Upload Status</h4><ul></ul>').hide();
			    var n = data.files.length, files = n > 1 ? n + ' files' : 'one file';
			    if (!window.confirm("Are you sure you want to upload " + files + "?")) {
			        return {
			            message: "Upload aborted!", // upload error message
			            data:{} // any other data to send that can be referred in `filecustomerror`
			        };
			    }
			    //$input.fileinput("upload");//自动上传
			    
			}).on('filebatchuploadsuccess', function(event, data) {
			    var out = '';
			    $.each(data.files, function(key, file) {
			        var fname = file.name;
			        out = out + '<li>' + 'Uploaded file # ' + (key + 1) + ' - '  +  fname + ' successfully.' + '</li>';
			    });
			    $('#kv-success-2 ul').append(out);
			    $('#kv-success-2').fadeIn('slow');
			}).on("filepredelete", function(jqXHR) {
			    var abort = true;
			    if (confirm("Are you sure you want to delete this image?")) {
			        abort = false;
			    }
			    return abort; // you can also send any data/object that you can receive on `filecustomerror` event
			});
	    });
	</script>
</body>
</html>