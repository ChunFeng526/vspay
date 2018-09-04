<?php

namespace SAdmin\Controller;
use SAdmin\Model\AdminUserModel;

class RecordController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='记录';
	}

	//团队记录
	function tuandui(){
		$this->breadcrumb2='团队记录';
		$td_list = M('td_list'); // 实例化User对象
		$count = $td_list->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $td_list->where($search)->order('time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['uid']))->getfield('uname');

		}
		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();

	}

	//分润记录
	function fenrun(){
		$this->breadcrumb2='分润记录';
		$fenrun = M('fenrun'); // 实例化User对象
		$count = $fenrun->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $fenrun->where($search)->order('f_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['f_uid']))->getfield('uname');
			$list[$k]['my_phone'] =  M('member')->where(array('member_id'=>$v['f_uid']))->getfield('phone');

			$list[$k]['zi_name'] =  M('member')->where(array('member_id'=>$v['f_zid']))->getfield('uname');
			$list[$k]['zi_phone'] =  M('member')->where(array('member_id'=>$v['f_zid']))->getfield('phone');
		}
		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();

	}
	//偷蛋记录
	function toudan(){
		$this->breadcrumb2='偷蛋记录';
		$toudan = M('toudan'); // 实例化User对象
		$count = $toudan->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $toudan->where($search)->order('t_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['t_uid']))->getfield('uname');
			$list[$k]['my_phone'] =  M('member')->where(array('member_id'=>$v['t_uid']))->getfield('phone');

			$list[$k]['zi_name'] =  M('member')->where(array('member_id'=>$v['t_buid']))->getfield('uname');
			$list[$k]['zi_phone'] =  M('member')->where(array('member_id'=>$v['t_buid']))->getfield('phone');
		}
		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();

	}
	//收蛋记录
	function shoudan(){
		$this->breadcrumb2='收蛋记录';
		$shoudan = M('shoudan'); // 实例化User对象
		$count = $shoudan->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $shoudan->where($search)->order('sd_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['sd_uid']))->getfield('uname');
			$list[$k]['my_phone'] =  M('member')->where(array('member_id'=>$v['sd_uid']))->getfield('phone');
			$list[$k]['bts'] =$v['sd_zong'] - $v['sd_num'];
		}
		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();
	}

	//赠送记录
	function transaction(){
		$this->breadcrumb2='赠送记录';
		$transaction = M('transaction'); // 实例化User对象
		$count = $transaction->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $transaction->where($search)->order('tr_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['tr_js_uid']))->getfield('uname');
			$list[$k]['my_phone'] =  M('member')->where(array('member_id'=>$v['tr_js_uid']))->getfield('phone');

			$list[$k]['zs_name'] = M('member')->where(array('member_id'=>$v['tr_zs_uid']))->getfield('uname');
			$list[$k]['zs_phone'] =  M('member')->where(array('member_id'=>$v['tr_zs_uid']))->getfield('phone');
		}
		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();
	}


	//交易记录
	function sell(){
		$this->breadcrumb2='交易记录';
		$sell= M('sell'); // 实例化User对象
		$count = $sell->where($search)->count();
		$Page  = new \Think\Page($count,25);
		$show  = $Page->show();
		$list = $sell->where($search)->order('se_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($list as $k=>$v){
			$list[$k]['my_name'] = M('member')->where(array('member_id'=>$v['se_uid']))->getfield('uname');
			$list[$k]['my_phone'] =  M('member')->where(array('member_id'=>$v['se_uid']))->getfield('phone');

			$list[$k]['zs_name'] = M('member')->where(array('member_id'=>$v['se_buid']))->getfield('uname');
			$list[$k]['zs_phone'] =  M('member')->where(array('member_id'=>$v['se_buid']))->getfield('phone');
		}

		$this->assign('page',$show);
		$this->assign('data',$data);
		$this->assign('list',$list);
		$this->display();
	}

}
?>