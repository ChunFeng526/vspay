<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title><?php echo ($meta_title); ?>｜<?php echo C('WEB_SITE_TITLE');?>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="generator" content="CoreThink">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="<?php echo C('WEB_SITE_TITLE');?>">
    <meta name="format-detection" content="telephone=no,email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="apple-touch-icon" type="image/x-icon" href="/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/logo.png">
    <link rel="stylesheet" type="text/css" href="/Public/libs/lyui/dist/css/lyui.min.css">
    <link rel="stylesheet" type="text/css" href="/shop/Admin/View/Public/css/admin.css">
    
    <link rel="stylesheet" type="text/css" href="/Public/libs/lyui/dist/css/lyui.extend.min.css">
    <link rel="stylesheet" type="text/css" href="/shop/Admin/View/Public/css/style.css">

    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/Public/libs/jquery/1.x/jquery.min.js"></script>
     <link rel="stylesheet" href="/Public/plugin/themes/default/default.css" />
    <script charset="utf-8" src="/Public/plugin/kindeditor-min.js"></script>
    <script charset="utf-8" src="/Public/plugin/lang/zh_CN.js"></script>

    <!-- 日期 -->
    <script type="text/javascript" src="/Public/libs/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/Public/libs/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <!-- 日期js cs -->
    <link href="/Public/libs/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
    <link href="/Public/libs/datetimepicker/css/dropdown.css" rel="stylesheet" type="text/css">

</head>
<!-- <body class="admin_index_index"> -->
<body class="admin_config_group" >
    <div class="clearfix full-header">
        
                <!-- 顶部导航 -->
                <div class="navbar navbar-default navbar-fixed-top main-nav" role="navigation">
                    <div class="container-fluid">
                        <div>
                            <div class="navbar-header navbar-header-inverse">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-top">
                                    <span class="sr-only">切换导航</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" target="_blank" href="/">
                                    <span><b><span style="color: #2699ed;">后台管理</span></b></span>
                                </a>
                            </div>
                            <div class="collapse navbar-collapse navbar-collapse-top">
                                <ul class="nav navbar-nav">
                                    <!-- 主导航 -->
                                    <li <?php if (CONTROLLER_NAME=='Index') { echo "class='active'"; } ?> ><a href="<?php echo U('Admin/Index/index');?>"><i class="fa fa-home"></i> 首页</a></li>
                                    <?php if(is_array($_menu_list_g)): foreach($_menu_list_g as $key=>$g_val): ?><li <?php if ($_menu_tab['gid']==$g_val['id'] && CONTROLLER_NAME!='Index') { echo "class='active'"; } ?> >
                                    <a href="<?php if($g_val['col'] && $g_val['act']) echo U('Admin/'.$g_val['col'].'/'.$g_val['act']); ?>" target="">
                                        <i class="fa <?php echo ($g_val['icon']); ?>"></i>
                                        <span><?php echo ($g_val["name"]); ?></span>
                                    </a>
                                    </li><?php endforeach; endif; ?>                                                  
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="<?php echo U('Admin/Index/removeRuntime');?>" style="border: 0;text-align: left" class="btn ajax-get no-refresh"><i class="fa fa-trash"></i> 清空缓存</a></li>
                                    <li><a target="_blank" href="/"><i class="fa fa-external-link"></i> 打开前台</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-user"></i> <?php echo ($_user_auth["username"]); ?> <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a target="_blank" href="/"><i class="fa fa-external-link"></i> 打开前台</a></li>
                                            <li><a href="<?php echo U('Admin/Index/removeRuntime');?>" style="border: 0;text-align: left;" class="btn text-left ajax-get no-refresh"><i class="fa fa-trash"></i> 清空缓存</a></li>
                                            <li><a href="<?php echo U('Admin/Pubss/logout');?>" class="ajax-get"><i class="fa fa-sign-out"></i> 退出</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
        
    </div>

    <div class="clearfix full-container" id="full-container">
        
            <input type="hidden" name="check_version_url" value="<?php echo U('Admin/Update/checkVersion');?>">
            <div class="container-fluid with-top-navbar" style="height: 100%;overflow: hidden;">
                <div class="row" style="height: 100%;">
                    <!-- 后台左侧导航 S-->
                    <div id="sidebar" class="col-xs-12 col-sm-3 sidebar tab-content">
                        <!-- 模块菜单 -->
                        <nav class="navside navside-default" role="navigation">
                            <?php if($_menu_list_p): ?>
                                <ul class="nav navside-nav navside-first">
                                    <?php if(is_array($_menu_list_p)): $fkey = 0; $__LIST__ = $_menu_list_p;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$_ns_first): $mod = ($fkey % 2 );++$fkey;?><li>
                                            <a data-toggle="collapse" href="#navside-collapse-<?php echo ($_ns_first["id"]); ?>-<?php echo ($fkey); ?>">
                                                <i class="<?php echo ($_ns_first["icon"]); ?>"></i>
                                                <span class="nav-label"><?php echo ($_ns_first["name"]); ?></span>
                                                <span class="angle fa fa-angle-down"></span>
                                                <span class="angle-collapse fa fa-angle-left"></span>
                                            </a>
                                            <?php if(!empty($_menu_list_c)): ?><ul class="nav navside-nav navside-second collapse in" id="navside-collapse-<?php echo ($_ns_first["id"]); ?>-<?php echo ($fkey); ?>">
                                                    <?php if(is_array($_menu_list_c)): $skey = 0; $__LIST__ = $_menu_list_c;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$_ns_second): $mod = ($skey % 2 );++$skey; if(($_ns_first['id']) == $_ns_second['pid']): ?><li <?php  if(!empty($_select_url) && strtolower($_ns_second['col'].'-'.$_ns_second['act'])== $_select_url) echo 'class="active"'; elseif(empty($_select_url) && $_ns_second['col'] == CONTROLLER_NAME) echo 'class="active"'; ?>>
                                                            <a href="<?php echo U($_ns_second['col'].'/'.$_ns_second['act']); ?>" >
                                                                <i class="<?php echo ($_ns_second["icon"]); ?>"></i>
                                                                <span class="nav-label"><?php echo ($_ns_second["name"]); ?></span>
                                                            </a>
                                                        </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                                                </ul><?php endif; ?>
                                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                </ul>
                            <?php endif; ?>
                        </nav>
                    </div>
                    <!-- 后台左侧导航 E-->

                    <!-- 右侧内容 S-->
                    
   <div id="main" class="col-xs-12 col-sm-9 main" style="overflow-y: scroll;">
        <!-- 面包屑导航 -->
        <ul class="breadcrumb">
            <li><i class="fa fa-map-marker"></i></li>
            <?php if(is_array($_menu_tab['name'])): foreach($_menu_tab['name'] as $key=>$tab_v): ?><li class="text-muted"><?php echo ($tab_v); ?></li><?php endforeach; endif; ?>
             <li class="text-muted">积分释放率</li>
        </ul>

        <!-- 主体内容区域 -->
        <div class="tab-content ct-tab-content">
            <div class="panel-body">
                <div class="builder formbuilder-box">
                    <div class="builder-tabs builder-form-tabs">
                        <ul class="nav nav-tabs">

                            <li class="">
                                <a href="<?php echo U('Config/group2',array('group'=>1));?>">基本设置</a>
                            </li>
                            <li class="">
                                <a href="<?php echo U('Config/group3');?>">众筹设置</a>
                            </li>
                            <li class="active">
                                <a href="<?php echo U('Config/group4');?>">奖励设置</a>
                            </li>

                            <li class="">
                                <a href="<?php echo U('Config/group1',array('group1'=>5));?>">实时价格设置</a>
                            </li>
                            <li class="">
                                <a href="<?php echo U('Config/group',array('group'=>3));?>">网站开关</a>
                            </li>
                        </ul>
                    </div>
                    <div class="form-group"></div>
                    <div class="builder-container" >
                        <div class="row" >
                            <div class="col-xs-12" >
                                <form action="<?php echo U('Config/groupSave');?>" method="post" class="form-horizontal form form-builder" style="margin-bottom:20px">
                                <div class="form-type-list">

                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">积分基础加速：</label>
                                        <div style="width:200px" class="input-group">
                                            <input type="text" name="sell_fee" class="form-control" value="<?php echo ($info["sell_fee"]); ?>" >
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </div>
                                <div class="form-group"></div>
                                <div class="form-group bottom_button_list">
                                    <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builder">保存</a>
                                    <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                    </div>
                                </form>




管理奖励设置<hr style="margin-top: 0px;width: 100%">


                                <form action="<?php echo U('Config/manage_Save');?>" method="post" class="form-horizontal form form-builder form-builderg" style="margin-bottom:20px">
                                <div class="form-type-list">

                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:160px" >(拿一代)         所需直推人数：</label>
                                            <input type="text" name="manage_0" style="width:100px"  class="left" value="<?php echo ($manage[0]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="managej_0" class="left" value="<?php echo ($manage["guanli1"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>                                            
                                        </div>
                                       
                                        
                                    </div> 


                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:160px" >(拿二代)         所需直推人数：</label>
                                            <input type="text" name="manage_1" style="width:100px"  class="left" value="<?php echo ($manage[1]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="managej_1" class="left" value="<?php echo ($manage["guanli2"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>                                            
                                        </div>
                                       
                                        
                                    </div> 


                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:160px" >(拿三代)         所需直推人数：</label>
                                            <input type="text" name="manage_2" style="width:100px"  class="left" value="<?php echo ($manage[2]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="managej_2" class="left" value="<?php echo ($manage["guanli3"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>                                            
                                        </div>
                                       
                                        
                                    </div> 

                                                              

                                <div class="form-group"></div>
                                <div class="form-group bottom_button_list">
                                    <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builderg">保存</a>
                                    <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                    </div>
                                </form>

区块奖励设置<hr style="margin-top: 0px;width: 100%">


                                <form action="<?php echo U('Config/qukuai_Save');?>" method="post" class="form-horizontal form form-builder form form-builderq" style="margin-bottom:20px">
                                <div class="form-type-list">
                                   <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(拿三代)         所需直推人数：</label>
                                            <input type="text" name="qukuai_0" style="width:100px"  class="left" value="<?php echo ($qukuai[0]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="qukuaij_0" class="left" value="<?php echo ($qukuai["qukuai1"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 

                                        <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(拿六代)         所需直推人数：</label>
                                            <input type="text" name="qukuai_1" style="width:100px"  class="left" value="<?php echo ($qukuai[1]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="qukuaij_1" class="left" value="<?php echo ($qukuai["qukuai2"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 

                                        <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(拿九代)         所需直推人数：</label>
                                            <input type="text" name="qukuai_2" style="width:100px"  class="left" value="<?php echo ($qukuai[2]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="qukuaij_2" class="left" value="<?php echo ($qukuai["qukuai3"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 

                                        <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(拿十二代)         所需直推人数：</label>
                                            <input type="text" name="qukuai_3" style="width:100px"  class="left" value="<?php echo ($qukuai[3]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="qukuaij_3" class="left" value="<?php echo ($qukuai["qukuai4"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 

                                       <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(拿十五代)         所需直推人数：</label>
                                            <input type="text" name="qukuai_4" style="width:100px"  class="left" value="<?php echo ($qukuai[4]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="qukuaij_4" class="left" value="<?php echo ($qukuai["qukuai5"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 


                                                              

                                <div class="form-group"></div>
                                <div class="form-group bottom_button_list">
                                    <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builderq">保存</a>
                                    <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                    </div>
                                </form>                                

VIP奖励设置<hr style="margin-top: 0px;width: 100%">


                                <form action="<?php echo U('Config/vip_Save');?>" method="post" class="form-horizontal form form-builder form-builderv" style="margin-bottom:20px">
                                <div class="form-type-list">
                                   <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(VIP1)         所需积分：</label>
                                            <input type="text" name="vip_0" style="width:100px"  class="left" value="<?php echo ($vip[0]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="vipj_0" class="left" value="<?php echo ($vip["vip1"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 

                                    <div class="form-group item_config[WEB_SITE_TITLE] ">                                        
                                        <div style="width:600px" class="input-group">
                                            <label class="left"  style="width:170px" >(VIP2) 所需直推VIP1数：</label>
                                            <input type="text" name="vip_1" style="width:100px"  class="left" value="<?php echo ($vip[1]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:80px">奖励加速：</label>
    
                                            <input type="text" name="vipj_1" class="left" value="<?php echo ($vip["vip2"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                        </div>
                                    </div> 
            

                                <div class="form-group"></div>
                                <div class="form-group bottom_button_list">
                                    <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builderv">保存</a>
                                    <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                    </div>
                                </form>   
分享及余额转动奖设置<hr style="margin-top: 0px;width: 100%">


                                <form action="<?php echo U('Config/fenx_Save');?>" method="post" class="form-horizontal form form-builder form-builderf" style="margin-bottom:20px">
                                <div class="form-type-list">

                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:800px" class="input-group">
                                            <label class="left"  style="width:90px" >积分达到：</label>
                                            <input type="text" name="fenx_0" style="width:100px"  class="left" value="<?php echo ($fenx[0]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:90px">分享奖加速：</label>    
                                            <input type="text" name="fenxj_0" class="left" value="<?php echo ($fenx["zhitui1"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>


                                             <label class="left" style="margin-left:30px;width:120px">余额转动奖加速：</label>    
                                            <input type="text" name="zhuandj_0" class="left" value="<?php echo ($zhuand["zhuand1"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                            
                                        </div>
                                       
                                        
                                    </div> 

                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:800px" class="input-group">
                                            <label class="left"  style="width:90px" >积分达到：</label>
                                            <input type="text" name="fenx_1" style="width:100px"  class="left" value="<?php echo ($fenx[1]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:90px">分享奖加速：</label>
    
                                            <input type="text" name="fenxj_1" class="left" value="<?php echo ($fenx["zhitui2"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>


                                             <label class="left" style="margin-left:30px;width:120px">余额转动奖加速：</label>    
                                            <input type="text" name="zhuandj_1" class="left" value="<?php echo ($zhuand["zhuand2"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                            
                                        </div>
                                       
                                        
                                    </div>    
                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:800px" class="input-group">
                                            <label class="left"  style="width:90px" >积分达到：</label>
                                            <input type="text" name="fenx_2" style="width:100px"  class="left" value="<?php echo ($fenx[2]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:90px">分享奖加速：</label>
    
                                            <input type="text" name="fenxj_2" class="left" value="<?php echo ($fenx["zhitui3"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>

                                             <label class="left" style="margin-left:30px;width:120px">余额转动奖加速：</label>    
                                            <input type="text" name="zhuandj_2" class="left" value="<?php echo ($zhuand["zhuand3"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                            
                                        </div>
                                       
                                        
                                    </div>  

                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        
                                        <div style="width:800px" class="input-group">
                                            <label class="left"  style="width:90px" >积分达到：</label>
                                            <input type="text" name="fenx_3" style="width:100px"  class="left" value="<?php echo ($fenx[3]["tip"]); ?>" >
                                             <label class="left" style="margin-left:30px;width:90px">分享奖加速：</label>
    
                                            <input type="text" name="fenxj_3" class="left" value="<?php echo ($fenx["zhitui4"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>

                                             <label class="left" style="margin-left:30px;width:120px">余额转动奖加速：</label>    
                                            <input type="text" name="zhuandj_3" class="left" value="<?php echo ($zhuand["zhuand4"]); ?>" >
                                            <span class="input-group-addon left" style="margin-left:0px;width:30px">%</span>
                                            
                                        </div>
                                       
                                        
                                    </div>                               

                                <div class="form-group"></div>
                                <div class="form-group bottom_button_list">
                                    <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builderf">保存</a>
                                    <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                    </div>
                                </form>                                   
                               
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>                   
</div>

                    <!-- 右侧内容 E-->
                    
                </div>


            </div>
        

    </div>

    <div class="clearfix full-footer">
        
    </div>

    <div class="clearfix full-script">
        <div class="container-fluid">
            <input type="hidden" id="corethink_home_img" value="__HOME_IMG__">
            <script type="text/javascript" src="/Public/libs/lyui/dist/js/lyui.min.js"></script>
            <script type="text/javascript" src="/shop/Admin/View/Public/js/admin.js"></script>
            
    <script type="text/javascript" src="/Public/libs/lyui/dist/js/lyui.extend.min.js"></script>

        </div>
    </div>
</body>
</html>