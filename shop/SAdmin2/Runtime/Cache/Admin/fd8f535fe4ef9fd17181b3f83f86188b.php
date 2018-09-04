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
             <li class="text-muted">发布众筹</li>
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
                            <li class="active">
                                <a href="<?php echo U('Config/group3');?>">众筹设置</a>
                            </li>

                            <li class="">
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
                       修改进行中众筹进度<hr style="margin-top: 0px;width: 100%">
                        <div class="row" style="margin-bottom:30px;">
                            
                       
                            <div class="col-xs-12" >
                                <?php
 if($is_has){ ?>
                                <form action="<?php echo U('Config/groupSave4');?>" method="post" class="form-horizontal form form-builder form-builder1">
                                <div class="form-type-list">

                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">开始日期：</label>
                                        <div style="width:200px;" class="input-group">
                                            <div style="float:left;width:160px;margin-right:20px" class="">
                                                    <input type="text"  name="open_time" readonly="readonly" class="search-input form-control" value="<?php echo ($open_time); ?>" >
                                                </div>
                                        </div>
                                    </div>

                                     <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">众筹总量：</label>
                                        <div style="width:200px;" class="input-group">
                                            <input type="number" style="width:160px;" readonly="readonly" name="num" class="form-control" value="<?php echo ($num); ?>" ><span style="float:left;margin-left:2px;line-height:260%;">万<span>                                          
                                        </div>
                                    </div>

                                     <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">当前进度：</label>
                                        <div style="width:200px;" class="input-group">
                                            <input type="text" style="width:160px;" name="jindu" class="form-control" value="<?php echo ($jindu); ?>" >
                                             <input type="hidden" name="tid"  value="<?php echo ($id); ?>" >
                                             <span class="input-group-addon">%</span>                                              
                                        </div>
                                    </div>
                                   
                                        <div class="form-group"></div>
                                        <div class="form-group bottom_button_list">
                                            <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builder1">修改</a>
                                            <a class="btn btn-danger return" onclick="javascript:history.back(-1);return false;">取消</a>
                                        </div>
                                </div>
                                </form>
                                <?php
 }else{echo "<span style='color:#888;'>暂无进行中的众筹……</span>";}?>


                            </div>

                        </div>

发布准备开始的众筹<hr style="margin-top: 0px;width: 100%">

                        <div class="row" >
                            <div class="col-xs-12" >
                                <form action="<?php echo U('Config/groupSave3');?>" method="post" class="form-horizontal form form-builder form-builder2">
                                <div class="form-type-list">

                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">众筹总量：</label>
                                        <div style="width:200px;" class="input-group">
                                            <input type="number" style="width:160px;" name="num" class="form-control" value="500" ><span style="float:left;margin-left:2px;line-height:260%;">万<span>                                          
                                        </div>
                                    </div>
                                
                                   <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">价格：</label>
                                        <div style="width:200px;" class="input-group">
                                            <input type="number" style="width:160px;" name="dprice" class="form-control" value="6.0000" >                                          
                                        </div>
                                    </div>



                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">开始日期：</label>
                                        <div style="width:200px;" class="input-group">
                                            <div style="float:left;width:160px;margin-right:20px" class="">
                                                    <input type="text" name="open_time" class="search-input form-control date" value="" placeholder="开始日期">
                                                </div>
                                        </div>
                                    </div>
                                   


                                    <div class="form-group item_config[WEB_SITE_TITLE] ">
                                        <label class="left control-label">初始进度：</label>
                                        <div style="width:200px;" class="input-group">
                                            <input type="text" style="width:160px;" name="jindu" class="form-control" value="0" ><span class="input-group-addon">%</span>                                          
                                        </div>
                                    </div>    
                                        <div class="form-group"></div>
                                        <div class="form-group bottom_button_list">
                                            <a class="btn btn-primary submit ajax-post" type="submit" target-form="form-builder2">发布</a>
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
            
     <script type="text/javascript">
        $('.date').datetimepicker({
            format: 'yyyy-mm-dd',
            language:"zh-CN",
            minView:2,
            autoclose:true,
            todayBtn:1, //是否显示今日按钮
        });
    </script>
    <script type="text/javascript" src="/Public/libs/lyui/dist/js/lyui.extend.min.js"></script>

        </div>
    </div>
</body>
</html>