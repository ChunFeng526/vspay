<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<script src="../../../../jubaozuang/jubao/Themes/Home/nc/Public/js/JdClick.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("addbankcard")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js" ></script>
<script type="text/javascript" src="/Public/home/common/js/index.js"></script>

<body class="bg96">

<div class="header">
	<div class="header_l">
		<a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	</div>
	<div class="header_c"><h2><?php echo (L("addbankcard")); ?></h2></div>
	<div class="header_r"></div>
</div>

<div class="big_width100">
	<div class="tips">*<?php echo (L("addcard2")); ?></div>
	<div class="add_bank_add_gr">
		<div class="fill_sty add_gr_b10">
			<p><?php echo (L("cardholdername")); ?></p>
			<input type="text" name="other_account" placeholder="<?php echo (L("cardholdername")); ?>" autocomplete="off" id="crkxm">
		</div>
		<div class="fill_sty add_gr_b10">
			<p>开户银行</p>
			<div class="demo">
				<select class="select" isval="true" msg="<?php echo (L("addcard3")); ?>" id="khy">
					<option value="0" selected><?php echo (L("addcard3")); ?></option>
					<?php if(is_array($bakinfo)): foreach($bakinfo as $key=>$v): ?><option value="<?php echo ($v['pid']); ?>"><?php echo ($v['banq_genre']); ?></option><?php endforeach; endif; ?>
				</select>
			</div>
		</div>
		<!--开户名-->
		<div class="fill_sty add_gr_b10">
			<p><?php echo (L("cardnum")); ?></p>
			<input type="text" name="other_account" placeholder="<?php echo (L("addcard4")); ?>" autocomplete="off" id="yhk">
		</div>
		<div class="fill_sty add_gr_b10 mababno">

			<p><?php echo (L("openbranch")); ?></p>
			<input type="text" name="other_account" placeholder="<?php echo (L("addcard5")); ?>" autocomplete="off" id="khzy">
		</div>
	</div>

	<label class="label_check" for="checkbox-01">
		<input name="sample-checkbox-01" id="checkbox-01" value="1" type="checkbox" checked=""><?php echo (L("setasdefaul")); ?>
	</label>

	<div class="buttonGeoup">
		<a href="#" class="not_next" id="confirm"><?php echo (L("termine")); ?></a>
	</div>



</div>
<!-- 提示不能为空 -->
<script type="text/javascript">

    $('#confirm').on('click', function(){
        var crkxm =$.trim($('#crkxm').val()); //姓名
        if(crkxm == ''){
            msg_alert('请填写持卡人姓名');
            return;
        }
        var khy =$.trim($('#khy').val()); //开户行
        if(khy==0){
            msg_alert('请选择开户行');
            return;
        }
        var yhk =$.trim($('#yhk').val()); //银行卡
        // var pattern = /^([1-9]{1})(\d{14}|\d{18})$/;
        // if(!pattern.test(yhk)){
        //     msg_alert('银行卡号输入不正确');
        //     return;
        // }
        var khzy =$.trim($('#khzy').val()); //开户支行

        if(khzy == ''){
            msg_alert('开户银行支行分行输入有误');
            return;
        }

        $.post("<?php echo U('Growth/Addbank');?>",{crkxm:crkxm,khy:khy,yhk:yhk,khzy:khzy},function(mes){
            if(mes.status == 1){
                msg_alert(mes.message,mes.url);
            }else{
                msg_alert(mes.message);
            }
        },"json");
    });
</script>

<script src="/Public/home/wap/js/ansel_select.js"></script>
<!--input  type="checkbox"  美化 -->
<script>
    function setupLabel() {
        if ($('.label_check input').length) {
            $('.label_check').each(function(){
                $(this).removeClass('c_on');
            });
            $('.label_check input:checked').each(function(){
                $(this).parent('label').addClass('c_on');
            });
        };
        if ($('.label_radio input').length) {    /////
            $('.label_radio').each(function(){
                $(this).removeClass('r_on');
            });
            $('.label_radio input:checked').each(function(){
                $(this).parent('label').addClass('r_on');
            });
        };
    };
    $(document).ready(function(){
        $('body').addClass('has-js');
        $('.label_check, .label_radio').click(function(){
            setupLabel();
        });
        setupLabel();
    });

</script>
<script>
    //插件初始化配置
    $('.select').anselcfg({});
</script>

<style type="text/css">
    
    .ansel_search{border-bottom: 1px solid #ff0000;}
    .ansel_search input:-ms-input-placeholder{color:#ff0000}
    .ansel_searchinput:-moz-placeholder{color:#ff0000}
    .ansel_search input::-webkit-input-placeholder{color:#ff0000}
    .demo{ margin-bottom: 0px;}
    .tips{ margin: 10px 0; }
</style>

</body>

</html>