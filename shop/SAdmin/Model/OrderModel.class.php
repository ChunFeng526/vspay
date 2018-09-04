<?php
/**
 * oscshop 电子商务系统
 *
 * ==========================================================================
 * @link      http://www.oscshop.cn/
 * @copyright Copyright (c) 2015 oscshop.cn. 
 * @license   http://www.oscshop.cn/license.html License
 * ==========================================================================
 *
 * @author    李梓钿
 *
 */
namespace SAdmin\Model;

class OrderModel{
	
	/**
	 *显示订单状态单位分页	 
	 */
	public function show_order_page($search){
		
		$sql="SELECT o.order_id,o.order_no,o.uid,o.status,o.time,o.buy_price,o.buy_name,o.buy_phone,o.seluid FROM "
		.C('DB_PREFIX').'order o WHERE 1=1 ';
		
		if(isset($search['order_no'])){
			$sql.=" and  o.order_no like '%".$search['order_no']."%'";
		}
		
		if(isset($search['user_phone'])){
			$sql.=" and m.phone like '%".$search['user_phone']."%'";
		}

		if(isset($search['buy_name'])){
			$sql.=" and o.buy_name like '%".$search['buy_name']."%'";
		}

		if(isset($search['buy_phone'])){
			$sql.=" and o.buy_phone like '%".$search['buy_phone']."%'";
		}

		if(isset($search['status'])){
			$sql.=" and o.status like '%".$search['status']."%'";
		}

		if(isset($search['is_duobao'])){
			$sql.=" and o.is_duobao like '%".$search['is_duobao']."%'";
		}

		$count=count(M()->query($sql));
		
		$Page = new \Think\Page($count,C('BACK_PAGE_NUM'));
		$show  = $Page->show();// 分页显示输出			
		
		$sql.='ORDER BY field(o.status,1,2,0,3),o.time DESC LIMIT '.$Page->firstRow.','.$Page->listRows;
		


		$list=M()->query($sql);
	
		return array(
			'empty'=>'<tr><td colspan="20">~~暂无数据</td></tr>',
			'list'=>$list,
			'page'=>$show
		);

	}
	//订单信息
	public function order_info($id){
		//订单详情
		$order_sql="SELECT o.*,m.com_name FROM "
		.C('DB_PREFIX').'order o,'.C('DB_PREFIX').'order_detail m WHERE m.uid = o.uid AND  o.order_id='.$id;

		$order=M()->query($order_sql);
		// var_dump($order[0]);
		return $order[0];
		
	}
	
 	function addOrderHistory($order_id, $data) {		
		
		$order['order_id']=$order_id;
		$order['date_modified']=time();
		$order['order_status_id']=$data['order_status_id'];
		M('Order')->save($order);		
		
		$oh['order_id']=$order_id;
		$oh['order_status_id']=$data['order_status_id'];
		$oh['notify']=(isset($data['notify']) ? (int)$data['notify'] : 0) ;
		$oh['comment']=strip_tags($data['comment']);
		$oh['date_added']=time();
		$oh_id=M('OrderHistory')->add($oh);

		return $oh_id;
		
	}

		public function getOrderHistories($order_id) {
		

		$query = M()->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " 
		. C('DB_PREFIX') . "order_history oh LEFT JOIN " 
		. C('DB_PREFIX') . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id 
	    . "' ORDER BY oh.date_added ASC");

		return $query;
	}

	function del_order($id){
		
		M('order')->where(array('order_id'=>$id))->delete();
		M('order_detail')->where(array('order_id'=>$id))->delete();
					
		return array(
			'status'=>'success',
			'message'=>'删除成功',
			'jump'=>U('Order/index')
		);
	}
	
}
?>