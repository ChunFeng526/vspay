<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,minimal-ui">
  <title><?php echo ($config['SITE_TITLE']); ?></title>
  <link rel="stylesheet" href="/Public/Public/css/style1.css">
  <link rel="stylesheet" href="/Public/Public/icon/iconfont.css">
  <link rel="stylesheet" href="/Public/Public/icon1/iconfont.css">

  <!-- 轮播图 -->
  <script type="text/javascript" src="/Public/Public/js/swiper.min.js"></script>
  <script type="text/javascript" src="/Public/Public/js/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="/Public/Public/js/jquery.touchSlider.js"></script>
  <script type="text/javascript" src="/Public/Public/js/js.js"></script>
	<style>
	.h_kong{display:block; width:100%; height:4vmin; background-color:#f5f5f5; clear:both;}
    .js_div{width:100%; margin-top:2vmin;}
	.js_div h1{display:inline-block; margin-left:4vmin; margin-top:4vmin; font-size:4vmin; margin-bottom:3vmin;}
	.js_content{display:block; padding:2vmin 5vmin; padding-bottom:0; font-size:3.5vmin; color:#666; line-height:6vmin; text-align:justify; text-justify:inter-ideograph; font-family: "Tohoma,Arial";}
	.js_content p{margin-top:2vmin; margin-bottom:4vmin; 
	line-height:6vmin; 
	text-align:justify; 
	text-justify:inter-ideograph;
	color:#444;
	font-family: "Tohoma,Arial";
	}
	.js_content img{display:inline-block; clear:both; max-width:90vmin; margin:0 auto; margin-bottom:4vmin; align:center;}
	.vp_player{
		width: 100%;
    height: 100%;
	min-height:100vmin;
	background-color:#000;
	overflow:hidden;
		}
	.vp_kong{display:block; clear:both; width:100%; height:4vmin; background-color:#fff;}
	.vp_player iframe{width:100%; height:100%; min-height:60vmin; }
    </style>
</head>
<body style="background-color:#fff;">
  <!-- 轮播图 -->
    <div class="fxm_header">
       <div class="fxm_left"><a href="index.html"><img src="/Public/Public/images/left0.png"></a></div>
       <div class="fxm_center">商城首页</div>
       <!-- <div class="fxm_right"><img src="/Public/Public/images/zf.png"></div> -->
    </div>

    <div class="main-content ng-scope" id="main_content">
        <div class="main_visual">
            <div class="flicking_con">
                <a href="#"></a>
                <a href="#"></a>
                <!-- <a href="#"></a>
                <a href="#"></a> -->
            </div>
            <div class="main_image">
                <ul>
                    <li><span class="img_3"><img src="/Public/Public/images/banner.jpg"></span></li>
                    <li><span class="img_4"><img src="/Public/Public/images/bannerone.png"></span></li>
                   <!--  <li><span class="img_1"><img src="/Public/Public/images/bannertwo.png"></span></li>
                    <li><span class="img_5"><img src="/Public/Public/images/bannerthree.png"></span></li> -->
                </ul>

                <a href="javascript:;" id="btn_prev"></a>
                <a href="javascript:;" id="btn_next"></a>
            </div>
        </div>
 <!--        <form id="search">
   <input type="text" placeholder="跑鞋" id="sou">
   <span><i class="iconfont"></i></span>
 </form> -->
    </div>
    <!-- 轮播图 -->


    <!-- 下分类 -->
   <!--  <div class="type">
      <ul>
        <?php if(is_array($menuList)): foreach($menuList as $key=>$menu): ?><li>
          <a href="<?php echo U('/Shop/Home/mend',array('id'=>$menu['id']));?>">
            <span><img src="<?php echo ($menu['pic']); ?>"></span>
            <p><?php echo ($menu['name']); ?></p>
          </a>
        </li><?php endforeach; endif; ?>
      </ul>
    </div> -->
    <div class="type">
      <ul>
        <li>
          <a href="<?php echo U('dianpu/businesslist');?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e7bd36a2f.png"></span>
            <p>入驻商家</p>
          </a>
        </li><li>
          <a href="<?php echo U('shop/Home/mend',array('sta'=>1));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e7d381d77.png"></span>
            <p>爆款商品</p>
          </a>
        </li><li>
          <a href="<?php echo U('shop/Home/mend',array('sta'=>2));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e7e305882.png"></span>
            <p>最新商品</p>
          </a>
        </li><li>
          <a href="<?php echo U('shop/Home/mend',array('sta'=>3));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e7f620653.png"></span>
            <p>推荐商品</p>
          </a>
        </li><li>
          <a href="<?php echo U('shop/Home/mend',array('sta'=>4));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e81283eb5.png"></span>
            <p>全部商品</p>
          </a>
        </li><!-- <li>
          <a href="<?php echo U('shop/Home/balance');?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e83c6be9f.png"></span>
            <p>余额买卖</p>
          </a>
        </li> --><li>
          <a href="<?php echo U('/Shop/member/mine');?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e84cb975b.png"></span>
            <p>会员中心</p>
          </a>
        </li><!-- <li>
          <a href="<?php echo U('/Shop/Home/jieshao',array('ids'=>5));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e868ae88d.png"></span>
            <p>介绍</p>
          </a>
        </li> --><li>
          <a href="<?php echo U('/Shop/Home/jieshao',array('ids'=>3));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e87cdc0d0.png"></span>
            <p>帮助中心</p>
          </a>
        </li><li>
          <a href="<?php echo U('/Shop/Home/jieshao',array('ids'=>4));?>">
            <span><img src="/Public/Public/Uploads/image/touxiang/2017-12-26/5a41e88b8dd5a.png"></span>
            <p>商城介绍</p>
          </a>
        </li>      </ul>
    </div>
    <!-- 下分类完 -->
<div class="h_kong"></div>
<div class="js_div"><!-- <h1><?php echo ($jieshao["title"]); ?></h1> --><!-- <h1>介绍</h1> --></p>
<!--<?php if(($jieshao['tid'] == 5) ): ?>-->
<!--<div align="center" class="vp_player">-->
	<!--<iframe  src='<?php echo ($jieshao["linkone"]); ?>' frameborder=0 'allowfullscreen'></iframe>-->
    <!--<div class="vp_kong"></div>-->
    <!--<iframe  src='<?php echo ($jieshao["linktwo"]); ?>' frameborder=0 'allowfullscreen'></iframe>-->
<!--</div>-->

<!--<?php else: ?>-->
<!--<?php endif; ?>-->

<!--<div class="js_content"><?php echo (htmlspecialchars_decode($jieshao["content"])); ?></div>-->
<!---->
<!--</div>-->





<div style="height:20vmin;float: left;display: block;width: 100%;"></div>

  <?php $name= ACTION_NAME; ?>
<!-- 底部 -->

<style type="text/css">
    .footer a p{
            box-sizing:content-box;
            color: #333333;
    }

    .footer a{
            box-sizing:content-box;

    }

    .footer{
            box-sizing:content-box;
    }
</style>
<div class="footer">
    <a href="<?php echo U('/Shop/Home/index');?>" <?php if(($name) == "index"): ?>class="onb"<?php endif; ?>>
        <i class="iconfont"></i>
        <p>首页</p>
    </a>
     <a href="<?php echo U('/Shop/Home/cation');?>" <?php if(($name) == "cation"): ?>class="onb"<?php endif; ?>>
        <i class="iconfont"></i>
        <p>店铺分类</p>
    </a>
     <a href="<?php echo U('/Shop/Car/shopping');?>" <?php if(($name) == "shopping"): ?>class="onb"<?php endif; ?>>
        <i class="iconfont"></i>
        <p>购物车</p>
    </a>
     <a href="<?php echo U('/Shop/member/mine');?>" <?php if(($name) == "mine"): ?>class="onb"<?php endif; ?>>
        <i class="iconfont"></i>
        <p>我的</p>
    </a>
</div>



</body>
</html>