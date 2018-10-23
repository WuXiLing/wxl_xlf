var columnsType = {
	three : "389e1a7f28ef4500bb68d9dba14207d4",
	columns : "502fa94eb9b64516aaff1f254e71654f",
	list : "0e0acb903a374b7e94aff42917a475af",
	inner : "1b3e4bf736244a4086abd218e2a9c957",
	outer : "32429c1cfd364098addb618e3c818a53"
}
layui.use([], function() {
	var $ = layui.$, element = layui.element;
	var id = $("#id").val();
	//nav
	$.get(ctxf + "/getFirstNavColumns",{},function(data){
		if(data && data.columnsList && data.columnsList.length > 0){
			var cms_nav_menu = $(".nav_bj>.nav>ul");
			var str = [];
			$.each(data.columnsList,function(i,e){
				str.push("<li class=" + ((e.id == id) ? "on" : "") + ">");
				var target = e.target || "_blank";
				if(e.type == columnsType.three){//three page
					str.push("<a href='" + ctxf + "/columnsThree/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.columns){//coolumns
					str.push("<a href='" + ctxf + "/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.list){//list
					str.push("<a href='" + ctxf + "/senond/" + e.id + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.inner) {
					str.push("<a href='" + ctxf + e.linkAddress + "' target='" + target + "'>" + e.name + "</a>");
				} else if(e.type == columnsType.outer) {
					str.push("<a href='" + e.linkAddress + "' target='" + target + "'>" + e.name + "</a>");
				}
				if(e.childrens && e.childrens.length > 0){
					str.push("<ol>");
					$.each(e.childrens,function(k,el){
						str.push("<li>");
						/*if(el.target == "_blank"){
					        str.push("<a href='" + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
						} else */
						if(e.target == "_top") {
							 str.push("<a href='" + ctxf + el.href + "' target='" + el.target + "'>" + el.name + "</a>");
						} else {
							var target = el.target || "_blank";
							if(el.type == columnsType.three){//three page
								str.push("<a href='" + ctxf + "/columnsThree/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							} else if(el.type == columnsType.columns){//coolumns
								str.push("<a href='" + ctxf + "/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							} else if(el.type == columnsType.list){//list
								str.push("<a href='" + ctxf + "/senond/" + el.id + "' target='" + target + "'>" + el.name + "</a>");
							}
						}
						str.push("</li>");
					});
					str.push("</ol>");
				}
				str.push("</li>");
			});
			cms_nav_menu.append(str.join(""));
			/*$.each(cms_nav_menu,function(){
				
			});*/
			/*element.render('nav', 'component-nav');
			element.render('nav', 'component-nav-active');

			element.on('nav(component-nav-active)', function(elem) {
				layer.msg(elem.text());
			});*/
			if(!id){
				$(".nav_bj>.nav>ul").find("li").first().addClass("on");
			}
		}
	});
});
