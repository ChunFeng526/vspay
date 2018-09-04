<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>昵称修改</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">

<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js"></script>

<body class="bg96 ">
	
	<div class="header">
	    <div class="header_l">
	    <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2>昵称修改</h2></div>
	    <div class="header_r"></div>
	</div>

		<div class="big_width100">
			   <div class="nic_xiu">
					 <input type="text" name="username" class="username" value="<?php echo ($uname); ?>" placeholder="请输入昵称" autocomplete="off"/>
			   </div>

			   <div class="buttonGeoup">
					<a href="javascript:void(0)" class="not_next ljzf_but ">确定</a>
			   </div>
		</div>
</body>
</html>
<script>
	$('.ljzf_but').click(function () {
        var uname = $('.username').val();
        if(uname == ''){
            msg_alert('请填写昵称');
        }
        $.ajax({
            url:'/User/Setuname',
            type:'post',
            data:{'uname':uname},
            datatype:'json',
            success:function (mes) {
                if(mes.status == 1){
                    msg_alert(mes.message,mes.url);
                }else{
                    msg_alert(mes.message);
                }
            }
        })
    })

</script>