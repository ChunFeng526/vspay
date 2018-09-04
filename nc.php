<?php

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

header("Content-Type:text/html; charset=utf-8");

define('APP_DEBUG', true);

define('BIND_MODULE','SAdmin');

define ('APP_PATH', './shop/' );

define('ROOT_PATH',str_replace('\\','/',dirname(__FILE__)) . '/');

define ('RUNTIME_PATH','./Runtime/');


require './ThinkPHP/ThinkPHP.php';