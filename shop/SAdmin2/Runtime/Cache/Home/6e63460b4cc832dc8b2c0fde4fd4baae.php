<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("turnout")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>

<body class="bg96">
	
	<div class="header">
	    <div class="header_l">
	    <a href="<?php echo U('Index/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo (L("turnout")); ?></h2></div>
	    <div class="header_r"><a href="<?php echo U('Index/Turncords');?>"><?php echo (L("zcjl")); ?></a></div>
	</div>

       <div class="big_width100">
	       <div class="fill_sty">
	       	<p><?php echo (L("dfzh")); ?></p>
	       	<input type="number" name="other_account" placeholder="<?php echo (L("srsjhm")); ?>" autocomplete="off" id="phone_uid">
	       </div>
	       <div class="buttonGeoup">

	       	<a href="#" class="not_next" id="ternNextStep"><?php echo (L("nextstep")); ?></a>
	       	<a href="<?php echo U('Index/exehange');?>" class="exchange"><?php echo (L("jfdh")); ?></a>
	       </div>
	   </div>
	     <script type="text/javascript">
          $('#ternNextStep').on('click', function(){
              Checku();
		  });

	   </script>

</body>
</html>