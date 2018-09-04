<?php
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;

class ThedetailController extends CommonController {
	

	public function index(){

		if(!empty($_POST)){

	      	if(!empty($_POST['mobile']))
	  		 	$arrData['mobile'] = array('like',"%".$_POST['mobile']."%");
	  		if(!empty($_POST['username']))
			 	$arrData['username'] = array('like',"%".$_POST['username']."%");
			if($_POST['vip']!='')
			 	$arrData['vip']=$_POST['vip'];

		}

		$M=M('users');

		$count = $M->where($arrData)->count('userid');// 查询满足要求的总记录数
		$Page   = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show   = $Page->show();// 分页显示输出

		$with = $M->where($arrData)->order('money desc')->limit($Page->firstRow.','.$Page->listRows)->select();

		$this->assign('u_info',$with);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		
		  
		$this->display();
	}


	public function showmoney($userid=null){
		if(empty($userid)){
			$this->error('数据出错!');
			return;
		}
		$users=M('users');
		$commission=M('commission');

		// 获取用户信息
		$u_info=$users->find($userid);
		// 级别收益
		$where['cid']=$userid;
		
		// 累计总收益
		$all_price=$commission->where($where)->sum('and_num');

		$where['com_jb']=1;
		$price=$commission->where($where)->sum('and_num');
		$total_price[1]=$price;

		$where['com_jb']=array('neq',1);
		$price=$commission->where($where)->sum('and_num');
		$total_price[2]=$price;

		$this->u_info=$u_info;
		$this->total_price=$total_price;
		$this->all_price=$all_price;//累计总收益
		$this->userid=$userid;

		$this->display();
	}



    public function detail($type=null,$userid=null)
    {
      
	  $users=M('users');
	  $gmsp=M('order');
	  $commission=M('commission');
	  	
	  /*
	  	查询
	   */
	  if(!empty($_POST)){
	  	$type=I('post.type');
	  	$userid=I('post.userid');
	  	$username=I('post.username','');
	  	$stert_date=I('post.stert_date','');
	  	$end_date=I('post.end_date','');
	  	if(!empty($username)){

	  		$arr_userid=$users->field('userid')->where("username like'%".$username."%'")->select();
	  		if(!empty($arr_userid)){
				foreach ($arr_userid as $k => $v) {
					$ids[]=$v['userid'];
				}
				if(!empty($ids))
					$where['t_userid']=array('IN',$ids);
			}
			else{
				$where['t_userid']=0;
			}
	  	}
	  	if($stert_date!='' && $end_date!=''){
	  		$where['t_time']=array('between',array(strtotime($stert_date),strtotime($end_date)));
	  	}
	  }
	  if($type==1)
	  	$where['com_jb']=1;
	  else
	  	$where['com_jb']=array('neq',1);
	  $where['cid']=$userid;

	  $count = $commission->where($where)->count('id');
	  $Page   = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
	  $show   = $Page->show();// 分页显示输出

	  $list = $commission->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
	  foreach ($list as $k => $v) {
	  	// 消费者信息
	  	$com=$users->field('username,vip,pid,mobile')->find($v['t_userid']);
	  	$list[$k]['username']=$com['username'];
	  	$list[$k]['vip']=$com['vip'];
	  	$list[$k]['mobile']=$com['mobile'];
	  	//订单信息
	  	$order=$gmsp->find($v['order_id']);
	  	if(!empty($order) && !empty($v['order_id'])){
	  		$list[$k]['order_total_price']=$order['order_total_price'];
	  		$list[$k]['order_shopname']=$order['order_shopname'];
	  		$list[$k]['order_no']=$order['order_no'];
	  	}
	  	
	  }

	  $this->assign('list',$list);// 赋值数据集
	  $this->assign('page',$show);// 赋值分页输出
	  $this->type=$type;
	  $this->userid=$userid;
		
      $this->display();
    }

 }