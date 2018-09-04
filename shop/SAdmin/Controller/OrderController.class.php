<?php

namespace SAdmin\Controller;
use SAdmin\Model\OrderModel;
class OrderController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
			$this->breadcrumb1='订单';

	}

     public function index(){
		 $this->breadcrumb2='订单管理';
		$model=new OrderModel();

		$filter=I('get.');

		$search=array();

		if(isset($filter['order_no'])){
			$search['order_no']=$filter['order_no'];
			$this->order_no=$search['order_no'];
		}
		if(isset($filter['user_phone'])){
			$search['user_phone']=$filter['user_phone'];
			$this->user_phone=$search['user_phone'];
		}
		if(isset($filter['buy_name'])){
			$search['buy_name']=$filter['buy_name'];
			$this->buy_name=$search['buy_name'];
		}

		if(isset($filter['buy_phone'])){
			$search['buy_phone']=$filter['buy_phone'];
			$this->buy_phone=$search['buy_phone'];
		}

		if(isset($filter['status'])){
			$search['status']=$filter['status'];
			$this->status=$search['status'];
		}


		 $search['is_duobao']=1;
		 $this->status=$search['is_duobao'];

		$data=$model->show_order_page($search);


		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出


    	$this->display();
	 }



	public function duobao(){
		$this->breadcrumb2='夺宝订单';
		$model=new OrderModel();

		$filter=I('get.');

		$search=array();

		if(isset($filter['order_no'])){
			$search['order_no']=$filter['order_no'];
			$this->order_no=$search['order_no'];
		}
		if(isset($filter['user_phone'])){
			$search['user_phone']=$filter['user_phone'];
			$this->user_phone=$search['user_phone'];
		}
		if(isset($filter['buy_name'])){
			$search['buy_name']=$filter['buy_name'];
			$this->buy_name=$search['buy_name'];
		}

		if(isset($filter['buy_phone'])){
			$search['buy_phone']=$filter['buy_phone'];
			$this->buy_phone=$search['buy_phone'];
		}

		if(isset($filter['status'])){
			$search['status']=$filter['status'];
			$this->status=$search['status'];
		}


		$search['is_duobao']=2;
		$this->status=$search['is_duobao'];

		$data=$model->show_order_page($search);

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出


		$this->display();
	}

	 public function give(){
	 	$kd_no = I("kd_no");
	 	$oid = I("oid");
	 	$kd_type = I("kd_type");

//	 	if(!$kd_no) $this->error("快递单号不为空");
//	 	if(!$kd_type) $this->error("快递类型不为空");
	 	if(!$oid) $this->error("找不到订单信息");

	 	//该订单是否存在 并且是待发货状态
	 	$order = M("order")->where(array('order_id'=>$oid))->find();

	 	if($order['status']==1){
	 		M("order")->where(array('order_id'=>$oid))->setField("kd_no",$kd_no);
	 		M("order")->where(array('order_id'=>$oid))->setField("kd_type",$kd_type);
	 		M("order")->where(array('order_id'=>$oid))->setField("status",2);
	 		$this->success("发货成功");
	 	}else{
	 		$this->error("订单不存在或已发货");
	 	}

	 }


	 function print_order(){
	 	$model=new OrderModel();

		$this->order=$model->order_info(I('id'));
		$this->print=true;
		$this->display('./Themes/Home/default/Mail/order.html');
	 }

	 public function show_order(){

	 	$this->crumbs='订单详情';

	 	$model=new OrderModel();




		$this->order=$model->order_info(I('id'));
		// var_dump(I('id'));

	 	$this->display('show');
	 }
	 function history(){
	 		$model=new OrderModel();

			if(IS_POST){

				if(I('order_status_id')==C('cancel_order_status_id')){
					$Order = new \Home\Model\OrderModel();
					$Order->cancel_order($_GET['id']);
					storage_user_action(session('user_auth.uid'),session('user_auth.username'),C('BACKEND_USER'),'取消了订单  '.$_GET['id']);
					$result=true;
				}else{
					$result=$model->addOrderHistory($_GET['id'],$_POST);
				}

			/**
			 * 判断是否选择了通知会员，并发送邮件
			 */
			if(I('notify')==1){
				$order_info=M('order')->find($_GET['id']);

				$status=get_order_status_name(I('order_status_id'));

				$model=new \SAdmin\Model\OrderModel();
			    $this->order=$model->order_info($_GET['id']);
				$this->seller_comment=$_POST['comment'];
			    $html=$this->fetch('./Themes/Home/default/Mail/order.html');
			    think_send_mail($order_info['email'],$order_info['name'],'订单-'.$status.'-'.C('SITE_NAME'),$html);
			}

				if($result){
					$this->success='新增成功！！';
				}else{
					$this->error='新增失败！！';
				}
			}

			$results = $model->getOrderHistories($_GET['id']);

			foreach ($results as $result) {
				$histories[] = array(
					'notify'     => $result['notify'] ? '是' : '否',
					'status'     => $result['status'],
					'comment'    => nl2br($result['comment']),
					'date_added' => date('Y/m/d H:i:s', $result['date_added'])
				);
			}

			$this->histories=$histories;

			$this->display();
	}

	function del(){
		$model=new OrderModel();
		$return=$model->del_order(I('get.id'));
		$this->osc_alert($return);
	}
	function odel(){
		$sql = 'truncate table yilianka_order';
		$sql2 = 'truncate table yilianka_order_data';
		$ok = M()->execute($sql);
		M()->execute($sql2);
		echo "<script>alert('删除成功！');history.go(-1);</script>";
	}

	function oodel(){
		M('order')->where('order_status_id=3')->delete();
		echo "<script>alert('删除成功！');history.go(-1);</script>";
	}
}
?>