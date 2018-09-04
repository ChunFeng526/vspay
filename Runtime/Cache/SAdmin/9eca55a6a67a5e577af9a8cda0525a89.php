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

			<table class="table table-striped table-bordered table-hover search-form">
				<thead>
				<th><input name="id" type="text" value="<?php echo ($id); ?>" placeholder="输入会员id" value="<?php echo I('id');?>" /></th>
				<th><input name="mobile" type="text" value="<?php echo ($mobile); ?>" placeholder="输入手机号码" value="<?php echo I('mobile');?>" /></th>

				<th>
					<select name="status">
						<option value="">-选择状态-</option>
						<option <?php if(($status) == "0"): ?>selected<?php endif; ?>  value="0">-提现中-</option>
						<option <?php if(($status) == "1"): ?>selected<?php endif; ?> value="1">-提现成功-</option>
						<option <?php if(($status) == "2"): ?>selected<?php endif; ?> value="2">-提现拒绝-</option>
					</select>
				</th>
				<th>
					<a class="btn btn-primary" href="javascript:;" id="search" url="<?php echo U('Tixian/tixian');?>">查询</a>
				</th>
				</thead>
			</table>

			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>											
						<th>ID</th>
						<th>用户</th>
						<th>提现金额</th> 
						<th>提现方式</th>
						<!--<th>支付宝/微信</th>-->
						<th>实际到账</th>
						<th>支付方式</th>
						<th>收款详情</th>
						<th>时间</th>
						<th>状态</th> 
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
						<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "$empty" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i; if($v['state']==0){ $state ="待审核"; }else{ $state ="已完成"; } ?>
						<tr>						
							<td><?php echo ($v["id"]); ?></td>
							<td><?php echo M('member')->where(array('member_id'=>$v['member_id']))->getfield('uname') ?>&nbsp;&nbsp;<?php echo ($v["member_id"]); ?></td>
							<td><?php echo ($v["zong_rmb"]); ?></td>
							<td><?php if($v['pay_type']==1): ?>微信<?php elseif($v['pay_type']==2): ?>支付宝<?php elseif($v['pay_type']==3): ?>银行卡<?php else: ?>聚点收款码<?php endif; ?></td>
							<td><?php echo ($v["tx_rmb"]); ?></td>
							<td><?php if($v['zhifu_type']==1): ?>佣金提现<?php elseif($v['zhifu_type']==2): ?>代理佣金提现<?php elseif($v['zhifu_type']==3): ?>农联积分提现<?php elseif($v['zhifu_type']==4): ?>鸡场积分提现<?php elseif($v['zhifu_type']==5): ?>鱼库积分提现<?php else: ?>果园积分提现<?php endif; ?></td>

							<?php if(($v['pay_type']) == "4"): $skimg = M('member')->where(array('member_id'=>$v['member_id']))->getfield('judian_pic'); ?>
								
							<td>
								<img width="120" height="100" src="/Uploads/image/touxiang/<?php echo ($skimg); ?>" alt="">
								
								</td>

							<?php else: ?>
							<?php $api_pay = M('member')->where(array('member_id'=>$v['member_id']))->getfield('api_pay'); ?>
							<?php $wx_name = M('member')->where(array('member_id'=>$v['member_id']))->getfield('wx_name'); ?>
							<td><?php if($v['pay_type']==1): ?>微信<?php echo ($wx_name); elseif($v['pay_type']==2): ?> 支付宝&nbsp<?php echo ($api_pay); else: ?>银行卡<?php endif; ?></td><?php endif; ?>

							<td><?php echo ($v["time"]); ?></td>
							<td>
								<?php if($v['state']==1): ?><a  class="delete btn btn-xs btn-danger" href='<?php echo U("Tixian/okti",array("id"=>$v["id"],"type"=>1));?>'>
										通过
									</a>

									<a  class="delete btn btn-xs btn-danger" href='<?php echo U("Tixian/okti",array("id"=>$v["id"]));?>'>
										拒绝
									</a>
								<?php elseif($v['state']==2): ?>
									<a class="btn btn-xs passed passed" style="background: #00c4c5 !important;border-color:#00c4c5" href='javascript:void(0)'>
										已通过
									</a>
								<?php elseif($v['state']==3): ?>
									<a  class="btn btn-xs passed refused" href='javascript:void(0)'>
										已拒绝
									</a>
								<?php else: ?>
									<a  class="btn btn-xs passed refused" href='javascript:void(0)'>
										已撤销
									</a><?php endif; ?>
							</td>
							<td>
								<a  class=" btn btn-xs btn-danger" href='<?php echo U("Member/info/",array("id"=>$v["member_id"]));?>'>
									详情
								</a>
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
$(function(){
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
</script>
		
	</body>
</html>