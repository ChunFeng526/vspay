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

        <li class="active"><a href="#tab-order" data-toggle="tab">订单详情</a></li>

        <li><a href="#tab-shipping" data-toggle="tab">收货地址</a></li>
        <li><a href="#tab-product" data-toggle="tab">商品清单</a></li>
        <?php if($order['status'] == 1): ?><li><a href="#tab-fahuo" data-toggle="tab">发货信息</a></li><?php endif; ?>

    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-order">
            <table class="table table-bordered">
                <tr>
                    <td width="120">订单ID</td>
                    <td><?php echo ($order['order_id']); ?></td>
                </tr>
                <tr>
                    <td>订单编号</td>
                    <td><?php echo ($order['order_no']); ?></td>
                </tr>
                <tr>
                    <td>订单交易号</td>
                    <td><?php echo ((isset($order['trade_no']) && ($order['trade_no'] !== ""))?($order['trade_no']):"无"); ?></td>
                </tr>
                <tr>
                    <td>会员名称</td>
                    <td><?php echo ($order['uname']); ?></td>
                </tr>
                <tr>
                    <td>联系电话</td>
                    <td><?php echo ($order['phone']); ?></td>
                </tr>
                <tr>
                    <td>运费</td>
                    <td>
                        ￥<?php echo ((isset($order['total_yf']) && ($order['total_yf'] !== ""))?($order['total_yf']):'0'); ?>
                    </td>
                </tr>
                <tr>
                    <td>合计金额</td>
                    <td>
                        ￥<?php echo ($order['buy_price']); ?>
                    </td>
                </tr>
                <tr>
                    <td>订单状态</td>
                    <td id="order-status">
                        <?php if($order['status'] == 0): ?>未支付
                            <?php elseif($order['status'] == 1): ?>
                            待发货
                            <?php elseif($order['status'] == 2): ?>
                            已发货
                            <?php elseif($order['status'] == 3): ?>
                            交易完成
                            <?php else: ?>
                            未知状态<?php endif; ?>
                    </td>
                </tr>

                <tr>
                    <td>下单时间</td>
                    <td><?php echo (toDate($order['time'],'Y/m/d H:i:s')); ?></td>
                </tr>

                <tr>
                    <td>支付时间</td>
                    <td><?php echo (toDate($order['pay_time'],'Y/m/d H:i:s')); ?></td>
                </tr>

            </table>
        </div>
        <div class="tab-pane" id="tab-shipping">
            <table class="table table-bordered">
                <tr>
                    <td>收货人姓名</td>
                    <td><?php echo ((isset($order['buy_name']) && ($order['buy_name'] !== ""))?($order['buy_name']):"无"); ?></td>
                </tr>

                <tr>
                    <td>收货人号码</td>
                    <td>
                        <?php echo ((isset($order['buy_phone']) && ($order['buy_phone'] !== ""))?($order['buy_phone']):"无"); ?>
                    </td>
                </tr>

                <tr>
                    <td>收货人地址</td>
                    <td><?php echo ((isset($order['buy_address']) && ($order['buy_address'] !== ""))?($order['buy_address']):"无"); ?></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td><?php echo ((isset($order['remake']) && ($order['remake'] !== ""))?($order['remake']):"无"); ?></td>
                </tr>

                <tr>
                    <td>支付方式</td>
                    <td>
                        <?php if($order['pay_type'] == 1): ?>微信
                            <?php elseif($order['pay_type'] == 2): ?>
                            支付宝
                            <?php elseif($order['pay_type'] == 3): ?>
                            农联积分
                            <?php else: ?>
                            农联积分 + 消费积分<?php endif; ?>
                    </td>

                </tr>
                <tr>
                    <td>货运方式</td>
                    <td><?php echo ((isset($order['kd_type']) && ($order['kd_type'] !== ""))?($order['kd_type']):"无"); ?></td>
                </tr>

                <tr>
                    <td>快递单号</td>
                    <td><?php echo ((isset($order['kd_no']) && ($order['kd_no'] !== ""))?($order['kd_no']):"无"); ?></td>
                </tr>

            </table>


        </div>
        <div id="tab-product" class="tab-pane">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td class="left">商品ID</td>
                    <td class="left">商品类型</td>
                    <td class="left">商品图片</td>
                    <td class="left">商品名</td>
                    <td class="left">所属类别</td>
                    <td class="left">参数</td>
                    <td class="left">单价</td>
                    <td class="right">数量</td>
                    <td class="right">总计</td>
                </tr>
                </thead>
                <tbody>
                <?php
 $productList = M("order_detail")->where(array('order_id'=>$order['order_id']))->select(); foreach($productList as $key=>$product){ ?>
                <tr>
                    <td class="left"><?php echo ($product['order_id']); ?></td>
                    <td class="left"><?php if(($product['shangjia']) != ""): ?>商家(<?php echo M('member')->where(array('member_id'=>$product['shangjia']))->getfield('uname'); ?>)订单<?php else: ?>系统订单<?php endif; ?></td>
                    <td class="left"><img src="<?php echo ($product['com_img']); ?>" width="50" height="50"/></td>
                    <td class="left">
                        <a href="<?php echo U('Goods/edit',array('id'=>$product['goods_id']));?>"></a>
                        <br/>
                        &nbsp;<small><?php echo ($product['com_name']); ?></small>
                    </td>
                    <td class="left">
                        <?php echo M("product_cate")->where(array("id"=>$product['com_shoptype']))->getField("name"); ?>
                    </td>
                    <td class="right"><?php echo ($product['size']); ?>+<?php echo ($product['color']); ?></td>
                    <td class="right">￥<?php echo ($product['com_price']); ?></td>
                    <td class="right"><?php echo ($product['com_num']); ?></td>
                    <td class="right">￥<?php echo ($product['com_price']*$product['com_num']); ?></td>
                </tr>

                <?php
 } ?>
                </tbody>
            </table>

        </div>

        <!-- 确认发货 -->

        <div id="tab-fahuo" class="tab-pane">
            <form action="<?php echo U('/Order/give');?>" method="post">
                <input type="hidden" name="oid" value="<?php echo ($order['order_id']); ?>">
                <tr>
                    <td>货运方式</td>
                    <td><input type="text" size="15" name="kd_type" placeholder="快递类型"/></td>
                </tr>
                <tr>
                    <td>快递单号</td>
                    <td><input type="text" size="60" name="kd_no" placeholder="快递单号"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="确认发货"></td>
                </tr>
            </form>
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
        $('#history').load('<?php echo U("Order/history",array("id"=>I("id"))); ?>');
        $('#button-history').live('click', function () {

            $.ajax({
                url: '<?php echo U("Order/history",array("id"=>I("id"))); ?>',
                type: 'post',
                dataType: 'html',
                data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
                beforeSend: function () {
                    $('.success, .warning').remove();
                    $('#button-history').attr('disabled', true);
                    $('#history').prepend('<div class="attention"><img src="./Public/sadmin/img/loading.gif" alt="" />加载中...</div>');
                },
                complete: function () {
                    $('#button-history').attr('disabled', false);
                    $('.attention').remove();
                },
                success: function (html) {
                    $('#history').html(html);

                    $('textarea[name=\'comment\']').val('');

                    $('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
                }
            });
        });
    </script>
		
	</body>
</html>