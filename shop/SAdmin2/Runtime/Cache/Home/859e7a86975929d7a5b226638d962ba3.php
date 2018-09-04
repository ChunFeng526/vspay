<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("tochangeinto")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js" ></script>

<body class="bg96 bg_blue">
	
	<div class="header">
	    <div class="header_l" style="width:33.3%;">
	    <a href="<?php echo U('Index/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c" style="width:33.3%;"><h2><?php echo (L("tochangeinto")); ?></h2></div>
	    <div class="header_r" style="width:33.3%;"><a href="/Growth/test?filename=.<?php echo ($urel); ?>"><?php echo (L("saveimg")); ?></a></div>
	</div>

       <div class="big_width">
	       
	     <div class="qrCodeGro">
	     	<p><?php echo (L("scanpaysme")); ?></p>
	     	<img src="<?php echo ($urel); ?>" class="qr_img">

	     </div>
	     <div class="intoButt">
	     	<a href="<?php echo U('Growth/Introrecords');?>"><?php echo (L("record")); ?></a>
	     </div>
	   </div>
</body>

</html>