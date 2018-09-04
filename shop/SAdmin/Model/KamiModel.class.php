<?php

namespace SAdmin\Model;

class KamiModel{
	

	function del_kami($id){
		
		M('goods_data')->where(array('id'=>$id))->delete();
		
		return array(
			'status'=>'success',
			'message'=>'删除成功',
			'jump'=>U('Kami/kmlist')
		);
	}
	
		function pidel($id){
		M('goods_data')->where(array('id'=>array('in',$id)))->delete();
		return array(
			'status'=>'success',
			'message'=>'删除成功',
			'jump'=>U('Kami/kmlist')
		);
	}
		
		function yijian($id){
		M('goods_data')->where(array('shopid'=>$id))->delete();
		return array(
			'status'=>'success',
			'message'=>'删除成功',
			'jump'=>U('Goods/index')
		);
	}
	
}
?>