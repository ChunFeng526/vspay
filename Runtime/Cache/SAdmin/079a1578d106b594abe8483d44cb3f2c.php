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
						
							
	<div class="page-header">
		<h1>
			<?php echo ($breadcrumb2); ?>
			<small>
				<i class="icon-double-angle-right"></i>
				<?php echo ($crumbs); ?>
			</small>
		</h1>
	</div>	
	<ul class="nav nav-tabs">
		
	  <li class="active"><a href="#tab-member" data-toggle="tab">后台用户资料</a></li>	 
	  
	</ul>
	<form class="form-horizontal" id="validation-form"  method="post" action='<?php echo ($action); ?>'>
	<div class="tab-content">
		<?php if(!empty($_GET['id'])): ?><input name="a_id" type="hidden" value="<?php echo ($_GET['id']); ?>" /><?php endif; ?>
		<div class="tab-pane active" id="tab-member">
			<table class="table table-binfoed">
				<tr>
				    <td>ID</td>
				    <td><?php echo ($data["a_id"]); ?></td>
				</tr>
	
				<tr>
					<td>用户名</td>
					<td><?php echo ($data["a_uname"]); ?></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input id="pwd" name="a_passwd" type="text" style="width:400px;" value="<?php echo think_ucenter_decrypt($data['a_passwd'],C('PWD_KEY')); ?>" /></td>
				</tr>
				<tr>
				    <td>真实姓名</td>
				    <td><input name="a_true_name" type="text" style="width:400px;" value="<?php echo ((isset($data["a_true_name"]) && ($data["a_true_name"] !== ""))?($data["a_true_name"]):''); ?>" /></td>
				    
				</tr>
				  <tr>
				    <td>联系电话</td>
				    <td><input name="a_telephone" type="text" style="width:400px;" value="<?php echo ((isset($data["a_telephone"]) && ($data["a_telephone"] !== ""))?($data["a_telephone"]):''); ?>" /></td>
				  
				</tr> 
					
				<tr>
					<td>登录IP地址</td>
					<td><?php echo ($data["a_last_ip_region"]); ?></td>
				</tr>  
				<tr>
					<td>登录次数</td>
					<td><?php echo ($data["a_login_count"]); ?></td>
				</tr>
				<tr>
					<td>创建时间</td>
					<td><?php echo (toDate($data["a_create_time"],'Y/m/d H:i:s')); ?></td>
				</tr>
				<tr>
					<td>最近登录时间</td>
					<td><?php echo (toDate($data["a_last_login_time"],'Y/m/d H:i:s')); ?></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>	
							<label class="radio-inline">
							<input type="radio" checked="checked" value="1" name="a_status">启用</label>
							<label class="radio-inline">
							<input type="radio" value="0" name="a_status">停用</label>
					</td>
				</tr>
				</table>
				<div class="form-group">
				
				<div style="margin-left:20px;">
					<input name="send" type="submit" value="提交" class="btn btn-primary" />
				</div>
			</div>
		</div>
		
	
	</div>
	</form>	

						
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
	
	<?php if(isset($_GET['id'])): ?>Oscshop.setValue("a_status", <?php echo ((isset($data["a_status"]) && ($data["a_status"] !== ""))?($data["a_status"]):1); ?>);<?php endif; ?>
	
	$('.btn').click(function(){		
		
		if($('#pwd').val()==''){
			alert('密码必填');
			return false;
		}
		if($('#pwd').val().length<6){
			alert('密码长度必须大于等于6位！！');
			return false;
		}
	});		
});
</script>							
		
	</body>
</html>