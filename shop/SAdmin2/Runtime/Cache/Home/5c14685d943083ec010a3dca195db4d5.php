<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("zcxmjl")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<link rel="stylesheet" href="/Public/home/wap/layui/css/layui.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>

<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<script src="/Public/home/wap/layui/layui.js"></script>
<body class="bg96">
	
	<div class="header">
	    <div class="header_l">
	    <a href="<?php echo U('Turntable/Crowds');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo (L("zcxmjl")); ?></h2></div>
	    <div class="header_r"></div>
	</div>

       <div class="big_width100">
            
          
          <div class="investment_f"> 
	          <div class="investment_title">
				  	<div <?php if(($step) == ""): ?>class="on"<?php endif; ?>  > <a href="<?php echo U('Turntable/Crowdrecords');?>"><?php echo (L("gmjl")); ?></a></div>
					<div <?php if(($step) == "1"): ?>class="on"<?php endif; ?>  > <a href="<?php echo U('Turntable/Crowdrecords',array('step'=>1));?>"><?php echo (L("sfjl")); ?></a></div>
		      </div>
            </div>

         <div class="zwshj">



         	 <div class="yugejil"  style="width: 100%;position: absolute;top:111px;" >
         	 	<?php if(($step) != "1"): ?><p style="width:28%;"><?php echo (L("sl")); ?></p>
		        	<p style="width:28%;"><?php echo (L("zj")); ?></p>
		        	<p style="width:44%;"><?php echo (L("sj")); ?></p>
		        <?php else: ?>
		       		<p style="width:46%;"><?php echo (L("sl")); ?></p>
		        	<p style="width:54%;"><?php echo (L("sj")); ?></p><?php endif; ?>           
   			 </div>



    		<?php  if($list){ ?>

					   <div id="wrapper" style="width: 100%;position: absolute;top:151px;" >
					        <div class="scroller">
					            <ul>
					                 <?php if(is_array($list)): foreach($list as $key=>$v): ?><li>
					                         <?php if(($step) != "1"): ?><p style="width:28%;"><?php echo ($v['num']); ?></p>
					                            <p style="width:28%;"><?php echo ($v['tprice']); ?></p>
					                            <p style="width:44%;"><?php echo (date('Y-m-d H:i:s',$v['create_time'])); ?></p>
					                          <?php else: ?>
					                         	<p style="width:46%;"><?php echo ($v['num']); ?></p>
					                            <p style="width:54%;"><?php echo (date('Y-m-d H:i:s',$v['create_time'])); ?></p><?php endif; ?>  

					                        </li><?php endforeach; endif; ?>

					                     

					            </ul>
					         
					          <!--   <div class="more"><i class="pull_icon"></i><span>上拉加载...</span></div> -->
					        </div>
					    </div>

            	
			<?php  }else{ echo "<span style='color:#666;line-height:400%;'>".L('mzdxgjl')."</span>"; } ?>




         </div>

     

	       
			     
		 
		
           
      

	   </div>

	    

</body>

</html>