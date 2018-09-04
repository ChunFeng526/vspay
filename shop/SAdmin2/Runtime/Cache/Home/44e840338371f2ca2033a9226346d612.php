<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>分享好友</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>

<body class="bg96 bg_blue">
	<div class="header">
	    <div class="header_l" style="width:33.3%;">
	    <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c" style="width:33.3%;"><h2>分享好友</h2></div>
	    <div class="header_r" style="width:33.3%;"><a href="/Growth/test?filename=.<?php echo ($urel); ?>" >保存二维码</a></div>
	</div>

       <div class="big_width80">
	     <div class="qrCodeGro qrCodeGroa">
	     	<img src="<?php echo ($urel); ?>">
	     	<p class="mt40">扫描二维码即可分享好友哟</p>
	     </div>

	     <div class="fxfuzanj">
             <span hidden id="txt"><?php echo ($aurl); ?></span>
             <a href="javascript:void(0)"  onclick="copyUrl();" >复制下载地址</a>
         </div>

	     <div class="intoButt mt30 mb30">
	     	<a href="<?php echo U('User/Teamdets');?>">分享记录</a>
	     </div>
	   </div>
    <script type="text/javascript">
        function copyUrl()
        {
            var txt=$("#txt").text();
            copy(txt);
        }

        function copy(message) {
            var input = document.createElement("input");
            input.value = message;
            document.body.appendChild(input);
            input.select();
            input.setSelectionRange(0, input.value.length), document.execCommand('Copy');
            document.body.removeChild(input);
            alert("复制成功哦");
        }
    </script>

</body>
</html>