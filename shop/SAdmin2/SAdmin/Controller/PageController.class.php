<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class PageController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='单页';
			$this->breadcrumb2='单页列表';
	}

		//列表
		function index(){
			$this->breadcrumb2='单页列表';
			$list=M('Page')->where()->select();
			$this->assign('data',$data);
			$this->assign('list',$list);
			$this->display();

		}
		//新增
		function add(){
			$id =I('id');
			$url = U('Page/add');
			$this->breadcrumb2='新增单页';
			if(IS_POST){
				 $api=I('post.');

				 M("Page")->add($api);
				 	S('DB_CONFIG_DATA',null);
				$this->success('保存成功！');
			}
			$this->assign('url',$url);
			$this->display('edit');


		}
		//编辑
	 	function edit(){
			$id =I('id');
			$url = U('Page/save');
			$this->breadcrumb2='单页列表';
			$Page=$this->get_config_by_group($id);
			$this->assign('Page',$Page);
			$this->assign('url',$url);
			$this->display('edit');
		}

		function get_config_by_group($id){
			$list=M('Page')->where(array('id'=>$id))->find();
			return $list;
		}
		//保存
		function save(){
			if(IS_POST){
					$api=I('post.');
					 M("Page")->data($api)->save();
			}
			S('DB_CONFIG_DATA',null);
			$this->success('保存成功！');
		}
		function del(){
			$id =I('id');
			M('Page')->where(array('id'=>$id))->delete();
			$this->success('删除成功！');
		}


}
?>