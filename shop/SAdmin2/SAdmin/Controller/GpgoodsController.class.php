<?php

namespace SAdmin\Controller;
use SAdmin\Model\arrayjoinModel;
class GpgoodsController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
		$this->breadcrumb1='道具商城';
		$this->breadcrumb2='道具管理';
	}

	public function index(){
		$data=I('post.');
		if($data['name'] != ''){
			$where['name'] = $data['name'];
			$where['type'] = $data['type'];
			$where['daoju_limit'] = $data['daoju_limit'];

		}
		$list = M('daojugoods')->order('goods_id asc')->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('name',$data['name']);
		$this->assign('type',$data['type']);
		$this->assign('daoju_limit',$data['daoju_limit']);
		$this->display();
	}

	function edit(){
		$id = I('id');
		if(IS_POST){
			$data=I('post.');
			$id = I('goods_id');
			M('daojugoods')->save($data);

			M('goods_discount')->where(array('goods_id'=>$id))->delete();
			if (isset($data['goods_discount'])) {
				foreach ($data['goods_discount'] as $discount) {
					$adddd['goods_id']=(int)$id;
					M('goods_discount')->add($adddd);
				}
			}

			$re = array(
				'status'=>'success',
				'message'=>'编辑成功',
				'jump'=>U('Gpgoods/index')
				);
			$this->osc_alert($re);
			exit;
		}
		$this->crumbs='编辑';
		$this->action=U('Gpgoods/edit');
		$info = M('daojugoods')->where(array('goods_id'=>$id))->find();
		$this->goods_discount=M('goods_discount')->where(array('goods_id'=>I('id')))->order('quantity ASC')->select();
		$this->info=$info;
		$this->assign('id',$id);
		$this->display('edit');
	}


	function add(){
		if(IS_POST){
			$data=I('post.');

			if($data['type'] <= 0){
				$re = array(
					'status'=>'error',
					'message'=>'请填写类型',
					'jump'=>U('Gpgoods/index')
				);
			}

			if($data['price'] <= 0){
				$re = array(
					'status'=>'error',
					'message'=>'请填写正确的价格',
					'jump'=>U('Gpgoods/index')
				);
			}
			$res_add = M('daojugoods')->add($data);
			if($res_add){
				$re = array(
					'status'=>'success',
					'message'=>'新增成功',
					'jump'=>U('Gpgoods/index')
				);
				$this->osc_alert($re);
				exit;
			}
		}
		$this->display('edit');
	}


	/*删除道具*/
	function Del(){
		$data=I('post.');
		$id = I('id');
		$re = M('daojugoods')->where(array('goods_id'=>$id))->delete();
		if($re){
			$re = array(
				'status'=>'success',
				'message'=>'删除成功',
				'jump'=>U('Gpgoods/index')
			);
		}

		$this->osc_alert($re);
	}
}
?>