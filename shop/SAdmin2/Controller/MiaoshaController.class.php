<?php
namespace SAdmin\Controller;
use Think\Controller;
class MiaoshaController extends CommonController {


	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='商品';
			$this->breadcrumb2='秒杀订单';
	}
	//处理首页
	function index(){
		$miaosha= M('miaosha');
		$count = $miaosha->where($search)->count();
		$Page  = new \Think\Page($count,10);
		$show  = $Page->show();
		$list = $miaosha->where($search)->order('time')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['cpname'] = M('goods')->where(array('goods_id'=>$v['cp_id']))->getfield('name');
			$list[$k]['uname'] = M('member')->where(array('member_id'=>$v['uid']))->getfield('uname');
		}
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display(); // 输出模板
	}

	//处理秒杀
	function savems(){
		$id = I('id');

		M('miaosha')->where(array('id'=>$id))->save(array('status'=>1));
		$this->success('处理成功');

	}
	//处理秒杀
	function savema(){
		$ma = I('ma');

		M('miaosha')->where(array('ma'=>$ma))->save(array('status'=>1));
		$this->success('处理成功');

	}

}