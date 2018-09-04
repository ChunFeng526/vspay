<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title><?php echo C('SITE_NAME'); ?></title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link href="./Public/sadmin/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="./Public/sadmin/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="./Public/sadmin/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->
		
		<link type="image/x-icon" href="<?php echo resize(C('SITE_ICON'),16,16); ?>" rel="icon">
		<link type="image/x-icon" href="<?php echo resize(C('SITE_ICON'),16,16); ?>" rel="bookmark">
		
		
		<link rel="stylesheet" href="./Public/sadmin/css/ace.min.css" />
		<link rel="stylesheet" href="./Public/sadmin/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="./Public/sadmin/css/ace-skins.min.css" />
		
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="./Public/sadmin/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="./Public/sadmin/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="./Public/sadmin/js/html5shiv.js"></script>
		<script src="./Public/sadmin/js/respond.min.js"></script>
		<![endif]-->
		
		
			
				
		
	</head>

	<body class="navbar-fixed">
		<div class="navbar navbar-default navbar-fixed-top" id="navbar">
			
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="<?php echo U('Index/index');?>" class="navbar-brand">
						<small>
							<!--
							<i class="icon-leaf"></i>
							-->
							后台中心
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">						

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							
								<span class="user-info">
									<?php echo session('user_auth.username'); ?>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								

								<li class="divider"></li>

								<li>
									<a target="_blank" href="/">网站前台</a>
									<a href="<?php echo U('AdminUser/index');?>">修改密码</a>
									<a href="<?php echo U('Public/clear');?>">清空缓存</a>
									<a href="<?php echo U('Public/logout');?>">退出系统</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar sidebar-fixed" id="sidebar">					
				
					<?php W('Menu/menu_show');?>
					

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#"><?php echo ($breadcrumb1); ?></a>
							</li>
							<li class="active"><?php echo ($breadcrumb2); ?></li>
							
						</ul><!-- .breadcrumb -->

						
					</div>

					<div class="page-content">
						
							

    <div class="row">
        <div class="col-xs-12">
  <div class="table-responsive">
                <div class="page-header">
                    <a class="btn btn-primary" href='<?php echo U("Settings/wen");?>'>新增</a>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>用户ID</th>
                          <th>店铺名称</th>
                         <th>店铺等级</th>
                        <th>店铺类型</th>
                        <th>开户姓名</th>
                        <th>排序</th>
                        <th>状态</th>
                        

                         
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($ggshop)): $i = 0; $__LIST__ = $ggshop;if( count($__LIST__)==0 ) : echo "$empty" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i; $id['member_id']=$v['userid']; $dengji=M('member')->where($id)->field('member_grade')->find(); ?> 
                        <tr>
                            <td><?php echo ($v["userid"]); ?></td>
                            <td><?php echo ($v["shop_name"]); ?></td>
                             <?php if(($dengji['member_grade'] == 1) ): ?><td>1级（体验会员）</td>
                            <?php elseif($dengji['member_grade'] == 0): ?>
                            <td> 0级（普通会员）</td>
                            <?php elseif($dengji['member_grade'] == 2): ?>
                            <td> 2级（钻石会员）</td>
                            <?php elseif($dengji['member_grade'] == 3): ?>
                             <td>  3级（联盟会员）</td>
                            <?php else: ?>
                             <td> </td><?php endif; ?>

                            
                            <td>
                            <?php if(($v['shop_type'] == 1) ): ?>服饰
                            <?php elseif(($v['shop_type'] == 2)): ?>
                            餐饮
                            <?php elseif(($v['shop_type'] == 3)): ?>
                            酒店
                            <?php elseif(($v['shop_type'] == 4)): ?>
                            旅游
                            <?php elseif(($v['shop_type'] == 5)): ?>
                            科技
                            <?php elseif(($v['shop_type'] == 6)): ?>
                            养生
                            <?php elseif(($v['shop_type'] == 7)): ?>
                            美容
                            <?php elseif(($v['shop_type'] == 8)): ?>
                            特产
                            <?php elseif(($v['shop_type'] == 9)): ?>
                            生鲜
                            <?php else: ?>
                            其它<?php endif; ?>
                            </td>
                        
                            <td><?php echo ($v["name"]); ?></td>
                            <td><?php echo ($v['shop_stort']); ?></td>
                           
                               <?php if($v['shop_zhuangtai'] == 1): ?><td style="color:green;">启用</td>
                     
                            <?php else: ?>
                                <td style="color:red;">禁用</td><?php endif; ?>
                            


<td>
  <?php if($v['shop_zhuangtai'] == 1): ?><a class="btn btn-xs btn-info" href='<?php echo U("goods/zhuangtai",array("id"=>$v["id"],"shop_zhuangtai"=>0));?>'> 禁用</a>
    <?php else: ?>
    <a class="btn btn-xs btn-info" href='<?php echo U("goods/zhuangtai",array("id"=>$v["id"],"shop_zhuangtai"=>1));?>'> 启用</a><?php endif; ?>
    <a class="btn btn-xs btn-info" href='<?php echo U("goods/wen",array("id"=>$v["id"]));?>'>排序</a>
      <a class="btn btn-xs btn-info" href='<?php echo U("goods/dltgeren",array("id"=>$v["id"]));?>'>删除</a>

</td>
                        </tr><?php endforeach; endif; else: echo "$empty" ;endif; ?>

                    <tr>
                        <td colspan="20" class="page"><?php echo ($page); ?></td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </div>

						
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
				
				
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		
		<script src="/Common/js/jquery/jquery-2.0.3.min.js"></script>
		<script src="/Common/js/jquery/jquery-migrate-1.2.1.min.js"></script>
			
		<!-- <![endif]-->

		<!--[if IE]>
		<script src="/Common/js/jquery/jquery-1.10.2.min.js"></script>
		<script src="/Common/js/jquery/jquery-migrate-1.2.1.min.js"></script>
		<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='./Public/sadmin/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="./Public/sadmin/js/bootstrap.min.js"></script>
		<script src="./Public/sadmin/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="./Public/sadmin/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="./Public/sadmin/js/ace-elements.min.js"></script>
		<script src="./Public/sadmin/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script src="/Common/js/oscshop_common.js"></script>
		
    <script>
        $(function () {
            $("#search").click(function () {
                var url = $(this).attr('url');
                var query = $('.search-form').find('input,select').serialize();
                query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g, '');
                query = query.replace(/^&/g, '');
                if (url.indexOf('?') > 0) {
                    url += '&' + query;
                } else {
                    url += '?' + query;
                }
                window.location.href = url;
            });
        });

        $(function () {
            $("#doExport").click(function () {
                var url = $(this).attr('url');
                var query = $('.search-form').find('input,select').serialize();
                query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g, '');
                query = query.replace(/^&/g, '');
                if (url.indexOf('?') > 0) {
                    url += '&' + query;
                } else {
                    url += '?' + query;
                }
                window.location.href = url;
            });
        });

    </script>
		
	</body>
</html>