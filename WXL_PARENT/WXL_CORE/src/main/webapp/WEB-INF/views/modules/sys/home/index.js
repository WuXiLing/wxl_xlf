 var t = layui.carousel;

		$(".layadmin-carousel").each(function() {
			var a = $(this);
			t.render({
				elem : this,
				width : "100%",
				arrow : "none",
				interval : a.data("interval"),
				autoplay : a.data("autoplay") === !0,
				trigger : "hover",
				anim : a.data("anim")
			})
		});
		$("body").on("click", "*[data-url]", function() {
	        var e = $(this);
	        parent.addTab(e);
	    });