<link href="${ctxStatic}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/plugins/ztree/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<style>
	.ztree {
		padding: 0;
		border: 2px solid #CDD6D5;
	}


    .ztree li{
		border: solid 1px #e6e6e6;
		border-bottom-width: 0px;
		border-left-width: 0px;
		border-right-width: 0px;
	}
	.ztree li>a {
		width: 100%;
	}

	.ztree li>a,.ztree li a.curSelectedNode {
		padding-top: 0px;
		background: none;
		height: auto;
		border: none;
		cursor: default;
		opacity: 1;
	}

	.ztree li ul {
		padding-left: 0px
	}

	.ztree div.tree_cell span {
		line-height: 30px;
		vertical-align: middle;
	}

	.ztree div.tree_cell {
		height: 100%;
		width: 13%;
		line-height: 30px;
		text-align: center;
		display: inline-block;
		box-sizing: border-box;
		color: #666;
		font-size: 12px;
		overflow: hidden;
		border-right-width: 1px;
		border-left-width: 0px;
		border-top-width: 0px;
		border-bottom-width: 0px;
		border-style: solid;
		border-color: #e6e6e6;
	}

	.ztree div.tree_cell:first-child {
		text-align: left;
		text-indent: 10px;
		border-left: none;
	}

	.ztree .head {
		background: rgb(230, 230, 230);
	}

	.ztree .head div.tree_cell {
		border-width: 1px;
		border-style: solid;
		border-color: #e6e6e6;
		color: #666;
		font-size: 14px;
	}

	.tree_cell .swich{
		width: 200px;
	}
</style>