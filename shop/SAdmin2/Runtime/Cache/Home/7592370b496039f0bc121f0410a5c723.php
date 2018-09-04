<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>公告</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<body class="bg96 ">
	
	<div class="header">
	    <div class="header_l">
	    <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2>公告</h2></div>
	    <div class="header_r"></div>
	</div>
    

     <div class="big_width100">

        <ul class="genggao">	


		<?php if(is_array($newinfo)): foreach($newinfo as $key=>$v): ?><li><a href="<?php echo U('User/Newsdetail',array('nid'=>$v['id']));?>" >
				<div class="gonggao_l ">
					<!--h2><strong><?php echo ($v['title']); ?></strong> <span><?php echo (date("Y-m-d",$v['addtime'])); ?></span></h2-->
					<h2><strong><?php echo ($v['title']); ?></strong> <span></span></h2>
					<p><?php echo ($v['content']); ?></p>
				</div>

			</a>
			</li><?php endforeach; endif; ?>



        </ul>
        
	      

	    
           
	      
	</div>

	   


</body>

</html>