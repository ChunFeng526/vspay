<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("digitalasset")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>

<body class="bg96">

<div class="header">
    <div class="header_l">
        <a href="<?php echo U('Index/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
        <a href="<?php echo U('Index/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
    </div>
    <div class="header_c"><h2><?php echo (L("digitalasset")); ?></h2></div>
    <div class="header_r"><a href="<?php echo U('Turntable/Trans');?>"><?php echo (L("jrecord")); ?></a></div>
</div>

<div class="big_width100">
    <div class="shuzbzonge">
        <img src="/Public/home/wap/images/logo_1.png">
        <p><?php echo (L("nowprice")); ?>：￥<?php echo ($coindets[0]['coin_price']); ?></p>

    </div>

    <div class="wpaeyzic">
        <div class="wpaeyzic_title">
            <p class="clear_wl"><b class="wpae_sta"></b><?php echo (L("zichan")); ?><span><?php echo ((isset($minecoins[0]['c_nums']) && ($minecoins[0]['c_nums'] !== ""))?($minecoins[0]['c_nums']):"0.0000"); ?></span></p>
        </div>
        <div class="wpaeyzic_title">
            <p class="clear_wl"><b class="wpae_stb"></b><?php echo (L("qianbao")); ?></p>
        </div>
        <div class="wpaeyzic_fz">
            <p id="content"><?php echo ($waadd); ?></p>
            <button id="copyBT"><?php echo (L("fzdz")); ?></button>
        </div>

    </div>
    <div class="wpzicicon">
        <ul class="clear_wl">
            <li>
                <a href="<?php echo U('Turntable/turnout');?>">
                    <img src="/Public/home/wap/images/dit4-iocn.png" alt="">
                    <p><?php echo (L("turnout")); ?></p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Turntable/Crowds');?>">
                    <img src="/Public/home/wap/images/dit3-iocn.png" alt="">
                    <p><?php echo (L("zhongchou")); ?></p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Turntable/Wbaobei');?>">
                    <img src="/Public/home/wap/images/dit2-iocn.png" alt="">
                    <p><?php echo (L("cbao")); ?></p>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Turntable/Transaction');?>">
                    <img src="/Public/home/wap/images/dit1-iocn.png" alt="">
                    <p><?php echo (L("jiaoyi")); ?></p>
                </a>
            </li>
        </ul>
    </div>

    <div class="dis_biz">
        <?php if(is_array($coindets)): foreach($coindets as $k=>$v): ?><div class="dis_biz_wp">
                <div class="Dbiz_titie">
                    <p><b class="wpae_stc<?php echo ($k); ?>"></b><?php echo ($v['coin_name']); ?></p>
                </div>

                <?php  $mycoins = M('ucoins')->where(array('c_uid'=>$uid,"cid"=>$v['cid']))->getField('c_nums');?>
                <div class="dis_biz_cop clear_wl">
                    <div class="dis_biz_copa">
                        <p><?php echo ((isset($mycoins) && ($mycoins !== ""))?($mycoins):"0.0000"); ?></p>
                        <p><span><?php echo ($v['coin_name']); ?></span></p>
                    </div>
                    <div class="dis_biz_copb">
                        <p><?php echo ($v['coin_price']); ?></p>
                        <p><span><?php echo (L("nowprice")); ?></span></p>
                    </div>
                    <div class="dis_biz_copc">
                         <a href="<?php echo U('Turntable/transaction',array('cid'=>$v['cid']));?>" class="yugejiaoy"><?php echo (L("jjfjy")); ?></a>
                           <a href="###"   class="xianzjiaoy"><?php echo (L("xjjy")); ?></a>
                       <!--  <a href="<?php echo U('Turntable/Transaction1',array('cid'=>$v['cid']));?>" class="xianzjiaoy">现金交易</a> -->
                       
                    </div>
                </div>

            </div><?php endforeach; endif; ?>

    </div>
</div>

  <!-- <div class="big_width100" >
   
   <div class="qindHB">
     <div class="qindHB_nb">
         <img src="/Public/home/wap/images/hongbaoyema.png" class="qinb_imga">
          <a href="javascript:void(0);" >
            <a href="<?php echo U('Index/index');?>"><img src="/Public/home/wap/images/cunryuea.png"></a>
          </a>
          <div class="qiandHB_wz">
            
          </div>
     </div>
   </div>
   <div class="qindHB_bg"> </div>



 </div> -->
  <script type="text/javascript">


           $(document).ready(function(){
  
     $(".xianzjiaoy").click(function(){
         msg_alert("暂时不支持现金交易");
        });

    });
</script>
<style type="text/css">
    .qindHB_bg{
    top: 0;
    left: 0;
    background: rgba(0,0,0,.6);
    z-index: 100;
    position: fixed;
    height: 100%;
    width: 100%;
}

.qindHB{
    position: absolute;
    z-index: 101;
    padding: 0;
    left: 0;
    top: 0;
    width: 100%;
    opacity: 1;
    
}
.qindHB_nb{
   z-index: 102;
   width: 100%; position: relative;
}

.qindHB_nb a {
    width: 100%; display: block; margin-top: 20px;
}
.qindHB_nb a img{
   z-index: 104;
   width: 100%;
}

.qinb_imga{  height: 22rem;margin: 0 auto; display: block;  margin-top: 2rem; }

.qiandHB_wz{ position:absolute; top:7rem; width: 50%; left: 25%; text-align: center; }
.qiandHB_wz h3{ font-size: 1.8rem; padding-bottom: 1rem; border-bottom: 1px dotted rgba(217, 45, 45, 0.4); color: #d92d2d; line-height: 1.8rem; font-weight: 900;}
.qiandHB_wz p{ font-size: 1rem; color: #d92d2d; line-height: 2.4rem; font-weight: 900;}

</style>


    
    
<script>
    function copyArticle(event) {
        const range = document.createRange();
        range.selectNode(document.getElementById('content'));

        const selection = window.getSelection();
        if (selection.rangeCount > 0) selection.removeAllRanges();
        selection.addRange(range);
        document.execCommand('copy');
        alert("复制成功！");
    }

    document.getElementById('copyBT').addEventListener('click', copyArticle, false);
</script>


</body>

</html>