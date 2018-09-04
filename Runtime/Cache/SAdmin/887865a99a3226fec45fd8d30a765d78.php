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

            <button name="send" form="form-goods" type="submit" style="float:right;" class="btn btn-sm btn-primary">提交
            </button>

        </h1>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-goods"
                      class="form-horizontal">

                    <?php if(!empty($_GET['id'])): ?><input name="id" type="hidden" value="<?php echo ($_GET['id']); ?>"/><?php endif; ?>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab">基本信息</a></li>
                        <li><a href="#tab-image" data-toggle="tab">图片管理</a></li>
                      <!--   <li><a href="#tab-params" data-toggle="tab">参数管理</a></li> -->
                        <!--<li><a href="#tab-discount" data-toggle="tab">折扣</a></li>                    -->
                        <!--<li><a href="#tab-image" data-toggle="tab">图片参数</a></li>            -->
                    </ul>
                    <div class="tab-content">
                        <!-- 基本信息 START -->
                        <div class="tab-pane active" id="tab-general">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">总后台店铺名称：</label>
                                <div class="col-sm-10">
                                    <input id="input-name2" class="form-control" type="text" placeholder="总后台店铺名称"
                                           value="<?php echo ((isset($goods["shop_name"]) && ($goods["shop_name"] !== ""))?($goods["shop_name"]):''); ?>" name="shop_name">
                                </div>
                            </div>
      

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">发货地址：</label>
                                <div class="col-sm-10">
                                    <input id="input-name2" class="form-control" type="text" placeholder="店铺地址"
                                           value="<?php echo ((isset($goods["shop_address"]) && ($goods["shop_address"] !== ""))?($goods["shop_address"]):''); ?>" name="shop_address">
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">选择分类：</label>
                                <div class="col-sm-10">
                                    <select name="shop_type">

                                        <?php if(($goods['id'] == 1) ): ?><option value="<?php echo ($goods['shop_type']); ?>">
                                        <?php  $type['type']=$goods['shop_type']; $d_name=M('product_cate')->where($type)->find(); echo $d_name['name']; ?>
                                        </option>
                                        <?php else: ?>
                                        <option value="">-选择分类-</option><?php endif; ?>
                                        <?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><option value="<?php echo ($v["type"]); ?>"><?php echo ($v["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                            </div>


    

                        </div>
                        <div class="tab-pane" id="tab-image">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-image">
                                    <span title="" data-toggle="tooltip" data-original-title="上传200x200的图片">总后台店铺Logo：</span>
                                </label>

                                <div class="col-sm-10 thumb">
                                    <a href="#" data-toggle="pic" class="img-thumbnail">
                                        <img osctype="image" height="200" width="200"
                                        <?php if($goods['shop_logo']): ?>src="<?php echo ($goods["shop_logo"]); ?>"
                                            <?php else: ?>
                                            src="/Common/image/no_image_100x100.jpg"<?php endif; ?>
                                        />
                                    </a>
                                    <input osctype="image_input" type="hidden" name="shop_logo"
                                           value="<?php echo ((isset($goods["shop_logo"]) && ($goods["shop_logo"] !== ""))?($goods["shop_logo"]):''); ?>" id="shop_logo"/>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-image">
                                    <span title="" data-toggle="tooltip" data-original-title="上传800x800的图片">二维码：</span>
                                </label>

                                <div class="col-sm-10 thumb">
                                    <a href="#" data-toggle="image" class="img-thumbnail">
                                        <img osctype="image" height="200" width="200"
                                        <?php if($goods['shop_Vpay']): ?>src="<?php echo ($goods["shop_Vpay"]); ?>"
                                            <?php else: ?>
                                            src="/Common/image/no_image_100x100.jpg"<?php endif; ?>
                                        />
                                    </a>
                                    <input osctype="image_input" type="hidden" name="shop_Vpay"
                                           value="<?php echo ((isset($goods["shop_Vpay"]) && ($goods["shop_Vpay"] !== ""))?($goods["shop_Vpay"]):''); ?>" id="shop_Vpay"/>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-image">
                                    <span title="" data-toggle="tooltip" data-original-title="上传750x550的图片">微信二维码：</span>
                                </label>

                                <div class="col-sm-10 thumb">
                                    <a href="#" data-toggle="image" class="img-thumbnail">
                                        <img osctype="image"  height="200" width="200"
                                        <?php if($goods['shop_weixin']): ?>src="<?php echo ($goods["shop_weixin"]); ?>"
                                            <?php else: ?>
                                            src="/Common/image/no_image_100x100.jpg"<?php endif; ?>
                                        />
                                    </a>
                                    <input osctype="image_input" type="hidden" name="shop_weixin"
                                           value="<?php echo ((isset($goods["shop_weixin"]) && ($goods["shop_weixin"] !== ""))?($goods["shop_weixin"]):''); ?>" id="shop_weixin"/>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-image">
                                    <span title="" data-toggle="tooltip" data-original-title="上传750x550的图片">支付宝二维码：</span>
                                </label>

                                <div class="col-sm-10 thumb">
                                    <a href="#" data-toggle="image" class="img-thumbnail">
                                        <img osctype="image"  height="200" width="200"
                                        <?php if($goods['shop_zhifubao']): ?>src="<?php echo ($goods["shop_zhifubao"]); ?>"
                                            <?php else: ?>
                                            src="/Common/image/no_image_100x100.jpg"<?php endif; ?>
                                        />
                                    </a>
                                    <input osctype="image_input" type="hidden" name="shop_zhifubao"
                                           value="<?php echo ((isset($goods["shop_zhifubao"]) && ($goods["shop_zhifubao"] !== ""))?($goods["shop_zhifubao"]):''); ?>" id="shop_zhifubao"/>
                                </div>
                            </div>


        

                        </div>


                        <div class="tab-pane" id="tab-params">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">尺寸：</label>
                                <div class="input-group-addon">
                                    <input id="input-name2" class="form-control" type="text" placeholder="参数"
                                           value="<?php echo ($goods["csize"]); ?>" name="csize">
                                    <span class="input-group-addon">用英文","号隔开</span>
                                </div>

                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">颜色：</label>
                                <div class="input-group-addon">
                                    <input id="input-name2" class="form-control" type="text" placeholder="颜色"
                                           value="<?php echo ($goods["color_cate"]); ?>" name="color_cate">
                                    <span class="input-group-addon">用英文","号隔开</span>
                                </div>

                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name2">库存：</label>
                                <div class="col-sm-10">
                                    <input id="input-name2" class="form-control" type="text" placeholder="库存"
                                           value="<?php echo ($goods["stock"]); ?>" name="stock">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-description">商品详情：</label>
                                <div class="col-sm-10">
                                    <textarea name="content" id="description"><?php echo ((isset($goods["content"]) && ($goods["content"] !== ""))?($goods["content"]):''); ?></textarea>
                                </div>
                            </div>


                        </div>

                    </div>
            </div>
            </form>
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
		
    <style>
        .table thead > tr > td, .table tbody > tr > td {
            vertical-align: middle;
        }

        .table thead td span[data-toggle="tooltip"]:after, label.control-label span:after {
            font-family: FontAwesome;
            color: #1E91CF;
            content: "\f059";
            margin-left: 4px;
        }
    </style>

    <script src="/Common/ckeditor/ckeditor.js"></script>
    <script src="/Common/fileupload/jquery.ui.widget.js"></script>
    <script src="/Common/fileupload/jquery.fileupload.js"></script>
    <script>
        $('.jifentypes :checkbox').click(function () {
            var jifentypes = "";
            $("input:checkbox[name='jifens']:checked").each(function () {
                jifentypes += "," + $(this).val();
            });
            if (jifentypes != '') {
                $('.alltypes').val(jifentypes);
            }
        })
    </script>
    <script>
        CKEDITOR.replace('description', {
            filebrowserImageUploadUrl: '<?php echo U("Image/ckupload");?>',
            toolbar: [
                ['Source', 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'],
                ['FontSize', 'TextColor', 'BGColor'],
                ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'Image', 'Format']
            ]
        });

        var option_row = '<?php echo $option_row; ?>';

        $('input[name=\'option\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: '<?php echo U("Option/autocomplete");?>' + '/filter_name/' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                category: item['category'],
                                label: item['name'],
                                value: item['option_id'],
                                type: item['type'],
                                option_value: item['option_value']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                html = '<div class="tab-pane" id="tab-option' + option_row + '">';
                html += ' <input type="hidden" name="goods_option[' + option_row + '][goods_option_id]" value="" />';
                html += ' <input type="hidden" name="goods_option[' + option_row + '][name]" value="' + item['label'] + '" />';
                html += ' <input type="hidden" name="goods_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
                html += ' <input type="hidden" name="goods_option[' + option_row + '][type]" value="' + item['type'] + '" />';

                html += ' <div class="form-group">';
                html += '   <label class="col-sm-2 control-label" for="input-required' + option_row + '">必选</label>';
                html += '   <div class="col-sm-10"><select name="goods_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
                html += '       <option value="1">是</option>';
                html += '       <option value="0">否</option>';
                html += '   </select></div>';
                html += ' </div>';

                if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox') {

                    html += '<div class="table-responsive">';
                    html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                    html += '    <thead>';
                    html += '      <tr>';

                    if (item['type'] != 'select') {
                        html += '    <td class="text-right">图片</td>';
                    } else {
                        html += '    <td class="text-right"></td>';
                    }

                    html += '        <td class="text-left">选项值</td>';
                    html += '        <td class="text-right">商品数量</td>';
                    html += '        <td class="text-left">扣减库存</td>';
                    html += '        <td class="text-right">销售价格</td>';
                    html += '        <td class="text-right">重  量</td>';
                    html += '        <td></td>';
                    html += '      </tr>';
                    html += '    </thead>';
                    html += '    <tbody>';
                    html += '    </tbody>';
                    html += '    <tfoot>';
                    html += '      <tr>';
                    html += '        <td colspan="6"></td>';
                    html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ",'" + item['type'] + "'" + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary">新增</button></td>';
                    html += '      </tr>';
                    html += '    </tfoot>';
                    html += '  </table>';
                    html += '</div>';

                    html += '  <select id="option-values' + option_row + '" style="display: none;">';

                    for (i = 0; i < item['option_value'].length; i++) {
                        html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                    }

                    html += '  </select>';
                    html += '</div>';
                }

                $('#tab-option .tab-content').append(html);

                $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="icon-ban-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

                $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

                option_row++;
            }
        });

        var option_value_row = '<?php echo $option_value_row; ?>';

        function addOptionValue(option_row, type) {
            html = '<tr id="option-value-row' + option_value_row + '">';

            if (type == 'select') {
                html += '   <td></td>';
            } else {
                html += '  <td class="text-left"><a href="#" id="option-image-row' + option_value_row + '"data-toggle="image" num="' + option_value_row + '" type="option" class="img-thumbnail"><img osctype="option_image' + option_value_row + '" src="/Common/image/no_image_100x100.jpg" alt="" title="" /><input osctype="option_image_input' + option_value_row + '" type="hidden" name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][option_value_imgae]" value="" id="input-image' + option_value_row + '" /></td>';
            }


            html += '  <td class="text-left"><select name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
            html += $('#option-values' + option_row).html();
            html += '  </select><input type="hidden" name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][goods_option_value_id]" value="" /></td>';
            html += '  <td class="text-right"><input type="text" name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][quantity]" value=""  class="form-control" /></td>';
            html += '  <td class="text-left"><select name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][subtract]" class="form-control">';
            html += '    <option value="1">是</option>';
            html += '    <option value="0">否</option>';
            html += '  </select></td>';
            html += '  <td class="text-right"><select name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
            html += '    <option value="+">+</option>';
            html += '    <option value="-">-</option>';
            html += '  </select>';
            html += '  <input type="text" name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';

            html += '  <td class="text-right"><select name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
            html += '    <option value="+">+</option>';
            html += '    <option value="-">-</option>';
            html += '  </select>';
            html += '  <input type="text" name="goods_option[' + option_row + '][goods_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';


            html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="icon-trash bigger-120"></i></button></td>';
            html += '</tr>';

            $('#option-value' + option_row + ' tbody').append(html);
            $('[rel=tooltip]').tooltip();

            option_value_row++;
        }

        $('input[name=\'category\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: '<?php echo U("GoodsCategory/autocomplete");?>' + '/filter_name/' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'category\']').val('');

                $('#goods-category' + item['value']).remove();

                $('#goods-category').append('<div id="goods-category' + item['value'] + '"><i class="icon-ban-circle"></i> ' + item['label'] + '<input type="hidden" name="goods_category[]" value="' + item['value'] + '" /></div>');
            }
        });
        $('#goods-category').delegate('.icon-ban-circle', 'click', function () {
            $(this).parent().remove();
        });

        var image_row = '<?php echo $image_row; ?>';

        function addImage() {
            html = '<tr id="gallery-image-row' + image_row + '">';
            html += '  <td class="text-left"><a href="#" id="thumb-image' + image_row + '"data-toggle="image" type="gallery" num="' + image_row + '" class="img-thumbnail"><img osctype="gallery_image' + image_row + '" src="/Common/image/no_image_100x100.jpg" alt="" title="" /><input osctype="gallery_image_input' + image_row + '" type="hidden" name="goods_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
            html += '  <td class="text-right"><input type="text" name="goods_image[' + image_row + '][sort_order]" value="' + image_row + '" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#gallery-image-row' + image_row + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="icon-trash"></i></button></td>';
            html += '</tr>';

            $('#images tbody').append(html);

            image_row++;
        }

        var discount_row = <?php echo ((isset($discount_row ) && ($discount_row !== ""))?($discount_row ): '0'); ?>
        ;

        function addDiscount() {
            html = '<tr id="discount-row' + discount_row + '">';
            html += '  <td class="text-left"><input type="text" name="goods_discount[' + discount_row + '][quantity]" value="" class="form-control" /></td>';
            html += '  <td class="text-left"><input type="text" name="goods_discount[' + discount_row + '][price]" value="" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="icon-trash"></i></button></td>';
            html += '</tr>';

            $('#discount tbody').append(html);

            discount_row++;
        }

        $(function () {

            <?php if(isset($_GET['id'])): ?>Oscshop.setValue("status", <?php echo ((isset($goods["status"]) && ($goods["status"] !== ""))?($goods["status"]):1); ?>);
            Oscshop.setValue("subtract",<?php echo ((isset($goods["subtract"]) && ($goods["subtract"] !== ""))?($goods["subtract"]):1); ?>);
            Oscshop.setValue("shipping",<?php echo ((isset($goods["shipping"]) && ($goods["shipping"] !== ""))?($goods["shipping"]):1); ?>);<?php endif; ?>


            // tooltips on hover button-upload
            $('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});

            // Makes tooltips work on ajax generated content
            $(document).ajaxStop(function () {
                $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
            });

            $(document).delegate('a[data-toggle=\'pic\']', 'click', function (e) {
                e.preventDefault();
                var index = $(this).attr('num');
                var type = $(this).attr('type');
                var element = this;

                if (index == undefined) {
                    $(element).popover({
                        html: true,
                        placement: 'right',
                        trigger: 'manual',
                        content: function () {
                            return '<button type="button" id="thumb-image"  class="btn btn-primary"><i class="icon-edit"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="icon-trash"></i></button>';
                        }
                    });
                } else {
                    $(element).popover({
                        html: true,
                        placement: 'right',
                        trigger: 'manual',
                        content: function () {
                            return '<button type="button" n="' + index + '" t="' + type + '"  class="btn btn-primary button-image"><i class="icon-edit"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="icon-trash"></i></button>';
                        }
                    });
                }


                $(element).popover('toggle');


                //商品图片
                $('#thumb-image').on('click', function () {
                    var parents = $(element);
                    $('#modal-image').remove();

                    $('#form-upload').remove();

                    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input osctype="btn_upload_image" type="file" name="file" /></form>');

                    $('#form-upload input[name=\'file\']').trigger('click');

                    $(element).popover('hide');

                    $('[osctype="btn_upload_image"]').fileupload({

                        dataType: 'json',
                        url: "<?php echo U('Image/upload_image',array('dir'=>'product','w'=>'200','h'=>'200'));?>",
                        add: function (e, data) {
                            var parent = parents.parents(".thumb");
                            // $parent = $('#thumb');
                            var input = parent.find('[osctype="image_input"]');
                            var img = parent.find('[osctype="image"]');
                            data.formData = {old_goods_image: input.val()};
                            img.attr('src', "./Public/sadmin/img/loading.gif");
                            data.submit();
                        },
                        done: function (e, data) {

                            var image = data.result;

                            // $parent = $('#thumb');
                            var parent = parents.parents(".thumb");
                            var input = parent.find('[osctype="image_input"]');
                            var img = parent.find('[osctype="image"]');
                            if (image) {
                                // $img.prev('i').hide();
                                img.attr('src', '/' + image.image_thumb);
                                img.show();
                                input.val('/Uploads/image/' + image.image);
                            } else {
                                alert('上传失败');
                            }
                        }
                    });
                });


            });


            $(document).delegate('a[data-toggle=\'image\']', 'click', function (e) {
                e.preventDefault();
                var index = $(this).attr('num');
                var type = $(this).attr('type');
                var element = this;

                if (index == undefined) {
                    $(element).popover({
                        html: true,
                        placement: 'right',
                        trigger: 'manual',
                        content: function () {
                            return '<button type="button" id="thumb-image"  class="btn btn-primary"><i class="icon-edit"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="icon-trash"></i></button>';
                        }
                    });
                } else {
                    $(element).popover({
                        html: true,
                        placement: 'right',
                        trigger: 'manual',
                        content: function () {
                            return '<button type="button" n="' + index + '" t="' + type + '"  class="btn btn-primary button-image"><i class="icon-edit"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="icon-trash"></i></button>';
                        }
                    });
                }


                $(element).popover('toggle');


                //商品图片
                $('#thumb-image').on('click', function () {
                    var parents = $(element);
                    $('#modal-image').remove();

                    $('#form-upload').remove();

                    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input osctype="btn_upload_image" type="file" name="file" /></form>');

                    $('#form-upload input[name=\'file\']').trigger('click');

                    $(element).popover('hide');

                    $('[osctype="btn_upload_image"]').fileupload({

                        dataType: 'json',
                        url: "<?php echo U('Image/upload_image',array('dir'=>'product','w'=>'750','h'=>'550'));?>",
                        add: function (e, data) {
                            var parent = parents.parents(".thumb");
                            // $parent = $('#thumb');
                            var input = parent.find('[osctype="image_input"]');
                            var img = parent.find('[osctype="image"]');
                            data.formData = {old_goods_image: input.val()};
                            img.attr('src', "./Public/sadmin/img/loading.gif");
                            data.submit();
                        },
                        done: function (e, data) {

                            var image = data.result;

                            // $parent = $('#thumb');
                            var parent = parents.parents(".thumb");
                            var input = parent.find('[osctype="image_input"]');
                            var img = parent.find('[osctype="image"]');
                            if (image) {
                                // $img.prev('i').hide();
                                img.attr('src', '/' + image.image_thumb);
                                img.show();
                                input.val('/Uploads/image/' + image.image);
                            } else {
                                alert('上传失败');
                            }
                        }
                    });
                });


                //商品相册
                $('.button-image').on('click', function () {
                    $('#modal-image').remove();

                    $('#form-upload').remove();

                    var i = $(this).attr('n');
                    var type = $(this).attr('t');

                    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input osctype="btn_upload_image" type="file" name="file" /></form>');

                    $('#form-upload input[name=\'file\']').trigger('click');

                    $(element).popover('hide');

                    $('[osctype="btn_upload_image"]').fileupload({

                        dataType: 'json',
                        url: "<?php echo U('Image/upload_image/dir');?>" + '/' + type,
                        add: function (e, data) {
                            $parent = $('#image-row' + i);
                            $input = $parent.find('[osctype="' + type + '_image_input' + i + '"]');
                            $img = $parent.find('[osctype="' + type + '_image' + i + '"]');
                            var old_name = 'old_' + type + '_image';
                            data.formData = {old_name: $input.val()};
                            $img.attr('src', "./Public/sadmin/img/loading.gif");
                            data.submit();
                        },
                        done: function (e, data) {

                            var image = data.result;

                            $parent = $('#' + type + '-image-row' + i);
                            $input = $parent.find('[osctype="' + type + '_image_input' + i + '"]');
                            $img = $parent.find('[osctype="' + type + '_image' + i + '"]');
                            if (image) {
                                // $img.prev('i').hide();
                                $img.attr('src', '/' + image.image_thumb);
                                $img.show();
                                $input.val(image.image);
                            } else {
                                alert('上传失败');
                            }
                        }
                    });

                });


                $('#button-clear').on('click', function () {
                    $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

                    $(element).parent().find('input').attr('value', '');

                    $(element).popover('hide');
                });
            });
        });
        $('#option a:first').tab('show');
    </script>
		
	</body>
</html>