<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("jrecord")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<link rel="stylesheet" href="/Public/home/wap/layui/css/layui.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script src="/Public/home/wap/layui/layui.js"></script>
<body class="bg96">
    <div class="header">
        <div class="header_l">
        <a href="<?php echo U('Turntable/Transaction');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
        </div>
           <div class="header_c"><h2><?php echo (L("jrecord")); ?></h2></div>
            <div class="header_r" ><a href="javascript:void(0)" id="hide" ><img src="/Public/home/wap/images/youmore_n1.png" alt=""></a>
               <div id="p1">
                     <div class="down"></div>
                     <div class="xsh">
                             <ul class="coin">

                            <li><a href="<?php echo U('Turntable/Transreocrds',array('cid'=>1));?>"></a></li>
                            <li><a href="<?php echo U('Turntable/Transreocrds',array('cid'=>2));?>">比特币</a></li>
                            <li><a href="<?php echo U('Turntable/Transreocrds',array('cid'=>3));?>">菜特币</a></li>
                            <li><a href="<?php echo U('Turntable/Transreocrds',array('cid'=>4));?>">以太坊</a></li>
                            <li class="off"><a href="<?php echo U('Turntable/Transreocrds',array('cid'=>5));?>">狗狗币</a></li>
                          
                            </ul>
                    </div>
                    <div class="reveal-modal-bg"></div>
                </div>
             </div>
    </div>

       <div class="big_width100">
            


                <div class="yugejil"  style="width: 100%;position: absolute;top:51px;" >
                    <p style="width:15%;"><?php echo (L("leix")); ?></p>
                    <p style="width:12%;"><?php echo (L("duif")); ?></p>
                    <p style="width:30%;"><?php echo (L("sl")); ?></p>
                    <p style="width:15%;"><?php echo (L("zj")); ?></p>
                    <p style="width:25%;"><?php echo (L("sj")); ?></p>
                 
                </div>

                <div id="wrapper" style="width: 100%;position: absolute;top:91px;" >
                    <div class="scroller">
                        <ul>
                        
                            <?php if(is_array($list)): foreach($list as $key=>$v): $arrayn=array(1=>"",2=>"比特币",3=>"莱特币",4=>"以太坊",5=>"狗狗币"); $uu=$arrayn[$v['cid']];?>
                            <li>
            <p style="width:15%;"><?php if(($v['type']) == "2"): echo (L("chushou")); else: echo (L("purchase")); endif; ?></p>
            <p style="width:15%; 
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;"><?php if(($v['type']) == "2"): echo ($v['buy_uname']); else: ?>
<?php
$susername=D("user")->where("userid=".$v['sell_id'])->getField("username"); echo $susername; endif; ?></p>
            <p style="width:26%;"><?php echo ($v['num']); echo ($uu); ?></p>
            <p style="width:14%;"><?php echo ($v['tprice']); ?></p>
            <p style="line-height:160%;width:25%;float: right;padding-right:0.3rem;"><?php echo (date('Y-m-d H:i:s',$v['create_time'])); ?></p>
                            </li><?php endforeach; endif; ?>

                        </ul>
                     
                      <!--   <div class="more"><i class="pull_icon"></i><span>上拉加载...</span></div> -->
                    </div>
                </div>

    </div>

     



           
                 
         
        
           
      

</div>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#hide").click(function(){
                    $("#p1").toggle(); //toggle() 方法切换元素的可见状态。 如果被选元素可见,则隐藏这些元素,如果被选元素隐藏,则显示这些元素。
                });
            });

            $('.reveal-modal-bg').click(function () {
                $("#p1").toggle();
            })

            $('.coin').click(function () {
                $("#p1").toggle();
            })
         </script>
        

</body>

</html>