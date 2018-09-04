<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>众筹项目中心</title>
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
	    <div class="header_c"><h2>众筹项目中心</h2></div>
	    <div class="header_r"><a href="<?php echo U('Turntable/Crowdrecords');?>">记录</a></div>
	</div>

       <div class="big_width100">

            <div class="zy_topul">
            	
            	<ul class="clear_wl">
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds');?>">
	    					<img src="/Public/home/wap/images/zc0-iocn.png" alt="">
	    					<p  >预热中</p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>1));?>">
	    					<img src="/Public/home/wap/images/zc1-iocn.png" alt="">
	    					<p>进行中</p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>2));?>">
	    					<img src="/Public/home/wap/images/zc2-iocn.png" alt="">
	    					<p class="nop">已结束</p>
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
            			<h3>数字资产</h3>
            			<p class="zcxwz"><span>每个ID限购1000枚</span> 释放比例：100.00%</p>
            			<p>接收币种：<span>余额</span></p>
            		</div>
            		<div class="zcwksshij">
            			<img src="/Public/home/wap/images/naozz.png"><?php echo (date("Y-m-d",$list["open_time"])); ?>
            		</div>


            	</div>
            	<div class="zcweikais_mid clear_wl">
            		<ul>
            			<li class="zcweikais_mid_lia"><p>众筹模式<br/><span><?php echo ((int)($list["num"])); ?>万</span></p></li>
            			<li class="zcweikais_mid_lib"><p>价格<br/><span>1=<?php echo ($list["dprice"]); ?>(￥)</span></p></li>
            			<li class="zcweikais_mid_lic"><p>剩余时间<br/><span class="hse">已结束</span></p></li>
            		</ul>

            	</div>

            	<div class="zcweikais_bottom clear_wl">

            	    

					<div class="zcweikais_bottom_jdzb">
						 <div class="layui-progress layui-progress-big " lay-showPercent="true">
						   <div class="layui-progress-bar layui-bg-blue" lay-percent="<?php echo ($list["jindu"]); ?>%"></div>
						</div>
					</div>
					<a href="#" class="zcweikais_bottom_jdzb_a">立即购买</a>


            	</div>



            	
			<?php  }else{ echo "<span style='color:#666;'>没找到相关记录</span>"; } ?>



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