<?php

namespace SAdmin\Controller;
class SettingsController extends CommonController
{

	protected function _initialize()
	{
		parent::_initialize();
		$this->breadcrumb1 = '系统';

	}

	function other()
	{
		$this->breadcrumb2 = '其他选项';
		$this->other = $this->get_config_by_group('other');
		$this->display();
	}

	function image()
	{
		$this->breadcrumb2 = '图片尺寸';
		$this->image = $this->get_config_by_group('image');
		$this->display();
	}

	function msgs()
	{	
		if(IS_POST){
			
			$content=I('MSG');
			$account=I('MSG_account');
			$password=I('MSG_password');
			$re1=M('config','nc')->where(array('name'=>'MSG_password'))->setField('value',$password);
			$re2=M('config','nc')->where(array('name'=>'MSG_account'))->setField('value',$account);
			$re3=M('config','nc')->where(array('name'=>'MSG'))->setField('value',$content);
			
				return $this->success('修改成功', U('Settings/msgs'));
			
			
		}
		$this->breadcrumb2 = '短信设置';
		$this->site = $this->get_config_by_group('site');
		$content=M('config','nc')->where(array('name'=>'MSG'))->getField('value');
   	 	$account=M('config','nc')->where(array('name'=>'MSG_account'))->getField('value');
		$password=M('config','nc')->where(array('name'=>'MSG_password'))->getField('value');
		$this->assign('account', $account);
		$this->assign('password', $password);
		$this->assign('content', $content);
		$this->display();
	}
	function general()
	{
		$this->breadcrumb2 = '基本信息';
		$this->site = $this->get_config_by_group('site');
		$this->display();
	}

	/*公告信息*/
	public function notice()
	{
		$this->breadcrumb2 = '公告';
		$nzbill = M('notice');
		$count = $nzbill->count();
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();
		$list = $nzbill->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->display();
	}




	public function wenzhang()
	{
		$this->breadcrumb2 = '文章';
		$nzbill = M('wenzhang');
		$count = $nzbill->count();
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();
		$list = $nzbill->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->display();
	}
	/*公告信息詳情*/
	public function wen()
	{
		$this->breadcrumb2 = '文章';
		$ttle=M('wentype')->select();
		$this->assign('ttle',$ttle);
	/*	var_dump($ttle);die;*/
		$id = I('id');
		$configsAll = M('wenzhang');
		$msgll = $configsAll->where(array('id' => $id))->find();
		$this->assign('id', $id);
		$this->assign('msgll', $msgll);
		$this->display();
	}
	public function Savewen()
	{
		$id = I('id');
		$configsAll = M('wenzhang');
		$tid=I('tid');
        $type=M('wentype')->where(array('id'=>$tid))->find();
        $data['tid']=$tid;
        $data['type']=$type['title'];
		$data['title'] = I('title');
		$data['content'] = I('content');
		$data['linkone'] = I('linkone');
		$data['linktwo'] = I('linktwo');
		$ddtime=time();
		$data['addtime'] = date("Y-m-d H:i:s",$ddtime);
		if(empty($data['tid'])){
            echo '<script>alert("请选择文章所属"); window.history.back(-1); </script>';
            return;
        }

        if(empty($data['title'])){
           echo '<script>alert("请输入文章标题"); window.history.back(-1); </script>';
           return;
        }
        if(empty($data['content']) ){
           echo '<script>alert("请输入文章详情"); window.history.back(-1); </script>';
           return;
        }

		if ($id != '') {
			$res = $configsAll->where(array('id' => $id))->save($data);
			$this->success('修改成功！', U("Settings/wenzhang"));
		}else{
			if($tid){
			echo '<script>alert("已有相同分类的文章!"); window.history.back(-1); </script>';
			return;
		    }
			$res = $configsAll->add($data);
      		S('DB_CONFIG_DATA', null);
			$this->success('保存成功！', U("Settings/wenzhang"));
		}
	}
	public function dltwen(){
		$id['id']=I('id');

		if($id=4 || $id=5 || $id=6 || $id=13){
           echo '<script>alert("帮助中心、Vpay介绍、商城介绍、联系客服 根据需求删除!"); window.history.back(-1); </script>';
		}else{
			$shanchu=M('wenzhang')->where($id)->delete();
		if($shanchu){
			echo '<script>alert("删除成功");javascript:window.location.href=document.referrer; </script>';
		}else{
			echo '<script>alert("删除失败"); window.history.back(-1); </script>';
		}

		}

	}


	public function wentype()
	{
		$this->breadcrumb2 = '文章';
		$nzbill = M('wentype');
		$count = $nzbill->count();
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();
		$list = $nzbill->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->display();
	}
	/*公告信息詳情*/
	public function zhang()
	{
		$this->breadcrumb2 = '文章';
		$id = I('id');
		$configsAll = M('wentype');
		$msgll = $configsAll->where(array('id' => $id))->find();
		$this->assign('id', $id);
		$this->assign('msgll', $msgll);
		$this->display();
	}
	public function Savewentype()
	{
		$id = I('id');
		$configsAll = M('wentype');
		$data['title'] = I('title');
		$tit['title']=I('title');
        $type=M('wentype')->where($tit)->find();
        if($type){
        	echo '<script>alert("已有相同类型!"); window.history.back(-1); </script>';
          	return;
        }
		if ($id != '') {
			if(3<=$id && $id<=6){
				echo '<script>alert("帮助中心、Vpay介绍、商城介绍、联系客服 根据需求修改!"); window.history.back(-1); </script>';
			}else{
				$res = $configsAll->where(array('id' => $id))->save($data);
				$this->success('修改成功！', U("Settings/wentype"));
			}

		}else{
			$data['addtime'] = time();
			if(empty($data['title'])){
          		echo '<script>alert("请输入文章标题"); window.history.back(-1); </script>';
          		return;
      	 	}else{
      			$data['addtime']=time();
      			$res = $configsAll->add($data);
     	 		S('DB_CONFIG_DATA', null);
				$this->success('保存成功！', U("Settings/wentype"));
     	 }

		}

	}
	public function dltwentype(){
		$id['id']=I('id');
		$ids=I('id');
		$con=M('wenzhang')->where(array('tid'=>$ids))->select();

		if($con){

            echo '<script>alert("请先删除类型下的文章"); window.history.back(-1); </script>';
		}elseif(3<=$ids && $ids<=6){
              echo '<script>alert("帮助中心、Vpay介绍、商城介绍、联系客服 根据需求删除!"); window.history.back(-1); </script>';
		}else{

			$shanchu=M('wentype')->where($id)->delete();

			if($shanchu){
				echo '<script>alert("删除成功");javascript:window.location.href=document.referrer; </script>';
			}else{
				echo '<script>alert("删除失败"); window.history.back(-1); </script>';
			}
		}

	}



























	/*公告信息詳情*/
	public function Detnotice()
	{
		$this->breadcrumb2 = '公告';
		$id = I('id');
		$configsAll = M('notice');
		$msgll = $configsAll->where(array('id' => $id))->find();
		$this->assign('id', $id);
		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savenotice()
	{
		$id = I('id');
		$configsAll = M('notice');
		$data['notice_tittle'] = I('notice_tittle');
		$data['notice_content'] = I('notice_content');
		if ($id != '') {
			$res = $configsAll->where(array('id' => $id))->save($data);
		}else{
		$data['notice_addtime'] = time();
			$res = $configsAll->add($data);
		}
		S('DB_CONFIG_DATA', null);
		$this->success('保存成功！');
	}

	/*公告信息删除*/
	function del()
	{
		$id = I('id');
		if ($id != '') {
			$res = M('notice')->where(array('id' => $id))->delete();
			S('DB_CONFIG_DATA', null);
			$this->success('删除成功！');
		}
	}

	function smtp_mail()
	{
		$this->breadcrumb2 = '邮件配置';
		$this->smtp = $this->get_config_by_group('smtp');
		$this->display();
	}

	function qq()
	{
		$this->breadcrumb2 = '客服设置';
		$this->qq = $this->get_config_by_group('qq');
		$this->display();
	}

	function pay()
	{
		$this->breadcrumb2 = '支付配置';
		$this->site = $this->get_config_by_group('site');
		$this->display();
	}

	function nc()
	{
		$this->breadcrumb2 = '农场配置';
		$this->site = $this->get_config_by_group('site');
		$this->display();
	}

	function sms()
	{
		$this->breadcrumb2 = '短信配置';
		$this->site = $this->get_config_by_group('site');
		$this->display();
	}


	function get_config_by_group($group)
	{

		$list = M('config')->where(array('config_group' => $group))->select();
		if (isset($list)) {
			foreach ($list as $k => $v) {
				$config[$v['name']] = $v;
			}
		}
		return $config;
	}

	function save()
	{
		if (IS_POST) {
			$config = I('post.');
			if ($config['chandan_time'] > 24) {
				$this->error('不能超过24小时');
				exit;
			}


			if ($config && is_array($config)) {
				$c = M('Config');
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$c->where($map)->setField('value', $value);
				}

			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}


}

?>