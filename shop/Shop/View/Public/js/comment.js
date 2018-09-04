//首页关注
$(function(){
	$(".attention .close").click(function(){
		$(".attention").fadeOut();
		$("#header").css("top","0");
		$(".message").css("top",".89rem");
	    $(".h-50").hide();
	})
});
//底部搜索
$(function(){
	$(".search-btn").click(function(){
		$(".index-search").toggle();
	})
 })

//点击购买弹出遮罩
$(function(){
	$(".fix-buy-btn").click(function(){
		$(".mui-backdrop").show();
		$(".g-detail").slideDown();
	})
	$(".g-detail-close").click(function(){
		$(".mui-backdrop").hide();
		$(".g-detail").slideUp();
	})
})
$(function(){
	$(".g-detail-color , .g-detail-size").each(function(){
		var i=$(this);
		var p=i.find("ul > li");
		p.click(function(){
			if(!!$(this).hasClass("current")){
				$(this).removeClass("current");
			}
			else{
				$(this).addClass("current").siblings("li").removeClass("current");
			}
		})
	})
});
//服务说明
$(function(){
	$(".server-btn").click(function(){
		$(".mui-backdrop").show();
		$(".server").slideDown();
	})
	$(".server .g-detail-close").click(function(){
		$(".mui-backdrop").hide();
		$(".server").slideUp();
	})
	$(".yhq-btn").click(function(){
		$(".mui-backdrop").show();
		$(".yhqhide").slideDown();
	})
	$(".yhqhide .g-detail-close").click(function(){
		$(".mui-backdrop").hide();
		$(".yhqhide").slideUp();
	})
});
//关闭拼团须知
$(function(){
	$(".quit").click(function(){
		$(".g-instructions").hide();
	})
})
//城市选择
$(function(){
	$("#address-btn").click(function(){
		$(".addressbox, .mui-backdrop").show();
	})
	$(".addressbox .close").click(function(){
		$(".addressbox, .mui-backdrop").hide();
	})
})
//分享
$(function(){
	$(".share").click(function(){
		$(".shareimg").show();
		$(".mui-backdrop").show();
	})
})
$(function(){
	$(".collect").click(function(){
		$(this).addClass("heart").siblings().removeClass("heart");
	})
})
//链接跳转问题
mui('body').on('tap', 'a', function() {
	document.location.href = this.href;
});


//获得slider插件对象
var gallery = mui('.mui-slider');
gallery.slider({
  interval:5000//自动轮播周期，若为0则不自动播放，默认为0；
});


        