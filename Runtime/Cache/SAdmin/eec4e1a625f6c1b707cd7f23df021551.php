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
						
								


<div class="padding border-bottom">  
  <button type="button" class="btn btn-primary" onclick="window.location.href='#addCate'"><span class="icon-plus-square-o"></span> 添加分类</button>
  </div>	

	
<div class="row">
	<div class="col-xs-12">	
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>											
						<th>ID</th>
						<th>一级分类</th>
						<th>二级分类</th>
						<th>三级分类</th>				
						<th>操作</th>				
					</tr>
				</thead>
				<tbody>
						<?php if(is_array($oneCate)): $i = 0; $__LIST__ = $oneCate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one): $mod = ($i % 2 );++$i; if($one['pid'] == 0): ?><tr>
									<td><?php echo ($one["id"]); ?></td>
									<td><?php echo ($one["name"]); ?></td>
									<td></td>
									<td></td>
									<td>
										<a  class="btn btn-xs btn-info" href='<?php echo U("Goods/editCate",array("id"=>$one["id"]));?>'>
											<i class="icon-eye-open bigger-120"></i>
										</a> 
										<a class="delete btn btn-xs btn-danger" href='<?php echo U("Goods/delCate",array("id"=>$one["id"]));?>' >
											<i class="icon-trash bigger-120"></i>
										</a>
									</td>
								</tr>
								<?php if(is_array($twoCate)): $i = 0; $__LIST__ = $twoCate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$two): $mod = ($i % 2 );++$i; if($two['pid'] == $one['id']): ?><tr>
												<td><?php echo ($two["id"]); ?></td>
												<td></td>
												<td><?php echo ($two["name"]); ?></td>
												<td></td>
												<td>
													<a  class="btn btn-xs btn-info" href='<?php echo U("Goods/editCate",array("id"=>$two["id"]));?>'>
														<i class="icon-eye-open bigger-120"></i>
													</a> 
							
													<a class="delete btn btn-xs btn-danger" href='<?php echo U("Goods/delCate",array("id"=>$two["id"]));?>' >
														<i class="icon-trash bigger-120"></i>
													</a>
												</td>
											</tr>
											<?php if(is_array($threeCate)): $i = 0; $__LIST__ = $threeCate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$three): $mod = ($i % 2 );++$i; if($three['pid'] == $two['id']): ?><tr>
														<td><?php echo ($three["id"]); ?></td>
														<td></td>
														<td></td>
														<td><?php echo ($three["name"]); ?></td>
														<td>
															<a  class="btn btn-xs btn-info" href='<?php echo U("Goods/editCate",array("id"=>$three["id"]));?>'>
																<i class="icon-eye-open bigger-120"></i>
															</a> 
									
															<a class="delete btn btn-xs btn-danger" href='<?php echo U("Goods/delCate",array("id"=>$three["id"]));?>' >
																<i class="icon-trash bigger-120"></i>
															</a>
														</td>
													</tr><?php endif; endforeach; endif; else: echo "" ;endif; endif; endforeach; endif; else: echo "" ;endif; endif; endforeach; endif; else: echo "" ;endif; ?>
					
				<tr>
					<td colspan="20" class="page"><?php echo ($page); ?></td>
				</tr>
				</tbody>
				
			</table>
		</div>
	</div>
</div>



<form action="<?php echo U('Goods/cateAdd');?>" method="POST" id="cateForm" enctype="multipart/form-data">
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-name2">上级分类：</label>
    <div class="col-sm-10">
        <select name="pid" id="pid">
            <option value="">-请选择上级分类-</option>
            <?php if(is_array($oneCate)): $i = 0; $__LIST__ = $oneCate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one): $mod = ($i % 2 );++$i;?><option value="<?php echo ($one["id"]); ?>"><?php echo ($one["name"]); ?></option>
                <?php if(is_array($twoCate)): $i = 0; $__LIST__ = $twoCate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$two): $mod = ($i % 2 );++$i; if(($two['pid']) == $one['id']): ?><option value="<?php echo ($two["id"]); ?>">---<?php echo ($two["name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
        </select>
    </div>
</div>


<div class="form-group required">
	<label class="col-sm-2 control-label" for="input-name2">分类标题：</label>
	<div class="col-sm-3">
	    <input id="input-name2" class="form-control" type="text" placeholder="分类标题"
	           value="" name="name">
	</div>
</div>

<div style="clear: both;"></div>
<div class="form-group required">
	<label class="col-sm-2 control-label" for="input-name2">图片：</label>
	<div class="col-sm-3">
	    <input id="input-name2" class="form-control" accept="image/png,image/gif" type="file" placeholder="分类标题"
	           value="" name="pic">
	</div>
</div>



<div style="clear: both;"></div>

<div class="padding border-bottom">  
  <button type="button" class="btn btn-primary" id="addCate" ><span class="icon-plus-square-o"></span>提交</button>
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
	$("#addCate").click(function(){
		var pic  = $("input[name='pic']").val();
		var name  = $("input[name='name']").val();

		

		if(!name){
			alert("请输入分类标题");
			return;
		}
		if(!pic){
			alert("图片不为空");
			return;
		}

		

		

		$("#cateForm").submit();

	});

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