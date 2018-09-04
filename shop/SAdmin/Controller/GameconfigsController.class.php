<?php

namespace SAdmin\Controller;

use SAdmin\Model\MemberModel;

class GameconfigsController extends CommonController
{

	protected function _initialize()
	{
		parent::_initialize();
		$this->breadcrumb1 = '游戏配置';

	}

	/*鸡场配置*/
	public function Chickconfig()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '鸡场配置';
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();

		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$configsAll->where($map)->setField($map, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}


		$this->assign('msgll', $msgll);
		$this->display();
	}

	/*鸡场配置保存*/
	public function Savechickencongifs()
	{
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			if ($res) {
				S('DB_CONFIG_DATA', null);
				$this->success('保存成功！');
			} else {
				S('DB_CONFIG_DATA', null);
				$this->error('保存失败！');
			}
		}
	}

	/*果园配置*/
	public function Guoyuanconfig()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '果园配置';
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();

		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$configsAll->where($map)->setField($map, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}

		$this->assign('msgll', $msgll);
		$this->display();
	}

	/*果园配置保存*/
	public function Saveguoyuancongifs()
	{
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			if ($res) {
				S('DB_CONFIG_DATA', null);
				$this->success('保存成功！');
			} else {
				S('DB_CONFIG_DATA', null);
				$this->error('保存失败！');
			}
		}
	}

	/*渔场版块*/
	public function Yuchangconfig()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '渔场配置';
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();

		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$configsAll->where($map)->setField($map, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}

		$this->assign('msgll', $msgll);
		$this->display();
	}

	/*渔场配置保存*/
	public function Saveyuchangcongifs()
	{
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			if ($res) {
				S('DB_CONFIG_DATA', null);
				$this->success('保存成功！');
			}
		}
	}

	/*其他配置版块*/
	public function Othersconfig()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '其他配置';
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();

		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$configsAll->where($map)->setField($map, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}

		$this->assign('msgll', $msgll);
		$this->display();
	}

	/*其他配置保存*/
	public function Saveotherscongifs()
	{
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}

	//---------------------------------------
	/*旧版块*/
	public function index()
	{

		$model = new MemberModel();

		$filter = I('get.');

		$search = array();

		if (isset($filter['name'])) {
			$search['name'] = $filter['name'];
		}
		if (isset($filter['email'])) {
			$search['email'] = $filter['email'];
		}
		if (isset($filter['phone'])) {
			$search['phone'] = $filter['phone'];
		}

		$data = $model->show_member_page($search);

		$this->assign('empty', $data['empty']);// 赋值数据集
		$this->assign('list', $data['list']);// 赋值数据集
		$this->assign('page', $data['page']);// 赋值分页输出

		$this->display();
	}

	function add()
	{
		$model = new MemberModel();
		if (IS_POST) {
			$data = I('post.');
			$f = M('member')->where(array('phone' => $data['fid']))->find();
			if ($f) {
				$data['fid'] = $f['member_id'];
			} else {
				$this->error('未找到推荐人！');
				exit;
			}

			$return = $model->add_member($data);
			$this->osc_alert($return);
		}
		$this->crumbs = '新增';

		$this->display();
	}

	function info()
	{
		$model = new MemberModel();
		if (IS_POST) {
			$data = I('post.');
			$return = $model->edit_info($data);
			$this->osc_alert($return);
		}
		$this->crumbs = '编辑';
		$this->action = U('Member/info');
		$this->data = $model->info(I('id'));

		$this->display();
	}

	public function rmb()
	{
		$this->breadcrumb1 = '充值';
		$this->breadcrumb2 = '充值中心';
		if ($_POST) {
			$phone = $_POST['phone'];
			$rmb = $_POST['rmb'];
			$type = $_POST['type'];

			if (empty($type)) {
				exit("<script language='javascript'>alert('充值类型不正确');history.go(-1);</script>");
			}
			$m = M('member')->where(array('phone' => $phone))->find();
			if (empty($m)) {
				exit("<script language='javascript'>alert('未找到该用户');history.go(-1);</script>");
			}
			//余额
			if ($type == 1) {
				M('member_jifens')->where(array('member_id' => $m['member_id']))->setInc('farmlink_jifen', $rmb);
			}
			//写入资金日志
			$ysrmb['uid'] = $m['member_id'];
			$ysrmb['type'] = $type;
			$ysrmb['rmb'] = $rmb;
			$ysrmb['time'] = date("Y-m-d H:i:s");
			M("rmb")->add($ysrmb);

			exit("<script language='javascript'>alert('操作成功！');history.go(-1);</script>");

		}

		$this->action = U('Member/rmb');
		$this->display();

	}


	public function chongzhi()
	{
		$this->breadcrumb1 = '财务';
		$this->breadcrumb2 = '充值管理';
		$member = M("chongzhi");
		$count = $member->where()->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count, 25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $member->where()->order('time desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();


		foreach ($list as $k => $v) {
			$m = M('member')->where(array('member_id' => $v['uid']))->find();
			$list[$k]['uname'] = $m['uname'];
		}

		$this->assign('list', $list);// 赋值数据集
		$this->assign('page', $show);// 赋值分页输出
		$this->display(); // 输出模板
	}

	function okchong()
	{
		$id = I('get.id');
		$chongzhi = M("chongzhi");
		//处理充值
		$c = $chongzhi->where(array('id' => $id))->find();
		$rmb = $c['rmb'];
		$m = M('member')->where(array('member_id' => $c['uid']))->find();
		$rmbrmb = M("rmb");
		//余额处理
		$bmb = $m['rmb'] + ($rmb);

		M('member')->where(array('member_id' => $c['uid']))->save(array('rmb' => $bmb));

		//写入佣金日志
		$ysrmb['uid'] = $m['member_id'];
		$ysrmb['rmb'] = $rmb;
		$ysrmb['text'] = "充值：余额" . $rmb . "元";
		$ysrmb['time'] = date("Y-m-d H:i:s");
		$rmbrmb->add($ysrmb);


		//更新状态
		$ud['state'] = 1;
		$udd['id'] = $id;
		$chongzhi->where($udd)->save($ud);
		echo "<script language='javascript'>alert('处理成功');history.go(-1);</script>";
	}

	//资金记录
	public function zijing()
	{
		$this->breadcrumb1 = '充值';
		$this->breadcrumb2 = '资金记录';
		$sql = 'SELECT * FROM ' . C('DB_PREFIX') . 'rmb';
		$count = count(M()->query($sql));
		$Page = new \Think\Page($count, 20);
		$show = $Page->show();// 分页显示输出
		$sql .= ' order by time desc LIMIT ' . $Page->firstRow . ',' . $Page->listRows;
		$list = M()->query($sql);
		foreach ($list as $k => $v) {
			$nnn = M('member')->where(array('member_id' => $v['uid']))->find();
			$list[$k]['uname'] = $nnn['uname'];

		}
		$this->assign('empty', '没有数据');// 赋值数据集
		$this->assign('list', $list);// 赋值数据集
		$this->assign('page', $show);// 赋值分页输出
		$this->display();
	}

	//删除
	function del()
	{
		$uid = I('id');
		M('member')->where(array('member_id' => $uid))->delete();
		$this->success('删除成功！');
		exit;
	}

	/*普通会员三级拨比*/
	function sanjione()
	{
		$this->breadcrumb1 = '三级波比';
		$this->breadcrumb2 = '普通会员三级';
		$configsAll = M('sanjione');
		$msgll = $configsAll->where(array('id' => 1))->find();

		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savesanjione()
	{
		$configsAll = M('sanjione');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}

	/*中级会员三级拨比*/
	function sanjitwo()
	{
		$this->breadcrumb1 = '三级波比';
		$this->breadcrumb2 = '中级会员三级';
		$configsAll = M('sanjitwo');
		$msgll = $configsAll->where(array('id' => 1))->find();

		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savesanjitwo()
	{
		$configsAll = M('sanjione');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}

	/*中级会员三级拨比*/
	function sanjithree()
	{
		$this->breadcrumb1 = '三级波比';
		$this->breadcrumb2 = '高级会员三级';
		$configsAll = M('sanjithree');
		$msgll = $configsAll->where(array('id' => 1))->find();

		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savesanjisanjithree()
	{
		$configsAll = M('sanjithree');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}

	/*三级达成条件*/
	function sanjiconditions()
	{
		$this->breadcrumb1 = '三级波比';
		$this->breadcrumb2 = '三级达成条件';
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();

		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savessanjiconditions()
	{
		$configsAll = M('childcoop_configs');
		$msgll = $configsAll->where(array('id' => 1))->find();
		if (IS_POST) {
			$config = I('post.');
			if ($config && is_array($config)) {
				foreach ($config as $name => $value) {
					$map = array('name' => $name);
					$res = $configsAll->where($map)->setField($name, $value);
				}
			}
			S('DB_CONFIG_DATA', null);
			$this->success('保存成功！');
		}
	}

	/*三级达成条件*/
	function moxia()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '摸虾/挑粪';
		$configsAll = M('tcp_config');
		$msgll = $configsAll->order('id asc')->select();

		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Savemoxia()
	{
		$configsAll = M('tcp_config');
		$id = I('id');
		$earns_bili = I('earns_bili');
		foreach ($id as $k => $v) {
			if ($v >= 1) {
				$savecashes = $earns_bili[$v - 1];
				if ($savecashes < 1 && $savecashes > 0) {
					$res = $configsAll->where(array('id' => $v))->setfield('earns_bili', $savecashes);
				} else {
					echo "<meta charset=\"utf-8\"/> <script>alert('修改失败,数值必须小于1,且大于等于0！')</script>";
					echo '<script>javascript:history.back(-1);</script>';
					return;
				}
			}
		}
		S('DB_CONFIG_DATA', null);
		$this->success('保存成功！');
	}

	/*渔场可喂鱼时间*/
	function weiyucons()
	{
		$this->breadcrumb1 = '游戏配置';
		$this->breadcrumb2 = '喂鱼时间';
		$configsAll = M('feedtimes');
		$msgll = $configsAll->order('id asc')->select();
		$this->assign('msgll', $msgll);
		$this->display();
	}

	public function Saveweiyucons()
	{
		$configsAll = M('feedtimes');
		$id = I('id');
		$earns_bili = I('feed_time');
		foreach ($id as $k => $v) {
			$savecashes = $earns_bili[$v - 1];
			$res = $configsAll->where(array('id' => $v))->setfield('feed_time', $savecashes);
		}
		S('DB_CONFIG_DATA', null);
		$this->success('保存成功！');
	}
}

?>