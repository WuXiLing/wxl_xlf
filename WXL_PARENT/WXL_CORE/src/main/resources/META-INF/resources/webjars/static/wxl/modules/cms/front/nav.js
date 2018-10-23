var columnsType = {
	three : "389e1a7f28ef4500bb68d9dba14207d4",
	columns : "502fa94eb9b64516aaff1f254e71654f",
	list : "0e0acb903a374b7e94aff42917a475af"
}
layui.use([], function() {
	var $ = layui.$, element = layui.element;
	var id = $("#id").val();
	//nav
	$.get(ctxf + "/cms/front/getFirstNavColumns",{},function(data){
		if(data && data.columnsList && data.columnsList.length > 0){
			var cms_nav_menu = $("#cms_nav_menu");
			$.each(data.columnsList,function(i,e){
				var str = [];
				str.push("<li class='layui-nav-item " + ((e.id == id)? "layui-this" : "") + "' " +  (e.id == id ? "style='background-color :#01439A;'" : "")  + ">");
				var target = e.target || "_blank";
				if(e.type == columnsType.three){//three page
					str.push("<a href='" + ctxf + "/cms/front/columnsThree/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.columns){//coolumns
					str.push("<a href='" + ctxf + "/cms/front/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.list){//list
					str.push("<a href='" + ctxf + "/cms/front/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				}
				if(e.childrens && e.childrens.length > 0){
					str.push("<dl class='layui-nav-child'>");
					$.each(e.childrens,function(k,el){
						if(el.target == "_blank"){
					        str.push("<a href='" + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
						} else if(e.target == "_top") {
							 str.push("<a href='" + ctxf + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
						} else {
							var target = el.target || "_blank";
							if(el.type == columnsType.three){//three page
								str.push("<a href='" + ctxf + "/cms/front/columnsThree/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							} else if(el.type == columnsType.columns){//coolumns
								str.push("<a href='" + ctxf + "/cms/front/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							} else if(el.type == columnsType.list){//list
								str.push("<a href='" + ctxf + "/cms/front/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							}
						}
					});
					str.push("</dl>");
				}
				str.push("</li>");
				cms_nav_menu.append(str.join(""));
			});
			element.render('nav', 'component-nav');
			element.render('nav', 'component-nav-active');

			element.on('nav(component-nav-active)', function(elem) {
				layer.msg(elem.text());
			});
			if(!id){
				$("#cms_nav_menu").find(".layui-nav-item").first().addClass("layui-this").css({"background-color":"#01439A"});
			}
		}
	});
});
