<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class DogController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='农场';
			$this->breadcrumb2='狗狗配置';
	}

		//列表
		function index(){
			$dog = M('dog')->select();
			$this->assign('list',$dog);
			$this->display();
		}
		//编辑
		function edit(){
			$d_id = I('d_id');
			if($d_id){
				$dog = M('dog')->where(array('d_id'=>$d_id))->find();
				$this->assign('info',$dog);
			}

			$this->display();
		}

		//保存
		function save(){
			if(IS_POST){
				$d_id = I('d_id');
				if($d_id){
					$dog=I('post.');
					$dog['d_steal'] = $dog['d_steal']/100;


					M("dog")->data($dog)->save();
				}else{
					$dog=I('post.');
					$dog['d_steal'] = $dog['d_steal']/100;
					M("dog")->add($dog);
				}
			}
			$this->success('保存成功！');
		}

		//删除
		function del(){
			$d_id = I('d_id');
			if($d_id){
				M('dog')->where(array('d_id'=>$d_id))->delete();
			}
			$this->success('删除成功！');
		}

}
?>