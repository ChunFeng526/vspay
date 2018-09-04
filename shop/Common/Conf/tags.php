<?php
    //中英文切换需要的文件,似乎只要第一行app_begin就可以了
    return array(
        // 添加下面一行定义即可
        'app_begin' => array('Common\Behavior\CheckLangBehavior'),
        //注意这里，官方的文档解释感觉有误（大家自行分辨），TP3.2.3用Behavior\CheckLang会出错，提示：Class 'Behavior\CheckLang' not found
        'LANG_SWITCH_ON' => true,   // 开启语言包功能
        'LANG_AUTO_DETECT' => true,    // 自动侦测语言 开启多语言功能后有效
        'LANG_LIST'        => 'zh-cn,en-us', // 允许切换的语言列表 用逗号分隔
        'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
    );
    ?>