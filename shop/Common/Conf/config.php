<?php
return array(
	//数据库配置
	'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '127.0.0.1', // 服务器地址
    'DB_NAME'   => 'vspay2018', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => 'root', // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'ysk_', // 数据库表前缀


//    'DB_TYPE'   => 'mysql', // 数据库类型
//    'DB_HOST'   => '127.0.0.1', // 服务器地址
//    'DB_NAME'   => 'vpay0314_db', // 数据库名
//    'DB_USER'   => 'vpay0314_f', // 用户名
//    'DB_PWD'    => 's1HVfguWl14990O', // 密码
//    'DB_PORT'   => '3306', // 端口
//    'DB_PREFIX' => 'ysk_', // 数据库表前缀


    // 'MODULE_DENY_LIST'   => array('Common','Admin'),
    'MODULE_ALLOW_LIST'    =>    array('Home','Admin','Shop','Zadmin'),
    'DEFAULT_MODULE'       =>    'Home',
    'URL_MODULE_MAP'    =>    array('admin'=>'admin'),  //模块映射
    
    'URL_MODEL'=>2, //去掉index.php   
    //全局配置
    'SHOW_PAGE_TRACE'=>false,//页面追踪信息
    'AUTH_KEY'             => 'kkVg{EyPWCy:iJ*A-ZW&B+N%WlM^xHEqZGrVG<{,}J)gk``.;u|qD~d!(?"zj;@C', //系统加密KEY，轻易不要修改此项，否则容易造成用户无法登录，如要修改，务必备份原key

     // 全局命名空间
    'AUTOLOAD_NAMESPACE'   => array(
        'Util' => APP_PATH . 'Common/Util/',
    ),
    //引入tags类
    'LOAD_EXT_CONFIG' => 'tags', // 加载扩展配置文件

    //设置上传文件大小
    'UPLOAD_IMAGE_SIZE' =>2,
    // 文件上传默认驱动
    'UPLOAD_DRIVER'        => 'Local',

    // 文件上传相关配置
    'UPLOAD_CONFIG'        => array(
        'mimes'    => '', // 允许上传的文件MiMe类型
        'maxSize'  => 2 * 1024 * 1024, // 上传的文件大小限制 (0-不做限制，默认为2M，后台配置会覆盖此值)
        'autoSub'  => true, // 自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), // 子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/', // 保存根路径
        'savePath' => '', // 保存路径
        'saveName' => array('uniqid', ''), // 上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', // 文件保存后缀，空则使用原后缀
        'replace'  => false, // 存在同名是否覆盖
        'hash'     => true, // 是否生成hash编码
        'callback' => false, // 检测文件是否存在回调函数，如果存在返回文件信息数组
    ),

    'SESSION_OPTIONS'         =>  array(
        'name'                =>  'BJYSESSION',                    //设置session名
        'expire'              =>  24*3600*15,                      //SESSION保存15天
        'use_trans_sid'       =>  1,                               //跨页传递
        'use_only_cookies'    =>  0,                               //是否只开启基于cookies的session的会话方式
    ),
//    'TMPL_EXCEPTION_FILE'=>'./404.html',
//    'ERROR_PAGE'            =>  './404.html', // 错误定向页面
);