<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--title><?php echo (L("ucenter")); ?></title-->
<title>Tpay</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">

<!--线上JQ包-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--本地JQ包-->
<!--<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>-->


<script type="text/javascript" src="/Public/home/wap/js/jquery.glide.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js"></script>
<style>
	.cen_icon .bga{background: #32d8ea;}
	.cen_icon .bgb{background: #f9b73a;}
	.cen_icon .bgc{background: #f7755f;}
	.cen_icon .bgd{background: #3ab5f5;}
	.cen_icon .bge{background: #b6dc25;}

	.cen_icon ul li {
		background: #07d45a;
    width: 30.2%;
    float: left;
    padding: 4vmin 0;
    margin-bottom: 0;
    margin-right: 0;
    border-radius: 4vmin;
    margin-left: 2%;
    margin-top: 2%;
}
.cen_icon ul li p {
    color: #fff;
}
.cen_icon {
     margin-top: 0px; 
}
</style>

<body class="bg96" style="margin-bottom: 20px;">
<div class="header">
     <div class="userInfo" style="width: 75%">
		<a href="<?php echo U('User/Personal');?>"><div class="toux_icon"><img src="/Public/home/wap/heads/<?php echo ($uinfo['img_head']); ?>"></div></a>
    	<div class="uid_xy">
    		<p>UID:<?php echo ($uinfo['userid']); ?></p>
    		<p><?php echo (L("credit")); ?>
			<?php $__FOR_START_13996__=0;$__FOR_END_13996__=$uinfo['user_credit'];for($i=$__FOR_START_13996__;$i < $__FOR_END_13996__;$i+=1){ ?><span><img src="/Public/home/wap/images/aix-icon.png"></span><?php } ?>
			</p>
    	</div>	
    </div>
    <div class="header_r"> <a href="<?php echo U('User/Personal');?>"><img src="/Public/home/wap/images/shez-icon.png" alt=""></a></div>
</div>

<div class="big_width100" >
 <div class="shaomZ">
   	<a onClick="BSL.Qcode('0','qrcodeCallback')" class="shaom">
   		 <img src="/Public/home/wap/images/shaom-icon.png">
   		 <p>扫码支付</p>
   	</a>

 </div>
 <div class="centBalance">
 	<div class="Balance"><p><a class="balance" href="<?php echo U('Index/Bancerecord');?>"><?php echo (L("yue")); ?><br/><strong>￥<span  class="yue"><?php echo (Showtwo($moneyinfo['cangku_num'])); ?></span></strong></a></p></div>
	 <div class="Balance"><p><a class="balance" href="<?php echo U('Index/Exchangerecords');?>"><?php echo (L("jifen")); ?><br/><strong>￥<span class="jifen"><?php echo (Showtwo($moneyinfo['fengmi_num'])); ?></span></strong></a></p></div>
 	<div class="dLine"></div>
 </div>

	<div class="slider">
		<ul class="slides">
			<li class="slide">
				<div class="box" ><img src="/Public/home/wap/images/banner4.png" alt=""></div>
			</li>
			<li class="slide">
				<div class="box" ><img src="/Public/home/wap/images/banner5.png" alt=""></div>
			</li>
			<li class="slide">
				<div class="box" ><img src="/Public/home/wap/images/banner6.png" alt=""></div>
			</li>

		</ul>
	</div>

 <div class="cen_icon">
 	 <ul>
 	 	<li>
 	 		<a href="/Index/turnout.html">
 	 			<img src="/Public/home/wap/images/cen01-iocn.png">
 	 			<p>转出</p>
 	 		</a>
 	 	</li>
 	 	<li class="bgb">
 	 		<a href="/Growth/Intro.html">
 	 			<img src="/Public/home/wap/images/cen02-iocn.png">
 	 			<p>转入</p>
 	 		</a>
 	 	</li>
 	 	<li class="bga">
 	 		<a href="/Growth/Purchase.html">
 	 			<img src="/Public/home/wap/images/cen03-iocn.png">
 	 			<p>买入</p>
 	 		</a>
 	 	</li>
 	 	<li class="bgc">
 	 		<a href="/Trading/SellCentr.html">
 	 			<img src="/Public/home/wap/images/cen04-iocn.png">
 	 			<p>卖出</p>
 	 		</a>
 	 	</li>
 	 	<li class="bgd">
 	 		<a href="/Turntable/index.html">
 	 			<img src="/Public/home/wap/images/cen05-iocn.png">
 	 			<p>数字资产</p>
 	 		</a>
 	 	</li>
       
       <li>
 	 		<a href="/Index/exehange.html">
 	 			<img src="/Public/home/wap/images/cen12-iocn.png">
 	 			<p>积分兑换</p>
 	 		</a>
 	 	</li>
       
       
       <li class="bga">
 	 		<a href="/User/Sharecode.html">
 	 			<img src="/Public/home/wap/images/cen11-iocn.png">
 	 			<p>分享</p>
 	 		</a>
 	 	</li>    
                     
        <li class="bgc">
 	 		<a href="/User/Teamdets.html">
 	 			<img src="/Public/home/wap/images/cen10-iocn.png">
 	 			<p>团队</p>
 	 		</a>
 	 	</li>                    
                    
       <li class="bge">
 	 		<a href="/Shop/home/index.html">
 	 			<img src="/Public/home/wap/images/cen07-iocn.png">
 	 			<p>商城</p>
 	 		</a>
 	 	</li>
 	 </ul>
 </div>
</div>


<?php if(($can_get) > "0"): ?><div class="big_width100" id="hide_none">
		<div class="qindHB">
			<div class="qindHB_nb">
				<img src="/Public/home/wap/images/hongbaoyem.png" class="qinb_imga">
				<a href="javascript:void(0);" id="hide">
					<img src="/Public/home/wap/images/cunryue.png">
				</a>
				<div class="qiandHB_wz">
					<h3><span  class="getnums"><?php echo (showtwo($can_get)); ?></span>元</h3>
					<p>天天签到红包不断</p>
				</div>
			</div>
		</div>
		<div class="qindHB_bg"></div>
	</div><?php endif; ?>

  <script type="text/javascript">


           $(document).ready(function(){
  
     $(".xianzjiaoy").click(function(){
         msg_alert("还未开启");
        });
      $(".quanxian").click(function(){
         msg_alert("您无权限访问");
        });

    });
</script>

<script type="text/javascript">
    $("#hide").click(function(){
        var yue = Number($('.yue').text());
        var jifen = Number($('.jifen').text());
		var getnums = Number($('.getnums').text());//可获得金额
		var releasey = (yue + getnums).toFixed(2);
		var releasej = (jifen - getnums).toFixed(2);;
		$.ajax({
			url:'Index/index',
			type:'post',
			data:{'getnums':getnums},
			datatype:'json',
			success:function (mes) {
				if(mes.status == 1){
                    //alert(mes.message);
				    msg_alert(mes.message,mes.url);
                    $("#hide_none").hide(1000);
                    //加余额-减少银积分
                    $('.yue').text(releasey);
                    $('.jifen').text(releasej);
				}else{

                    msg_alert(mes.message);
                }
            }
		})
    });
</script>

<script type="text/javascript">
    var glide = $('.slider').glide({
        //autoplay:true,//是否自动播放 默认值 true如果不需要就设置此值
        animationTime:500, //动画过度效果，只有当浏览器支持CSS3的时候生效
        arrows:false, //是否显示左右导航器
        arrowsWrapperClass: "arrowsWrapper",//滑块箭头导航器外部DIV类名
        arrowMainClass: "slider-arrow",//滑块箭头公共类名
        arrowRightClass:"slider-arrow--right",//滑块右箭头类名
        arrowLeftClass:"slider-arrow--left",//滑块左箭头类名
        arrowRightText:">",//定义左右导航器文字或者符号也可以是类
        arrowLeftText:"<",

        nav:true, //主导航器也就是本例中显示的小方块
        navCenter:true, //主导航器位置是否居中
        navClass:"slider-nav",//主导航器外部div类名
        navItemClass:"slider-nav__item", //本例中小方块的样式
        navCurrentItemClass:"slider-nav__item--current" //被选中后的样式
    });
</script>

<!--扫一扫调用-->
<script>
	function Dosaoyisao() {
        qrcodeCallback();
    }
    function qrcodeCallback(result){
		window.location.href=result;
    }
</script>
</body>

</html>