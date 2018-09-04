<?php
namespace SAdmin\Controller;
use SAdmin\Model\StatisticsModel;
class IndexController extends CommonController {
   	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='首页';
			$this->breadcrumb2='首页';
	}
    public function index(){
   		$nowtime = date('Y-m-d');
   		$lastdaytime = date('Y-m-d',strtotime("$nowtime -1 day"));
		$lastdaytime = strtotime($lastdaytime);
		$nowtime = strtotime($nowtime);

		$ordernums = M('order')->where(array('time'=>array('between',$lastdaytime,$nowtime),'status'=>1))->count(1) + 0;
		$usrall = M('member')->where(array('create_time'=>array('between',$lastdaytime,$nowtime)))->count(1) + 0 ;
		
        $this->assign('usrall',$usrall);
        $this->assign('ordernums',$ordernums);
		$this->display();
	}
}