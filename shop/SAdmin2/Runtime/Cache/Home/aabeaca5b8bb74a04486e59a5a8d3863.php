<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php echo (L("zcxmzx")); ?></title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<link rel="stylesheet" href="/Public/home/wap/layui/css/layui.css">
<script src="/Public/home/wap/layui/layui.js"></script>
<body class="bg96">
	
	<div class="header">
	    <div class="header_l">
	    <a href="<?php echo U('Turntable/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2><?php echo (L("zcxmzx")); ?></h2></div>
	    <div class="header_r"><a href="<?php echo U('Turntable/Crowdrecords');?>"><?php echo (L("jl")); ?></a></div>
	</div>

       <div class="big_width100">

            <div class="zy_topul">
            	
            	<ul class="clear_wl">
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds');?>">
	    					<img src="/Public/home/wap/images/zc0-iocn.png" alt="">
	    					<p class="nop"><?php echo (L("yrz")); ?></p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>1));?>">
	    					<img src="/Public/home/wap/images/zc1-iocn.png" alt="">
	    					<p><?php echo (L("jxz")); ?></p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>2));?>">
	    					<img src="/Public/home/wap/images/zc2-iocn.png" alt="">
	    					<p><?php echo (L("yjs")); ?></p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    		</ul>
            </div>

            <div class="zcweikais">
      	<?php  if($list){ ?>
      	
            	<div class="zcweikais_top clear_wl">
            		
            		<img src="/Public/home/wap/images/zhongctub.png" class="zcimg">
            		<div class="zcweikais_topwz">
            			<h3><?php echo (L("digitalasset")); ?></h3>
            			<p class="zcxwz"><span><?php echo (L("mgidxgyqm")); ?></span><?php echo (L("sfbl")); ?>：100.00%</p>
            			<p><?php echo (L("jsbz")); ?>：<span><?php echo (L("jjf1")); ?></span></p>
            		</div>
            		<div class="zcwksshij">
            			<img src="/Public/home/wap/images/naozz.png"><?php echo (date("Y-m-d",$list["open_time"])); ?>
            		</div>


            	</div>
            	<div class="zcweikais_mid clear_wl">
            		<ul>
            			<li class="zcweikais_mid_lia"><p><?php echo (L("zcms")); ?><br/><span><?php echo ((int)($list["num"])); ?>万</span></p></li>
            			<li class="zcweikais_mid_lib"><p><?php echo (L("jg")); ?><br/><span>1=<?php echo ($list["dprice"]); ?>(￥)</span></p></li>
            			<li class="zcweikais_mid_lic"><p><?php echo (L("sysj")); ?><br/><span class="hse"><?php echo (L("wks")); ?></span></p></li>
            		</ul>

            	</div>

            	<div class="zcweikais_bottom clear_wl">

            	    

					<div class="zcweikais_bottom_jdzb">
						 <div class="layui-progress layui-progress-big " lay-showPercent="true">
						   <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
						</div>
					</div>
					<a href="#" class="zcweikais_bottom_jdzb_a"><?php echo (L("ljgm")); ?></a>


            	</div>


			<?php  }else{ echo "<span style='color:#666;".$Think.lang.mzdxgjl."</span>"; } ?>



            </div>

	       
			     
		 
		
           
      

	   </div>

	   <script>
		//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
		layui.use('element', function(){
		  var element = layui.element;
		});
		</script>   

</body>

</html>