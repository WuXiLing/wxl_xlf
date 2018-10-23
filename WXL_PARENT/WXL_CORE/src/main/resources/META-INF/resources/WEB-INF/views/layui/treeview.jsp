<link href="${ctxStatic}/plugins/ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/plugins/ztree/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<style>
.ztree {
	margin-left: -7px;
	padding-left: 0 !important
}

.ztree li.level0 {
	padding-left: 10px
}

.ztree li.level0 a.level0 {
	margin-left: 0px
}

.ztree li a {
	border: 1px solid #999;
	padding: 3px 8px;
	border-radius: 5px;
	/* height: 27px; */
}

.ztree li {
	padding: 10px 5px 0
}

.ztree li::before {
	border-left: 1px solid #999;
	bottom: 50px;
	height: 100%;
	top: 0;
	width: 1px
}

.ztree li::after, .ztree li::before {
	content: "";
	left: -20px;
	position: absolute;
	right: auto
}

.ztree li::after {
	border-top: 1px solid #999;
	height: 20px;
	top: 25px;
	width: 25px
}

.ztree li::after, .ztree li::before {
	content: "";
	left: -20px;
	position: absolute;
	right: auto
}

.ztree li {
	list-style-type: none;
	margin: 0;
	padding: 10px 5px 0;
	position: relative
}

.ztree li span.switch {
	background-image: none;
	display: none
}

.ztree li span.button.chk {
	margin-top: 7px
}

.ztree li a span.button {
	background-image:
		url(${ctxStatic}/plugins/ztree/css/zTreeStyle/img/zTreeStandard.png);
	display: inline-block
}

.ztree li ul {
	margin-left: 10px
}

.ztree li ul.line {
	background-image: none
}

.ztree li a span.button {
	background-image:
		url(${ctxStatic}/plugins/ztree/css/zTreeStyle/img/glyphicons-halflings.png)
}

.ztree li span.button.ico_open {
	background-position: -408px -120px
}

.ztree li span.button.ico_docu {
	background-position: -48px -120px
}

.ztree li span.button.ico_close {
	background-position: -384px -120px
}

.curSelectedNode {
	/* height: 27px !important; */
	padding-top: 5px !important;
}
</style>