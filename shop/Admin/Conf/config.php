<?php
return array(
	//'配置项'=>'配置值'
	// 模板相关配置
    'TMPL_PARSE_STRING'    => array(
        '__PUBLIC__'     => __ROOT__ . '/Public',
        '__LYUI__'       => __ROOT__ . '/Public/libs/lyui/dist',
        '__ADMIN_IMG__'  => __ROOT__ . ltrim(APP_PATH, '.') . 'Admin/View/Public/img',
        '__ADMIN_CSS__'  => __ROOT__ . ltrim(APP_PATH, '.') . 'Admin/View/Public/css',
        '__ADMIN_JS__'   => __ROOT__ . ltrim(APP_PATH, '.') . 'Admin/View/Public/js',
        '__ADMIN_LIBS__' => __ROOT__ . ltrim(APP_PATH, '.') . 'Admin/View/Public/libs',
        '__APUBLIC__' => __ROOT__ . ltrim(APP_PATH, '.') . 'Admin/View/Public',
    ),
);