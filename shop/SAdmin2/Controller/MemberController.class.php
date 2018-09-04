<?php

namespace SAdmin\Controller;
use SAdmin\Model\MemberModel;

class MemberController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='用户';
			$this->breadcrumb2='前台用户';
	}

     public function index(){

		$model=new MemberModel();

		$filter=I('get.');

		$search=array();

		if(isset($filter['name'])){
			$search['name']=$filter['name'];
		}
		if(isset($filter['phone'])){
			$search['phone']=$filter['phone'];
		}

		 if(isset($filter['member_id'])){
			 $search['member_id']=$filter['member_id'];
		 }
		$data=$model->show_member_page($search);

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出

    	$this->display();
	 }

	function add(){
		$model=new MemberModel();
		if(IS_POST){
			$data=I('post.');
			$f = M('member')->where(array('phone'=>$data['fid']))->find();
			if($f){
				$data['fid']=$f['member_id'];
			}else{
				$this->error('未找到推荐人！');
				exit;
			}

			$return=$model->add_member($data);
			$this->osc_alert($return);
		}
		$this->crumbs='新增';

		$this->display();
	}

	function info(){
		$model=new MemberModel();
		if(IS_POST){
			$data=I('post.');
			$return=$model->edit_info($data);
			$this->osc_alert($return);
		}
		$this->crumbs='编辑';
		$this->action=U('Member/info');
		$this->data=$model->info(I('id'));

		$this->display();
	}
	public function rmb(){
		$this->breadcrumb1='充值';
		$this->breadcrumb2='充值中心';
		if($_POST){
			$phone = $_POST['phone'];
			$rmb = $_POST['rmb'];
			$type= $_POST['type'];

			if(empty($type)){
				exit("<script language='javascript'>alert('充值类型不正确');history.go(-1);</script>");
			}
			$m = M('member')->where(array('phone'=>$phone))->find();
			if(empty($m)){
				exit("<script language='javascript'>alert('未找到该用户');history.go(-1);</script>");
			}
			//余额
			if($type==1){
				M('member_jifens')->where(array('member_id'=>$m['member_id']))->setInc('farmlink_jifen',$rmb);
			}
			//写入资金日志
			$ysrmb['uid'] = $m['member_id'];
			$ysrmb['type'] = $type;
			$ysrmb['rmb'] = $rmb;
			$ysrmb['time'] = date("Y-m-d H:i:s");
			M("rmb")->add($ysrmb);

			exit("<script language='javascript'>alert('操作成功！');history.go(-1);</script>");

		}

		$this->action=U('Member/rmb');
		$this->display();

	}


	public function chongzhi(){
		$this->breadcrumb1='财务';
		$this->breadcrumb2='充值管理';
		$member = M("chongzhi");
		$count      = $member->where()->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $member->where()->order('time desc')->limit($Page->firstRow.','.$Page->listRows)->select();


		foreach($list as $k=>$v){
			$m = M('member')->where(array('member_id'=>$v['uid']))->find();
			$list[$k]['uname']=$m['uname'];
		}

		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display(); // 输出模板
	}

	function okchong(){
		$id = I('get.id');
		$chongzhi = M("chongzhi");
		//处理充值
		$c = $chongzhi->where(array('id'=>$id))->find();
		$rmb = $c['rmb'];
		$m = M('member')->where(array('member_id'=>$c['uid']))->find();
		$rmbrmb = M("rmb");
		//余额处理
			$bmb = $m['rmb']+($rmb);

			M('member')->where(array('member_id'=>$c['uid']))->save(array('rmb'=>$bmb));

				//写入佣金日志
				$ysrmb['uid'] = $m['member_id'];
				$ysrmb['rmb'] = $rmb;
				$ysrmb['text']="充值：余额".$rmb."元";
				$ysrmb['time'] = date("Y-m-d H:i:s");
				$rmbrmb->add($ysrmb);


		//更新状态
		$ud['state'] =1;
		$udd['id'] = $id;
		$chongzhi->where($udd)->save($ud);
		echo "<script language='javascript'>alert('处理成功');history.go(-1);</script>";
	}
	//资金记录
	public function zijing(){
		$this->breadcrumb1='充值';
		$this->breadcrumb2='资金记录';
		$sql='SELECT * FROM '.C('DB_PREFIX').'rmb';
		$count=count(M()->query($sql));
		$Page = new \Think\Page($count,20);
		$show  = $Page->show();// 分页显示输出
		$sql.=' order by time desc LIMIT '.$Page->firstRow.','.$Page->listRows;
		$list=M()->query($sql);
		foreach($list as $k=>$v){
			$nnn = M('member')->where(array('member_id'=>$v['uid']))->find();
			$list[$k]['uname']=$nnn['uname'];

		}
		$this->assign('empty','没有数据');// 赋值数据集
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display();
	}

	//删除
	function del(){
		$uid = I('id');
		M('member')->where(array('member_id'=>$uid))->delete();
		$this->success('删除成功！');
		exit;
	}






		public function chongzhibiao()
	{
		$this->breadcrumb2 = '充值单';
		$nzbill = M('chongzhi');
		$count = $nzbill->count();
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();
		$list = $nzbill->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->display();
	}

public function dltchongzhi(){
	$id['id']=I('id');
	$shanchu=M('chongzhi')->where($id)->delete();
	if($shanchu){
		echo "<script language='javascript'>alert('删除成功');javascript:window.location.href=document.referrer;</script>";
	}else{
		echo "<script language='javascript'>alert('删除失败');javascript:window.location.href=document.referrer;</script>";
	}

}
	public function shenhe1(){
		$id['id']=I('id');
		$data['status']=I('status');
		$shenhe=M('chongzhi')->where($id)->save($data);
		if($shenhe){
			echo "<script language='javascript'>alert('处理成功');javascript:window.location.href=document.referrer;</script>";
		}else{
			echo "<script language='javascript'>alert('处理失败');javascript:window.location.href=document.referrer;</script>";
		}
	}


		public function chushoubiao()
	{
		$this->breadcrumb2 = '出售单';
		$nzbill = M('chushou');
		$count = $nzbill->count();
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();
		$list = $nzbill->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->display();
	}
	public function dltchushou(){
         	$id['id']=I('id');
	$shanchu=M('chushou')->where($id)->delete();
	if($shanchu){
		echo "<script language='javascript'>alert('删除成功');javascript:window.location.href=document.referrer;</script>";
	}else{
		echo "<script language='javascript'>alert('删除失败');javascript:window.location.href=document.referrer;</script>";
	}

	}
	public function shenhe(){
		$id['id']=I('id');
		$data['status']=I('status');
		$shenhe=M('chushou')->where($id)->save($data);
		if($shenhe){
			echo "<script language='javascript'>alert('处理成功');javascript:window.location.href=document.referrer;</script>";
		}else{
			echo "<script language='javascript'>alert('处理失败');javascript:window.location.href=document.referrer;</script>";
		}
	}

}
?>