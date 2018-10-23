var setting = {
	view : {
		selectedMulti : false,
		nameIsHTML : true,
		showTitle : false,
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : treeOnClick
	}
};

$(function() {
	$.get(ctx + "/sys/office/treeData",
		function(nodes) {
			var treeObj = $.fn.zTree.init($("#officeTree"), setting, nodes);
			treeObj.expandAll(true);
		});
	
	$(".btn-close").each(function(){
		$(this).on("click",function(){
    	    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    	   // parent.layer.msg('您将标记 [ ] 成功传送给了父窗口');
    	    parent.layer.close(index);
    	});
	});
});

// 点击选择项回调
function treeOnClick(event, treeId, treeNode, clickFlag) {
	$.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
	if ("officeTree" == treeId) {
		$.get(ctx + "/sys/user/findTreeDataByOffice/" + treeNode.id,
			function(userNodes) {
				$.fn.zTree.init($("#userTree"), setting, userNodes);
			});
	} else if("userTree" == treeId){
		 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    	 parent.$('#' + $("#parentId").val()).val(treeNode.id);
    	 parent.$('#' + $("#parentName").val()).val(treeNode.name);
	}
}