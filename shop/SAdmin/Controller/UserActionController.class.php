<?php

namespace SAdmin\Controller;
use SAdmin\Model\UserActionModel;
class UserActionController extends CommonController {
   	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='用户';
			$this->breadcrumb2='用户行为';
	}
    public function index(){

 		$model=new UserActionModel();

		$data=$model->show_user_action_page();

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出

    	$this->display();
	}
}