$(function(){
	// 消除点击延迟js库
	FastClick.attach(document.body);  


    $(".goodtype ul li").click(function(){
        var index = $(this).index();
        $(this).addClass("select").siblings().removeClass("select");
        $(".goodwrapper .item").eq(index).css("display","block").siblings().css("display","none");
    });  





      $(".parter .fr i").click(function(){
            $(".floor").css("display","block");
      });
      $(".floor img.pos").click(function(){
            $(".floor").css("display","none");
      })

      $(".panel .time img.pos").click(function(){
            $(this).parents(".panel").css("display","none");
      });

      $(".history h1 img.pos").click(function(){
            $(this).parents(".history").find("span").css("display","none");
      });


      $(".balance .handle .shan").click(function(){

          $(".shopcarts dl dd .selected").parents("dd").css("display","none");
          $(".balance .checkall span").removeClass("selected");
      })


      $(".withdraw .change").click(function(){
          var index = $(this).index();
          $(this).addClass("gray").siblings().removeClass("gray");

      });  




      var mySwiper = new Swiper('.swiper-container',{
        loop: true,
        autoplay: 10000,
            // 如果需要分页器
        pagination: '.swiper-pagination',
      });






})










