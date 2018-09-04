<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("gbszzx")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>



<body class="bg96">
	<div class="header">
	    <div class="header_l">
	    <a href="javascript:history.back(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo (L("gbszzx")); ?></h2></div>
	    <div class="header_r"></div>
	</div>

       <div class="big_width100">
	       
	     <div class="Wbaozx">
	     	<p><?php echo (L("zrsy")); ?><img src="/Public/home/wap/images/denbgji_0<?php echo ($grade); ?>.png"></p>
	     	<h3><?php echo ((isset($lastsy) && ($lastsy !== ""))?($lastsy):"0.0000"); ?></h3>

	     </div>
	     <div class="Wbaozx_bott">
	     	<p><?php echo (L("gbzzc")); ?><br/><span><?php echo ($wbtotal); ?></span></p>
	     	<a href="<?php echo U('Turntable/WBDongjie');?>" style="color:#fff;"><p class="kyzc"><?php echo (L("kyzc")); ?><br/><?php echo ($wbc); ?></p></a>
	     </div>

	       <div class="wtreas_order_titel clear_wl">
			   <a href="<?php echo U('Turntable/Wbaobei',array('step'=>1));?>"   <?php if(($step) == "1"): ?>class="wundone_OT_l fl noe"<?php else: ?>class="wundone_OT_l fl"<?php endif; ?>>
               <?php echo (L("syjl")); ?>
       			</a>
       			<a href="<?php echo U('Turntable/Wbaobei',array('step'=>2));?>" <?php if(($step) == "2"): ?>class="wundone_OT_l fl noe"<?php else: ?>class="wundone_OT_l fl"<?php endif; ?>>
               <?php echo (L("zcjl")); ?>
       			</a>
       			<a href="<?php echo U('Turntable/Wbaobei',array('step'=>3));?>"  <?php if(($step) == "3"): ?>class="wundone_OT_l fl noe"<?php else: ?>class="wundone_OT_l fl "<?php endif; ?>>
               <?php echo (L("record")); ?>
       			</a>

       	  </div>
       

      <div class="zwshj">



           <div class="yugejil"  style="width: 100%;position: absolute;top:263px;" >
            <?php if(($step) == "2"): ?><p style="width:46%;"><?php echo (L("sl")); ?></p>
              <p style="width:54%;"><?php echo (L("sj")); ?></p>
            <?php else: ?>                     

              <p style="width:28%;"><?php echo (L("ly")); ?></p>
              <p style="width:28%;"><?php echo (L("sl")); if(($step) == "1"): ?>(<?php echo (L("jjf1")); ?>)<?php endif; ?></p>
              <p style="width:44%;"><?php echo (L("sj")); ?></p><?php endif; ?>           
         </div>



        <?php  if($list){ ?>

             <div id="wrapper1" style="width: 100%;top:303px;" >
                  <div class="scroller">
                      <ul>
                           <?php if(is_array($list)): foreach($list as $key=>$v): ?><li>
                                   <?php if(($step) == "2"): ?><p style="width:46%;"><?php echo ($v['num']); ?></p>
                                      <p style="width:54%;"><?php echo (date('Y-m-d H:i:s',$v['create_time'])); ?></p>  
                                     
                                    <?php else: ?>
                                     <p style="width:28%;">
                                      <?php if(($step) == "1"): if(($v["type"]) == "3"): echo (L("jtsy")); else: echo (L("dtsy")); endif; ?>

                                      <?php else: ?>
                                          <?php if(($v["crowds_id"]) == "0"): echo (L("zichan")); else: echo (L("zhongchou")); endif; endif; ?>
                                  </p>
                                    <p style="width:28%;"><?php echo ($v['num']); ?></p>
                                      <p style="width:44%;"><?php echo (date('Y-m-d H:i:s',$v['create_time'])); ?></p><?php endif; ?>  

                                  </li><?php endforeach; endif; ?>

                               

                      </ul>
                   
                    <!--   <div class="more"><i class="pull_icon"></i><span>上拉加载...</span></div> -->
                  </div>
              </div>

              
      <?php  }else{ echo "<span style='color:#666;line-height:400%;'>".L('mzdxgjl')."</span>"; } ?>




         </div>



           


	   </div>



	    <div class="wtjiaoycaozd">
		    <div class="wtjiaoycaoz clear_wl">
	       			<a href="<?php echo U('Turntable/WbaoIn');?>" class=" fl cznoe" id="cuanjdd1"><?php echo (L("tochangeinto")); ?></a>
	       			<a href="<?php echo U('Turntable/WbaoOut');?>" class=" fl " id="cuanjdd2"><?php echo (L("turnout")); ?></a>
	       			
	       	  </div>
       	</div>


       	<!-- <script type="text/javascript">
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
        </script> -->

	    

</body>

</html>