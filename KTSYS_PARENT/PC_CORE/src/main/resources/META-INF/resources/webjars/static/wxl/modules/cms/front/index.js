var columns = {
	notice : "06bcb807af8b4b409b4b3d0f8aaeaf32",
	academic : "87ad7806570346b58f1405557f7248ee",
	news : "2902674f9b784ab683cbaa51f521d7d5",
	message : "bda6f54cda4e4aa38aea24f233bac197"
}

$(function(){
	
	//news
	$.get(ctxf + "/getImageListByColumnsId/" + columns.news+ "/7",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var news = $("#news");
			var inHd = news.find(".inHd>ul");
			var inBd = news.find(".inBd");
			var t = "";
			var m = "";
			$.each(data.articleList,function(i,e){
				var c = formateHTML(e.content);
				t += "<li><a href='" + ctxf + "/three/" + e.id + "' target='_blank'>" + e.title + "</a><span>" + new Date(e.releaseDate).Format("yyyy-MM-dd")  + "</span></li>";
				m += "<ul><li>";
				m += "  <a href='' class='inBd_img'><img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "' /></a>";
				m += "  <p>" + (c.length > 44 ? c.substr(0,44) : c) + "......</p>";
				m += "  <a href='" + ctxf + "/three/" + e.id + "' class='more2'>查看详情</a>";
				m += "</li></ul>";
			});
			inHd.append(t);
			inBd.append(m);
			//新闻中心
			jQuery(".inBox").slide({
				titCell: ".inHd li",
				mainCell: ".inBd"
			});
			jQuery(".outBox").slide({
				effect: "left"
			});
		}
	});
	
	//message
	$.get(ctxf + "/getImageListByColumnsId/" + columns.message + "/7",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var message = $("#message");
			var inHd = message.find(".inHd>ul");
			var inBd = message.find(".inBd");
			var t = "";
			var m = "";
			$.each(data.articleList,function(i,e){
				var c = formateHTML(e.content);
				t += "<li><a href='" + ctxf + "/three/" + e.id + "'>" + e.title + "</a><span>" + new Date(e.releaseDate).Format("yyyy-MM-dd")  + "</span></li>";
				m += "<ul><li>";
				m += "  <a href='' class='inBd_img'><img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "' /></a>";
				m += "  <p>" + (c.length > 44 ? c.substr(0,44) : c) + "......</p>";
				m += "  <a href='' class='more2'>查看详情</a>";
				m += "</li></ul>";
			});
			inHd.append(t);
			inBd.append(m);
			//新闻中心
			jQuery(".inBox").slide({
				titCell: ".inHd li",
				mainCell: ".inBd"
			});
			jQuery(".outBox").slide({
				effect: "left"
			});
		}
	});
	
	//gsjs
	$.get(ctxf + "/getArticleByColumnsId/9cbc7544c1574f42850223f13406bc17",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#gsjs").find("dd").html(d.content);
			if(d.image){
				$("#gsjs").find("a").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	//qywh
	$.get(ctxf + "/getArticleByColumnsId/7c0f820c1f5f41c3b64cf4bcb5b3f333",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#qywh").find("dd").html(d.content);
			if(d.image){
				$("#qywh").find("a").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	//gsqh
	$.get(ctxf + "/getArticleByColumnsId/a567d45398b443a8ad9c583814ff34d6",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#gsqh").find("dd").html(d.content);
			if(d.image){
				$("#gsqh").find("a").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	
	//znjg
	$.get(ctxf + "/getArticleByColumnsId/1ee5992da87e4d429ba189c0be50e566",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#znjg").find("p").html(d.content);
			if(d.image){
				$("#znjg").find("dt").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	
	//cxjqr
	$.get(ctxf + "/getArticleByColumnsId/ebc2ddbaf7514cc1a368c2ec9639cabd",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#cxjqr").find("p").html(d.content);
			if(d.image){
				$("#cxjqr").find("dt").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	
	//znsjfx
	$.get(ctxf + "/getArticleByColumnsId/c1ab79d14c1d4bd5a50ce41c28affe9d",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#znsjfx").find("p").html(d.content);
			if(d.image){
				$("#znsjfx").find("dt").find("img").attr("src",ctxf + "/sys/storge/showImage/cms/article/" + d.image);
			}
		}
	});
	//about
	$.get(ctxf + "/getArticleByColumnsId/9cbc7544c1574f42850223f13406bc17",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var d = data.articleList[0];
			$("#about_text").prepend(d.content);
		}
	});
});

function formateHTML(str){
	if(str){
		var dd=str.replace(/<\/?.+?>/g,"");
		return dd.replace(/ /g,"");
	}
	return "";
}