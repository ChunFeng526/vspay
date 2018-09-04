<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("salescenter")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<body class="bg96">
<div class="header">
    <div class="header_l">
        <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
    </div>
    <div class="header_c"><h2><?php echo (L("salescenter")); ?></h2></div>
    <!--<div class="header_r"><a href="<?php echo U('Growth/Buyrecords');?>">记录</a></div>-->
</div>

<div class="big_width100">
    <div class="buy_aminy br-b">
        <h4><?php echo (L("djxzppje")); ?></h4>
        <ul class="clear_wl investment_title">
            <li class="buyChecked on"><span>500</span></li>
            <li class="buyChecked"><span>1000</span></li>
            <li class="buyChecked"><span>3000</span></li>
            <li class="buyChecked"><span>5000</span></li>
            <li class="buyChecked"><span>10000</span></li>
            <li class="buyChecked"><span>30000</span></li>
        </ul>
    </div>

    <div class="investment_f">
        <div class="investment_con">
            <div class="investment_con_list">
            </div>
        </div>
    </div>
</div>

<!--浮动层-->
<div class="ftc_wzsf">
    <div class="srzfmm_box">
        <div class="qsrzfmm_bt clear_wl">
            <img src="/Public/home/wap/images/xx_03.jpg" class="tx close fl">

            <span class="fl"><?php echo (L("input_pwd")); ?></span></div>
        <div class="zfmmxx_shop">
        </div>
        <ul class="mm_box">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="numb_box">
        <div class="xiaq_tb">
            <img src="/Public/home/wap/images/jftc_14.jpg" height="10"></div>
        <ul class="nub_ggg">
            <li><a href="javascript:void(0);" class="zf_num">1</a></li>
            <li><a href="javascript:void(0);" class="zj_x zf_num">2</a></li>
            <li><a href="javascript:void(0);" class="zf_num">3</a></li>
            <li><a href="javascript:void(0);" class="zf_num">4</a></li>
            <li><a href="javascript:void(0);" class="zj_x zf_num">5</a></li>
            <li><a href="javascript:void(0);" class="zf_num">6</a></li>
            <li><a href="javascript:void(0);" class="zf_num">7</a></li>
            <li><a href="javascript:void(0);" class="zj_x zf_num">8</a></li>
            <li><a href="javascript:void(0);" class="zf_num">9</a></li>
            <li><a href="javascript:void(0);" class="zf_empty"><?php echo (L("emptya")); ?></a></li>
            <li><a href="javascript:void(0);" class="zj_x zf_num">0</a></li>
            <li><a href="javascript:void(0);" class="zf_del"><?php echo (L("deleteo")); ?></a></li>
        </ul>
    </div>
    <div class="hbbj"></div>
</div>

<script type="text/javascript">

    $(function () {
        /*tab标签切换*/
        function tabs(tabTit, on, tabCon) {
            $(tabCon).each(function () {
                $(this).children().eq(0).show();
            });
            $(tabTit).each(function () {
                $(this).children().eq(0).addClass(on);
            });

            $(tabTit).children().click(function () {
                $(this).addClass(on).siblings().removeClass(on);
                var index = $(tabTit).children().index(this);
                $(tabCon).children().eq(index).show().siblings().hide();
                Ischecked();
            });
        }

        tabs(".investment_title", "on", ".investment_con");
        Ischecked();


    })

    //执行购买操作
    function Buyit(e) {
        var trid = $(e).attr('data-id');
        if(trid == ''){
            msg_alert('请选择对应数量买入');
        }
        $(".ftc_wzsf").show();
        //----
        var i = 0;
        $(".nub_ggg li .zf_num").click(function () {
            if (i < 6) {
                $(".mm_box li").eq(i).addClass("mmdd");
                $(".mm_box li").eq(i).attr("data", $(this).text());
                i++
                if (i == 6) {
                    setTimeout(function () {
                        var pwd = "";
                        $(".mm_box li").each(function(){
                            pwd += $(this).attr("data");
                        });
                        //AJAX提交数据
                        var sellnums = $.trim($('.on').text()); //账号  //.trim() 去空格判断
                        var cardid = $('.carnumber').val();//银行卡id
                        var exg = /^[1-9]\d*|0$/;
                        if (!exg.test(sellnums)) {
                            msg_alert('请选择买入金额~');
                            return;
                        }
                        if (cardid == '') {
                            msg_alert('请选择银行卡');
                            return;
                        }
                        $.ajax({
                            url:'/Trading/Dosells',
                            type:'post',
                            data:{'trid':trid,'pwd':pwd},
                            datatype:'json',
                            success:function (mes) {
                                if(mes.status == 1){
                                    msg_alert(mes.message);
                                    Ischecked();
                                    $(".ftc_wzsf").hide();
                                    $(".mm_box li").removeClass("mmdd");
                                    $(".mm_box li").attr("data","");
                                    i = 0;
                                }else{
                                    msg_alert(mes.message);
                                    $(".mm_box li").removeClass("mmdd");
                                    $(".mm_box li").attr("data","");
                                    i = 0;
                                }
                            }
                        })
                    }, 100);
                };
            }
        });

        $(".xiaq_tb").click(function () {
            $(".numb_box").slideUp(500);
        });
        $(".mm_box").click(function () {
            $(".numb_box").slideDown(500);
        });

        $(".close").click(function () {
            $(".ftc_wzsf").hide();
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data", "");
            i = 0;
        });
        $(".nub_ggg li .zf_del").click(function () {
            if (i > 0) {
                i--
                $(".mm_box li").eq(i).removeClass("mmdd");
                $(".mm_box li").eq(i).attr("data", "");
            }
        });

        $(".nub_ggg li .zf_empty").click(function () {
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data", "");
            i = 0;
        });
    }

    function Ischecked() {
        var mvalue = Number($('.on').text());
        if(mvalue == ''){
            msg_alert('请选择订单金额');
            return false;
        }
        //传值返回
        $.ajax({
            url:'/Trading/Selldets',
            type:'post',
            data:{'mvalue':mvalue},
            datatype:'json',
            success:function (mes) {
                var str = '';
                if(mes.status == 1){
                    $.each(mes.message, function (key, val) {
                        str += '<div class="sell_annal_ul">';
                        str += '<div class="sell_annal_ul_l">';
                        str += '<img src="/Public/home/wap/heads/' +val.img_head+ '" alt="" class="tuoux">';
                        str += '<div class="sell_annal_p">';
                        str += '<p><span>'+val.username+'</span></p>';
                        str += '<p>信用';

                        for (var i=0;i<=val.user_credit;i++)
                        {
                            str += '<span><img src="/Public/home/wap/images/aix-icon.png"></span>';
                        }
                        // str += '<span><img src="/Public/home/wap/images/aix-icon.png"></span>';
                        // str += '<span><img src="/Public/home/wap/images/aix-icon.png"></span>';
                        // str += '<span><img src="/Public/home/wap/images/aix-icon.png"></span>';
                        // str += '<span><img src="/Public/home/wap/images/aix-icon.png"></span>';

                        str += '</p>';
                        str += '</div></div>';
                        str += '<div class="sell_annal_ul_r">';
                        str += '<p><span>交易金额' +val.pay_nums+ '</span></p>';
                        str += '<p>实付金额：' +val.spay+ ' </p>';
                        str += '</div>';
                        str += '<div class="sell_chus">';
                        // str += '<p>支付方式' +val.cardinfo+ '</p>';
                        str += '</div>';
                        str += '<div class="sell_chusa">';
                        str += '<a href="javascript:void(0)" onclick="Buyit(this)" data-id =' +val.id+'>卖出</a>';
                        str += '</div></div>';
                        str += '</tr>';
                    });
                    $('.investment_con  .investment_con_list').html(str);
                }else{
                    str += '<div class="annalWa">';
                    str += '<p>没找到相关记录</p></div>';
                    $('.investment_con  .investment_con_list').html(str);
                }
            }
        })
    }

</script>

</body>

</html>