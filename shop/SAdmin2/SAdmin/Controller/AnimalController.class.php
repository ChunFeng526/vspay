<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class AnimalController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='农场';
			$this->breadcrumb2='动物配置';
	}

		//列表
		function index(){
			$animal = M('animal')->select();
			$this->assign('list',$animal);
			$this->display();
		}


		//编辑
		function edit(){
			$dw_id = I('dw_id');
			if($dw_id){
				$animal = M('animal')->where(array('dw_id'=>$dw_id))->find();
				$this->assign('info',$animal);
			}

			$this->display();
		}

		//保存
		function save(){
			if(IS_POST){
				$dw_id = I('dw_id');
				if($dw_id){
					$animal=I('post.');

					M("animal")->data($animal)->save();
				}else{
					$animal=I('post.');
					M("animal")->add($animal);
				}
			}
			$this->success('保存成功！');
		}

		//删除
		function del(){
			$dw_id = I('dw_id');
			if($dw_id){
				M('animal')->where(array('dw_id'=>$dw_id))->delete();
			}
			$this->success('删除成功！');
		}

}
?>