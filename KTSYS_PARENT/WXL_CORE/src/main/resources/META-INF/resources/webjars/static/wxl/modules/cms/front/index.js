var columns = {
	notice : "06bcb807af8b4b409b4b3d0f8aaeaf32",
	academic : "87ad7806570346b58f1405557f7248ee",
	news : "4e04bedf842d40ddaba5794bb5985928",
	logo : "f7b3dc3ab4e94274b8053d95da0aaf95"
}
layui.use(['table','carousel'], function() {
	var $ = layui.$, element = layui.element;
	var carousel = layui.carousel;
	var table = layui.table;
    
	table.render({
		elem : '#news-table-operate',
		url : ctxf + '/cms/front/selectLayuiPageList',
		where : {
			key : {
				"status" : 1,
				"columnsId" : columns.news,
				"frontQuery" : "y"
			}
		},
		cols : [ [ {
			field : 'title',
			title : '标题',
			align : 'left',
			width : 260,
			templet : function(d){
				return "&nbsp;&nbsp;&nbsp;&nbsp;<span>▶</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + ctxf + "/cms/front/three/" + d.id + "' target='_blank'>" + d.title +"</a>";
			}
		}, {
			field : 'releaseDate',
			title : '发布时间',
			align : 'center',
			width : 100,
			templet : function(d){
				if(d.releaseDate){
					var date = new Date(d.releaseDate);
					return date.Format("yyyy-MM-dd");
				}
				return '';
			}
		}] ],
		page : false,
		limit: 8,
		done : function(res, curr, count){
			$(".layui-table-header").hide();
		},
		skin : 'nob'
	});
	
	//newsPhoto
	$.get(ctxf + "/cms/front/getImageListByColumnsId/" + columns.news + "/5",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var cms_news_photo = $("#cms_news_photo");
			$.each(data.articleList,function(i,e){
			    cms_news_photo.append("<div><img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "'></div>");
			});
			carousel.render({
		      elem: '#news-carousel-normal'
		      ,arrow: 'always'
		    }); 
		}
	});
	//logoPhoto
	$.get(ctxf + "/cms/front/getImageListByColumnsId/" + columns.logo +"/6",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var cms_logo_carousel = $("#cms_logo_carousel");
			$.each(data.articleList,function(i,e){
				cms_logo_carousel.append("<div><img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "'></div>");
			});
			carousel.render({
		      elem: '#logo-carousel-normal'
		      ,arrow: 'always'
		    }); 
		}
	});
});

$(function(){
	
	//Academic
	$.get(ctxf + "/cms/front/getImageListByColumnsId/" + columns.academic+ "/4",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var cms_xsyj_iamge = $("#cms_xsyj_image");
			var cms_xsyj_title = $("#cms_xsyj_title");
			var cms_xsyj_content = $("#cms_xsyj_content");
			$.each(data.articleList,function(i,e){
				cms_xsyj_iamge.append("<div class='layui-col-md3'><img src='" + ctxf + "/sys/storge/showImage/cms/article/" + e.image + "'></div>");
				cms_xsyj_title.append("<div class='layui-col-md3 cms_xsyj_title'><span class='symbol'>■</span><a href='" + ctxf + "/cms/front/three/" + e.id + "' target='_blank'>" + e.title + "</a></div>");
				cms_xsyj_content.append("<div class='layui-col-md3'><blockquote class='layui-elem-quote layui-quote-nm'>" + autoAddEllipsis(e.content,20*4) + "</blockquote></div>");
			});
		}
	});
	
	//notice
	$.get(ctxf + "/cms/front/getImageListByColumnsId/" + columns.notice + "/3",{},function(data){
		if(data && data.articleList && data.articleList.length > 0){
			var cms_tztg_nr = $("#cms_tztg_nr");
			$.each(data.articleList,function(i,e){
				var releaseDate = new Date(e.releaseDate);
				var str = [];
				str.push("<div class='layui-row " + (i==0 ? "active" : "") + "'>");
				str.push("   <div class='layui-col-md3 cms_tztg_sj'>");
				str.push("       <div class='layui-row'><div class='layui-col-md12'><h1>" + releaseDate.getDate() + "</h1></div></div>");
				str.push("       <div class='layui-row'><div class='layui-col-md12'>" + (releaseDate.getMonth() + 1) + "月</div></div>");
				str.push("   </div>");
				str.push("   <div class='layui-col-md9 cms_tztg_js'>");
				str.push("       <div class='layui-row'><div class='layui-col-md12'><a class='" + (i==0 ? "active" : "") + "' href='" + ctxf + "/cms/front/three/" + e.id + "' target='_blank'><h3>" + e.title + "</h3></a></div></div>");
				str.push("       <div class='layui-row'><div class='layui-col-md12'><h4>" + autoAddEllipsis(e.content,19) + "</h4></div></div>");
				str.push("   </div>");
				str.push("</div>");
				cms_tztg_nr.append(str.join(""));
			});
			$("#cms_tztg_nr").find(".layui-row").each(function(i,e){
				var self = $(this);
				$(this).hover(function(){
					$(self).find(".cms_tztg_js").find("a").css({"color":"#FEFEFE"});
				},function(){
					$(self).find(".cms_tztg_js").find("a").css({"color":"#000000"});
				});
			});
		}
	});
	
	var mores = ["news","notice","academic"];

	for(var i =0;i<mores.length;i++){
		var value = mores[i];
		$("#" + value + "_more").css({"margin-left":($("#" + value + "_title").width()-230)});
	}
	/* IE下不支持
	 * for( let value of mores){
	}*/
	
	$("#news_more").find("a").attr("href",ctxf + "/cms/front/senond/" + columns.news);
	$("#notice_more").find("a").attr("href",ctxf + "/cms/front/senond/" + columns.notice);
	$("#academic_more").find("a").attr("href",ctxf + "/cms/front/senond/" + columns.academic);
	
	
});