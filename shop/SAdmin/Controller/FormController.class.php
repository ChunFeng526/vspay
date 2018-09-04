<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class FormController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='投诉';
			$this->breadcrumb2='投诉列表';
	}

		//列表
		function index(){
			$this->breadcrumb2='投诉列表';
			$list=M('bd')->where()->select();
			$this->assign('data',$data);
			$this->assign('list',$list);
			$this->display();

		}

		//表单内容列表
		function bdlist(){
			$bd_id = I('bd_id');
			$bsj = M('bsj')->where(array('bd_id'=>$bd_id))->select();

			$biaocun = M('biaocun'); // 实例化User对象3
			$search['bd_id'] = I('bd_id');
			$count = $biaocun->where($search)->count();
			$Page  = new \Think\Page($count,25);
			$show  = $Page->show();
			$biaocun = $biaocun->where($search)->order('bc_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();

			//json转php数组
			foreach($biaocun as $k=>$v){
				$biaocun[$k]['bc_shuju'] = json_decode($v['bc_shuju'],true);


			}
			//把数组转字符串
			foreach($biaocun as $k=>$v){
				foreach($v['bc_shuju'] as $kk=>$vv){
					if(is_array($vv)){
						$biaocun[$k]['bc_shuju'][$kk] = implode("|", $vv);
					}
				}

			}
			//print_r($biaocun);
			$this->assign('list',$biaocun);// 赋值数据集
			$this->assign('page',$show);// 赋值分页输出
			$this->assign('bsj',$bsj);
			$this->display(); // 输出模板
		}

		//新增数据
		function addsj(){
			$bd_id = $_GET['bd_id'];
			$bd = M('bd')->where(array('bd_id'=>$bd_id))->find();

			$bsj = M('bsj')->where(array('bd_id'=>$bd_id))->select();
			foreach($bsj as $k=>$v){
				$bsj[$k]['va'] = explode('|',$v['bsj_value']);
			}
			//添加
			if($_POST){

				/*
				$biaocun['bd_id']=$_POST['bd_id'];
				$biaocun['bc_shuju']=json_encode($_POST['shuju']);
				$biaocun['bc_time']=date('Y-m-d',time());
				M('biaocun')->add($biaocun);

				$url = U('Form/bdlist',array('bd_id'=>$biaocun['bd_id']));
				echo "<meta charset=\"utf-8\"/> <script>alert('新增成功')</script>";
				echo "<script>window.location.href='{$url}';</script>";
				exit; */
			}


			$url = U('Form/addsj');
			//print_r($bsj);exir;
			$this->assign('url',$url);
			$this->assign('bd_id',$bd_id);
			$this->assign('bd',$bd);
			$this->assign('bsj',$bsj);
			$this->display('editsj');
		}

		//编辑数据
		function editsj(){
			$bc_id = $_GET['bc_id'];

			$biaocun = M('biaocun') ->where(array('bc_id'=>$bc_id))->find();
			$bsj = M('bsj')->where(array('bd_id'=>$biaocun['bd_id']))->select();
			foreach($bsj as $k=>$v){
				$bsj[$k]['va'] = explode('|',$v['bsj_value']);
			}



			//json转php数组
			$biaocun['bc_shuju'] = json_decode($biaocun['bc_shuju'],true);


			foreach($biaocun['bc_shuju'] as $kk=>$vv){
				if(is_array($vv)){
					$biaocun['bc_shuju'][$kk] = implode("|", $vv);
				}
			}


			//修改
			if($_POST){
				$biaocun['bc_shuju']=json_encode(abacaAddslashes(RemoveXSS($_POST['shuju'])));


				M('biaocun')->where(array('bc_id'=>$_POST['bc_id']))->save($biaocun);

				$url = U('Form/editsj',array('bc_id'=>$_POST['bc_id']));
				echo "<meta charset=\"utf-8\"/> <script>alert('编辑成功')</script>";
				echo "<script>window.location.href='{$url}';</script>";
				exit;
			}
			$url = U('Form/editsj');
			$this->assign('url',$url);
			$this->assign('bsj',$bsj);
			$this->assign('info',$biaocun['bc_shuju']);
			$this->assign('bd_id',$biaocun['bd_id']);
			$this->display('editsj');

		}
		function ce(){
			$a = form(1);
			print_r($a);
		}

		//删除bc
		function delbc(){
			$bc_id = $_GET['bc_id'];
			M('biaocun')->where(array('bc_id'=>$bc_id,'dian_id'=>session('se_id')))->delete();
			$this->success('删除成功');

		}
		//新增
		function add(){
			$id =I('id');
			$url = U('bd/add');
			$this->breadcrumb2='新增单页';
			if(IS_POST){
				 $api=I('post.');

				 M("bd")->add($api);
				 	S('DB_CONFIG_DATA',null);
				$this->success('保存成功！');
			}
			$this->assign('url',$url);
			$this->display('edit');


		}
		//编辑
	 	function edit(){
			$id =I('id');
			$url = U('bd/save');
			$this->breadcrumb2='单页列表';
			$bd=$this->get_config_by_group($id);
			$this->assign('bd',$bd);
			$this->assign('url',$url);
			$this->display('edit');
		}

		function get_config_by_group($id){
			$list=M('bd')->where(array('id'=>$id))->find();
			return $list;
		}
		//保存
		function save(){
			if(IS_POST){
					$api=I('post.');
					 M("bd")->data($api)->save();
			}
			S('DB_CONFIG_DATA',null);
			$this->success('保存成功！');
		}
}
?>