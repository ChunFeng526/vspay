<?php

namespace SAdmin\Model;
class MemberModel{
	/**
	 *显示分页	 
	 */
	public function show_member_page($search){
		
		$sql="select * from ".C('DB_PREFIX')."member where 1 ";
		
		if(isset($search['name'])){
			$sql.=" and uname like '%".$search['name']."%'";
		}
		if(isset($search['member_id'])){
			$sql.=" and member_id='".$search['member_id']."'";
		}
		if(isset($search['phone'])){
			$sql.=" and phone='".$search['phone']."'";
		}
		
		$count=count(M()->query($sql));
		
		$Page = new \Think\Page($count,C('BACK_PAGE_NUM'));
		$show  = $Page->show();// 分页显示输出	
		
		$sql.=' order by member_id desc LIMIT '.$Page->firstRow.','.$Page->listRows;
		
		$list=M()->query($sql);	
		
		return array(
			'empty'=>'<tr><td colspan="20">~~暂无数据</td></tr>',
			'list'=>$list,
			'page'=>$show
		);	
		
	}
	
	function add_member($data){
			if(empty($data['uname'])){
				$error="用户名不能为空！！";				
			}elseif(M('Member')->getByUname(trim($data['uname']))){
				$error="用户名已经存在！！";				
			}elseif(empty($data['pwd'])){
				$error="密码不能为空！！";				
			}
			
			if($error){		
				return array(
					'status'=>'back',
					'message'=>$error				
				);
			}
			
			$data['pwd']  =think_ucenter_encrypt($data['pwd'],C('PWD_KEY'));
			$data['create_time']  =time();
			$data['status']  =1;
			if(M('member')->add($data)){
				return array(
				'status'=>'success',
				'message'=>'新增成功',
				'jump'=>U('Member/index')
				);
			}else{
				return array(
				'status'=>'back',
				'message'=>'新增失败'
				
				);
			}
	}
	
	function info($id){
		$member=M('member')->find($id);
		
		return array(
			'info'=>$member,
			'address'=>$address
		);
	}
	
	function edit_info($d){
		$data=$d;
		$data['pwd']=think_ucenter_encrypt($d['pwd'],C('PWD_KEY'));
		$data['twopass']=think_ucenter_encrypt($d['twopass'],C('PWD_KEY'));
		$r=M('member')->where(array('member_id'=>$d['member_id']))->save($data);
		if($r){				
			return array(
				'status'=>'success',
				'message'=>'修改成功',
				'jump'=>U('Member/index')
				);	
		}else{
			return array(
				'status'=>'fail',
				'message'=>'修改失败',
				'jump'=>U('Member/index')
			);
		}
		
	}
	
}
?>