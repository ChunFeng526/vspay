<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>转入记录</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/meCen.css">
<body class="bg96">

<div class="header">
    <div class="header_l">
        <a href="javascript:history.go(-1)"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
    </div>
    <div class="header_c"><h2>分享记录</h2></div>
    <div class="header_r"></div>
</div>

<div class="big_width100 por">

    <form action="<?php echo U('User/Teamdets');?>" method="post">
        <div class="zySearch">
            <input id="searchInput" name="uinfo" class="search-input" value="<?php echo ($uinfo); ?>" type="text" placeholder="搜索UID/手机号码">
            <button class="search-btn btn">搜索</button>
        </div>
    </form>

    <?php if(is_array($muinfo)): foreach($muinfo as $key=>$v): ?><div class="share_ul">
            <div class="share_ul_l">
                <img src="/Public/home/wap/heads/<?php echo ($v['img_head']); ?>" alt="">
                <div class="share_p">
                    <p><?php echo ($v['username']); ?></p>
                    <p>UID:<?php echo ($v['userid']); ?></p>
                    <p>电话:<?php echo ($v['mobile']); ?></p>
                    
                </div>
            </div>
            <div class="shijin"><?php echo (date("Y-m-d H:i:s",$v['reg_date'])); ?></div>

                <?php if($v['use_grade'] == 1): ?><div class="dengjxias dengjxiasa">
                普通用户
                <?php elseif($v['use_grade'] == 2): ?>
                <div class="dengjxias dengjxiasb">
                五星用户
                <?php elseif($v['use_grade'] == 3): ?>
                <div class="dengjxias dengjxiasc">
                VIP用户
                <?php else: ?>
                <div class="dengjxias">
                初始会员<?php endif; ?>
            </div>
        </div><?php endforeach; endif; ?>
</div>
</body>
</html>