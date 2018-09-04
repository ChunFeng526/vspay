<?php
return array(

	//加载扩展配置项
    'LOAD_EXT_CONFIG' => 'db,alipay',
	'FRONTEND_USER'=>'网站会员',
	'BACKEND_USER'=>'后台系统用户',
//	'AUTOLOAD_NAMESPACE' => array(
//	'Lib'     => APP_PATH.'Lib'
//	),
    'TMPL_TEMPLATE_SUFFIX' => '.html',

    'TMPL_PARSE_STRING' => array(
        '__PUBLIC__' => __ROOT__ . '/Common',
        '__RES__' => '/Public/Public/',
        '__IMG__' => '/Public/Public/images',
        '__JS__' => '/Public/Public/js',
        '__LAYERJS__'        => __ROOT__ . '/Public/home/common/layer',
        '__ICON__' => '/Public/Public/icon',
        '__ICON1__' => '/Public/Public/icon1',
        '__CSS__' => '/Public/Public/css',
        '__UP__' => __ROOT__ . '/Public/Public/Uploads',
        '__PIC__' => __ROOT__ . '/Public/Public/Uploads/image',
        '__USERPIC__' => __ROOT__ . '/Public/Public/Uploads/image/touxiang',
        '__LAYERMOBIL__' => '/Public/Public/layer_mobile/',
        '__FOOTER__' => '/Public/Public/',
        //商品图片
        '__PROIMGS__' => '/Uploads/image/product',

        /*头像*/
        '__TXIMG__' => __ROOT__ . '/Public/Public/Uploads/image/touxiang/',
        //上传头像
        '__IMGHEAD__'        => __ROOT__ . '/Public/home/wap/heads',

//      认证中心
        '__RZCSS__' => '/Public/Public/verify',
    ),


//
//    'SESSION_PREFIX' => 'SE_',
//    'COOKIE_PREFIX' => 'ck_',

    'URL_ROUTER_ON' => false,
    'URL_ROUTE_RULES' => array(

        '/^products\/(\d+)$/' => 'goods/all?p=:1',
        'products' => 'goods/all',

        '/^category\/(\w+)$/' => 'goods/category?id=:1',
        '/^category\/(\w+)\/p\/(\d+)$/' => 'goods/category?id=:1&p=:2',

        '/^gallery\/(\w+)$/' => 'gallery/pshow?id=:1',
        '/^gallerys\/(\d+)$/' => 'gallery/all?p=:1',
        'gallerys' => 'gallery/all',

        '/^gcategory\/(\w+)$/' => 'gallery/category?id=:1',
        '/^gcategory\/(\w+)\/p\/(\d+)$/' => 'gallery/category?id=:1&p=:2',


        '/^blogc\/(\w+)$/' => 'blog/category?cid=:1',

        '/^blogc\/(\w+)\/p\/(\d+)$/' => 'blog/category?cid=:1&p=:2',

        'blogs' => 'blog/index',

        '/^blog\/(\w+)$/' => 'blog/show_blog_content?id=:1',

        'reply' => 'form/reply',
        '/^replys\/(\w+)$/' => 'blog/show_reply?id=:1',

        'about' => 'html/about',
        'contact' => 'html/contact',
        'comment' => 'form/comment',

        '/^goods\/(\w+)$/' => 'goods/gshow?id=:1',

        'check_verify' => 'blog/check_verify',

        'cart' => 'cart/show_cart_goods',
        'cart_add' => 'cart/add',
        'cart_update' => 'cart/update_quantity',
        '/^remove\/(\S+)$/' => 'cart/remove?data=:1',
        'checkout' => 'cart/checkout',

        'c_login' => 'checkout/login',
        '/^c_user\/(\w+)$/' => 'checkout/user?u=:1',
        'c_register' => 'checkout/register',
        'confirm' => 'checkout/confirm',
        'c_getarea' => 'checkout/get_area',
        'shipping_method' => 'checkout/shipping_method',
        'shipping_address' => 'checkout/shipping_address',
        'validate_login' => 'checkout/validate_login',
        'payment_method' => 'checkout/payment_method',
        'validate_shipping_address' => 'checkout/validate_shipping_address',
        'validate_shipping_method' => 'checkout/validate_shipping_method',
        'validate_payment_method' => 'checkout/validate_payment_method',

        'login' => 'public/login',
        'register' => 'public/register',
        'logout' => 'public/logout',


        '/^order\/(\d+)$/' => 'user/order?p=:1',
        'order' => 'user/order',
        'password' => 'user/password',
        'address' => 'user/address',
        'add_address' => 'user/add_address',

        '/^edit_address\/(\w+)$/' => 'user/edit_address?id=:1',
        'edit_address' => 'user/edit_address',

        '/^delete_address\/(\w+)$/' => 'user/delete_address?id=:1',

        '/^info\/(\w+)$/' => 'user/info?id=:1',

        '/^cancel_order\/(\w+)$/' => 'user/cancel_order?id=:1',

        'account' => 'user/account',
        'pay_success' => 'user/pay_success',
        'forgot' => 'public/forgot'
    ),

);
