<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo ($title); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<body class="bg96 ">
	
	<div class="header">
	    <div class="header_l">
	    <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo ($title); ?></h2></div>
	    <div class="header_r"></div>
	</div>

     <div class="big_width100">
        <div class="add_bank_add_gr">
	       <div class="fill_sty add_gr_b10">
	       	<p>旧密码</p>
	       	<input type="password" name="password" class="password" placeholder="输入旧密码"   />
	       </div>
	       <div class="fill_sty add_gr_b10 mababno">
	       	<p>新密码</p>
	       	<input type="password" name="password" class="passwordrepat" placeholder="输入新密码"   />
			   <input type="hidden" value="<?php echo ($type); ?>" class="pwdtype">
	       </div>
	     </div>

	        <div class="wangjmim_se">
				<?php if(($type) == "1"): ?><a href="<?php echo U('login/getpsw');?>">忘记登录密码？</a>
					<?php else: ?>
					<a href="<?php echo U('login/getpswpay');?>">忘记支付密码？</a><?php endif; ?>
	        </div>

	       <div class="buttonGeoup">
	       		<a href="javascript:void(0)" class="not_next ljzf_but ">确定</a>
	       </div>
	</div>

	   


</body>

</html>
<script>
	$('.ljzf_but').click(function () {
		var pwd = $('.password').val();
		var pwdrpt = $('.passwordrepat').val();
		var pwdtype = $('.pwdtype').val();
		if(pwd == ''){
            msg_alert('旧密码不能为空哦~');
        }
		if(pwdrpt == ''){
            msg_alert('新密码不能为空哦');
            return;
		}
		if(pwdtype == 2){
			//交易密码必须为6位纯数字
            var reg = /^\d{6}\b/;
            if(!reg.test(pwdrpt)){
                msg_alert('交易密码只能为6位数');
                return false;
            }
		}
        $.ajax({
            url:'/User/Setpwd',
            type:'post',
            data:{'pwd':pwd,'pwdrpt':pwdrpt,'pwdtype':pwdtype},
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