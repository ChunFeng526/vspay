<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("gbzr")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">

<link rel="stylesheet" href="/Public/home/wap/css/float.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>

<body class="bg96">
	<div class="header">
	    <div class="header_l">
	    <a href="javascript:history.back(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo (L("gbzr")); ?></h2></div>
	    <div class="header_r"></div>
	</div>

       


       <div class="big_width200">
         <div class="fill_sty">
          <p style="width:100%;color: #666;"><?php echo (L("dqgpzc")); ?>:<span style="margin-left:0.3rem;font-weight: bold;color: #333;"><?php echo ($mwenums); ?></span></p>
    
         </div>
          <div class="fill_sty">
          <p><?php echo (L("zrsl")); ?></p>
            <input type="text" name="num" class="paynums" placeholder="<?php echo (L("ksrzdswxs")); ?>" autocomplete="off">
         </div>
         <div class="buttonGeoup">
            <a href="javascript:void(0)" class="not_next" id="operConfirm"><?php echo (L("termine")); ?></a>
         </div>

       <!--浮动层SS-->
       <div class="ftc_wzsf" >
         <div class="srzfmm_box">
           <div class="qsrzfmm_bt clear_wl">
             <img src="/Public/home/wap/images/xx_03.jpg" class="tx close fl">
             <span class="fl"><?php echo (L("input_pwd")); ?></span></div>
           <div class="zfmmxx_shop">
             <div class="mz"></div>
             <div class="zhifu_price"></div></div>
           <ul class="mm_box">
             <li></li><li></li><li></li><li></li><li></li><li></li>
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
       <!--浮动层EE-->
     </div>


   



  <script type="text/javascript">
        $('#operConfirm').on('click', function(){
            var paynums=($('.paynums').val());//支付金额
      if(paynums < 0.01){
                msg_alert('请输入正确的转账金额');
                return;
      }
    
      $.ajax({
        url:'/Turntable/WBCheckuser',
        type:'post',
        data:{'paynums':paynums},
        datatype:'json',
        success:function (mes) {
            if(mes.status == 1){
                  
           $(".ftc_wzsf").show();
          }else{
              msg_alert(mes.message);
          }
                
                }

              
      })
        });

 

        // $(function(){
        //出现浮动层
        $(".ljzf_but").click(function(){
            // $(".ftc_wzsf").hide();
        });
        //关闭浮动
        $(".close").click(function(){
            $(".ftc_wzsf").hide();
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data","");
            i = 0;
        });
        //数字显示隐藏
        $(".xiaq_tb").click(function(){
            $(".numb_box").slideUp(500);
        });
        $(".mm_box").click(function(){
            $(".numb_box").slideDown(500);
        });
        //----
        var i = 0;
        $(".nub_ggg li .zf_num").click(function(){
            if(i<6){
                $(".mm_box li").eq(i).addClass("mmdd");
                $(".mm_box li").eq(i).attr("data",$(this).text());
                i++
                if (i==6) {
                    setTimeout(function(){
                        var pwd = "";
                        $(".mm_box li").each(function(){
                            pwd += $(this).attr("data");
                        });
                        //ajax提交密码以及参数
                        var paynums=($('.paynums').val());//支付金额
                        $.ajax({
                            url:'/Turntable/WBgetin',
                            type:'post',
                            data:{'paynums':paynums,'pwd':pwd},
                            datatype:'json',
                            success:function (mes) {
                                if(mes.status == 1){
                                    msg_alert(mes.message,mes.url);
                                    $(".ftc_wzsf").hide();
                                    $(".mm_box li").removeClass("mmdd");
                                    $(".mm_box li").attr("data","");
                                    i = 0;
                                    $('.paynums').val('');//支付金额
                                    $('.moneyadd').val('');
                                }else{
                                    msg_alert(mes.message);
                                    $(".mm_box li").removeClass("mmdd");
                                    $(".mm_box li").attr("data","");
                                    i = 0;
                                }
                            }
                        })
                    },100);
                };
            }
        });

        $(".nub_ggg li .zf_del").click(function(){
            if(i>0){
                i--
                $(".mm_box li").eq(i).removeClass("mmdd");
                $(".mm_box li").eq(i).attr("data","");
            }
        });

        $(".nub_ggg li .zf_empty").click(function(){
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data","");
            i = 0;
        });
        // });

              $('#cuanjdd1').on('click', function(){

                var tjyhk =$.trim($('#tjyhk').val()); //开户行
            if(tjyhk==0){
                      layer.msg('你当前是使用用户，请最低升级至普通用户！');
                  return;
            }   
          });
        </script>
        <script type="text/javascript">
              $('#cuanjdd2').on('click', function(){

                var tjyhk =$.trim($('#tjyhk').val()); //开户行
            if(tjyhk==0){
                      layer.msg('你当前是使用用户，请最低升级至普通用户！');
                  return;
            }   
          });
        </script>

	    

</body>

</html>