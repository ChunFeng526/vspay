<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class AdminUserController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='用户';
			$this->breadcrumb2='后台用户';
	}

     public function index(){

		$model=new AdminUserModel();

		$data=$model->show_admin_user_page();

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出

    	$this->display();
	 }

	function add(){
		$model=new AdminUserModel();
		if(IS_POST){
			$data=I('post.');
			$return=$model->add_admin_user($data);
			$this->osc_alert($return);
		}
		$this->crumbs='新增';
		$this->action=U('AdminUser/add');

		$this->display();
	}

	function info(){
		$model=new AdminUserModel();
		if(IS_POST){
			$data=I('post.');
			$return=$model->edit_admin_user($data);
			$this->osc_alert($return);
		}
		$this->crumbs='编辑';
		$this->action=U('AdminUser/info');
		$this->data=M('Admin','nc_')->find(I('id'));

		$this->display();
	}

	function del(){
		$uid = session('user_auth.uid');
		$sid = I('id');
		if($uid!=1){
			$this->error('您不是超级管理员，无法删除其他管理员');
			exit;
		}
		if($sid==1){
			$this->error('您无法删除超级管理员');
			exit;
		}

		M('admin','nc_')->where(array('a_id'=>$sid))->delete();
		$this->success('删除成功！');
	}

}
?>