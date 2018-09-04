<?php

namespace Home\Controller;

use Think\Controller;

class IndexController extends CommonController
{
    public function index()
    {
        $userid = session('userid');
        $where['userid'] = $userid;
        $uinfo = M('user')->where($where)->field('img_head,userid,user_credit,is_reward,today_releas')->find();
        $moneyinfo = M('store')->where(array('uid' => $userid))->field('cangku_num,fengmi_num')->find();
        //今日可领取收益
        if ($uinfo['is_reward'] == 0) {
            $basi = M('config')->where(array('name' => 'sell_fee'))->getField('value');

            $can_get = $moneyinfo['fengmi_num'] * $basi / 100 + $uinfo['today_releas'];
            $can_get = floor($can_get * 100000) / 100000;
        }

        //是否存在当日转账释放红包
        $startime = date('Y-m-d');
        $endtime = date("Y-m-d", strtotime("+1 day"));
        $todaystime = strtotime($startime);
        $endtime = strtotime($endtime);
        $whereres['get_id'] = $userid;
        $whereres['is_release'] = 0;
        $whereres['get_type'] = 22;
        $whereres['get_time'] = array('between', array($todaystime, $endtime));
        $is_setnums = M('tranmoney')->where($whereres)->sum('get_nums') + 0;
        //今日是否已经领取释放收益
        if (IS_AJAX) {
            if ($can_get > 0) {
                $getnums = $can_get;
                $datapay['cangku_num'] = array('exp', 'cangku_num + ' . $getnums);
                $datapay['fengmi_num'] = array('exp', 'fengmi_num - ' . $getnums);
                $res_pay_get = M('store')->where(array('uid' => $userid))->save($datapay);//每日积分释放余额
//                $res_pay_get = M('store')->where(array('uid' => $userid))->setInc('cangku_num',$getnums);//每日积分释放余额
//                $res_pay = M('store')->where(array('uid' => $userid))->setDec('fengmi_num',$getnums);//每日积分释放余额


                if ($res_pay_get) {
                
                    $get_n = M('store')->where(array('uid' => $userid))->getfield('cangku_num');
                    $data['pay_id'] = $userid;
                    $data['get_id'] = $userid;
                    $data['get_nums'] = $getnums;
                    $data['now_nums_get'] = $get_n;
                    $data['is_release'] = 1;
                    $data['get_time'] = time();
                    $data['get_type'] = 2;

                    $get_ny = M('store')->where(array('uid' => $userid))->getfield('fengmi_num');
                    $datay['pay_id'] = $userid;
                    $datay['get_id'] = $userid;
                    $datay['get_nums'] = $getnums;
                    $datay['now_nums_get'] = $get_ny;
                    $datay['is_release'] = 1;
                    $datay['get_time'] = time();
                    $datay['get_type'] = 21;
                }
                $res_addrs = M('tranmoney')->add($data);
                $res_addrsy = M('tranmoney')->add($datay);


                $jifendets['pay_id'] = $userid;
                $jifendets['get_id'] = $userid;
                $jifendets['get_nums'] = -$getnums;
                $jifendets['get_time'] = time();
                $jifendets['get_type'] = 1;
                M('tranmoney')->add($jifendets);

                if ($res_addrs) {
                    $dataper['today_releas'] = 0;
                    $dataper['is_reward'] = 1;
                    $dataper['releas_time'] = time();
                    $res_pay = M('user')->where(array('userid' => $userid))->save($dataper);//每日积分释放余额
                    if ($res_pay) {
                        $isgetnums = showtwo($getnums);
                        $res = $isgetnums . '积分释放到余额成功';
                        ajaxReturn($res, 1, '/Index/index');
                    }
                }
            }
        }
        $this->assign(array(
            'uinfo' => $uinfo,
            'moneyinfo' => $moneyinfo,
            'can_get' => $can_get,
            'is_setnums' => $is_setnums,
        ));
        $this->display();
    }

    public function Dotrrela()
    {
        if (IS_AJAX) {
            $userid = session('userid');
            //是否存在当日转账释放红包
            $startime = date('Y-m-d');
            $endtime = date("Y-m-d", strtotime("+1 day"));
            $todaystime = strtotime($startime);
            $endtime = strtotime($endtime);
            $whereres['get_id'] = $userid;
            $whereres['is_release'] = 0;
            $whereres['get_type'] = 22;
            $whereres['get_time'] = array('between', array($todaystime, $endtime));
            $is_setnums = M('tranmoney')->where($whereres)->sum('get_nums') + 0;
            if ($is_setnums > 0) {
                $datapay['cangku_num'] = array('exp', 'cangku_num + ' . $is_setnums);
                $datapay['fengmi_num'] = array('exp', 'fengmi_num - ' . $is_setnums);
                $res_pay = M('store')->where(array('uid' => $userid))->save($datapay);//每日积分释放余额

                //添加释放记录
                $jifen_nums = $is_setnums;
                $jifen_dochange['pay_id'] = $userid;
                $jifen_dochange['get_id'] = $userid;
                $jifen_dochange['get_nums'] = $jifen_nums;
                $jifen_dochange['get_time'] = time();
                $jifen_dochange['get_type'] = 2;
                $res_addres = M('tranmoney')->add($jifen_dochange);
                //改成已释放
                $savedata['is_release'] = 1;
                $savedata['get_time'] = time();
                $is_setnums = M('tranmoney')->where($whereres)->save($savedata);
                if ($is_setnums) {
                    ajaxReturn('转账积分释放成功', 1);
                } else {
                    ajaxReturn('转账积分释放失败', 0);
                }
            }
        }
    }

    //余额记录
    public function Bancerecord()
    {
        $traInfo = M('tranmoney');
        $uid = session('userid');
        $where['pay_id|get_id'] = $uid;
        $where['get_type'] = array('in', '0,2');
        //分页
        $p = getpage($traInfo, $where, 20);
        $page = $p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k => $v) {
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d', $v['get_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s', $v['get_time']);
            //转入转出
            if ($uid == $v['pay_id']) {
                $Chan_info[$k]['trtype'] = 1;
            } else {
                $Chan_info[$k]['trtype'] = 2;
            }
        }
        if (IS_AJAX) {
            if (count($Chan_info) >= 1) {
                ajaxReturn($Chan_info, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }
        $this->assign('page', $page);
        $this->assign('Chan_info', $Chan_info);
        $this->assign('uid', $uid);
        $this->display();
    }

    //转出
    public function Turnout()
    {
        if (IS_AJAX) {
            $uinfo = trim(I('uinfo'));
            //手机号码或者用户id
            $map['userid|mobile'] = $uinfo;
            $issetU = M('user')->where($map)->field('userid,username')->find();
            $userid = session('userid');

            if ($userid == $issetU['userid']) {
                ajaxReturn('您不能给自己转账哦~', 0);
            }
            if ($issetU) {
                $url = '/Index/Changeout/sid/' . $issetU['userid'];
                ajaxReturn($url, 1);
            } else {
                ajaxReturn('并不存在该用户哦~', 0);
            }
        }
        $this->display();
    }

    public function Changeout()
    {
        $sid = trim(I('sid'));
        $uinfo = M('user as us')->JOIN('ysk_store as ms')->where(array('us.userid' => $sid))->field('us.mobile,us.userid,us.img_head,us.username,ms.cangku_num')->find();
        if (IS_AJAX) {
            $data = $_POST['post_data'];
            $trid = trim($data['zuid']);
            $paytype = trim($data['paytype']);
            $paynums = $data['paynums'];
            $mobila = trim($data['mobila']);
            $pwd = trim(I('pwd'));
            $uid = session('userid');
            //验证交易密码
            $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //验证手机号码后四位
            $is_setm['userid|mobile'] = $trid;
            $tmobile = M('user')->where($is_setm)->getfield('mobile');
            $tmobile = substr($tmobile, -4);
            if ($tmobile != $mobila) {
                ajaxReturn('您输入的手机号码后四位有误', 0);
            }
            if ($paynums <= 0) {
                ajaxReturn('您输入的转账金额有误哦~', 0);
            }
            if ($uid == $trid) {
                ajaxReturn('您不能给自己转账哦~', 0);
            }
            $mine_money = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
            if ($mine_money < $paynums) {
                ajaxReturn('您余额暂无这么多哦~', 0);
            }
            $tper = $paynums * 20 / 100;
            $eper = $paynums * 80 / 100;
            $datapay['cangku_num'] = array('exp', 'cangku_num - ' . $paynums);
            $datapay['fengmi_num'] = array('exp', 'fengmi_num + ' . $eper);
            $res_pay = M('store')->where(array('uid' => $uid))->save($datapay);//转出的人+80%积分

            $dataget['cangku_num'] = array('exp', "cangku_num + $eper");
            $dataget['fengmi_num'] = array('exp', 'fengmi_num + ' . $tper);
            $res_get = M('store')->where(array('uid' => $trid))->save($dataget);//转入的人+20%积分

             $pay_ny = M('store')->where(array('uid' => $uid))->getfield('fengmi_num');
             $get_ny = M('store')->where(array('uid' => $trid))->getfield('fengmi_num');

            //转入的人+20%积分记录SSS
            $changenums['pay_id'] = $uid;
            $changenums['get_id'] = $trid;
            $changenums['now_nums'] = $pay_ny;
            $changenums['now_nums_get'] = $get_ny;
            $changenums['get_nums'] = $tper;
            $changenums['is_release'] = 1;
            $changenums['get_time'] = time();
            $changenums['get_type'] = 1;
            M('tranmoney')->add($changenums);
            //转入的人+20%积分记录EEE
//            $jifen_nums = $tper * 2 / 1000;
//            $jifen_dochange['pay_id'] = $trid;
//            $jifen_dochange['get_id'] = $trid;
//            $jifen_dochange['get_nums'] = $jifen_nums;
//            $jifen_dochange['get_time'] = time();
//            $jifen_dochange['get_type'] = 22;
//            M('tranmoney')->add($jifen_dochange);
            //对应20%积分释放到余额SSS
//            $jifen_donums['cangku_num'] = array('exp', "cangku_num + $jifen_nums");
//            $jifen_donums['fengmi_num'] = array('exp', 'fengmi_num - ' . $jifen_nums);
//            $res_get = M('store')->where(array('uid' => $trid))->save($jifen_donums);//转入的人+20%积分


            //执行分销方法
            $this->Doprofit($uid, $paynums, 1);
            //判断用户等级
            $uChanlev = D('Home/index');
            $uChanlev->Checklevel($trid);
            //执行转账

             $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
             $get_n = M('store')->where(array('uid' => $trid))->getfield('cangku_num');

            if ($res_pay && $res_get) {
                $data['pay_id'] = $uid;
                $data['get_id'] = $trid;
                $data['get_nums'] = $paynums;
                $data['now_nums'] = $pay_n;                
                $data['now_nums_get'] =$get_n;                
                $data['is_release'] =1;                
                $data['get_time'] = time();
            }
            $add_Dets = M('tranmoney')->add($data);
            if ($add_Dets) {
                ajaxReturn('转账成功哦~', 1, '/Index/index');
            }
        }
        $this->assign('uinfo', $uinfo);
        $this->display();
    }

    //余额转积分

    public function test()
    {
        $uid = 1690;
        $paynums = 10000;
        //执行分销方法
        $this->Doprofit($uid, $paynums, 1);
    }


    //转出记录
    public function Turncords()
    {
        $traInfo = M('tranmoney');
        $uid = session('userid');
        $where['pay_id'] = $uid;
        $where['get_type'] = 0;
        //分页
        $p = getpage($traInfo, $where, 20);
        $page = $p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k => $v) {
            $getinfos = M('user')->where(array('userid' => $v['get_id']))->Field('img_head,username')->find();
            $Chan_info[$k]['imghead'] = $getinfos['img_head'];
            $Chan_info[$k]['guname'] = $getinfos['username'];

        }
        if (IS_AJAX) {
            if (count($Chan_info) >= 1) {
                ajaxReturn($Chan_info, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }
        $this->assign('page', $page);
        $this->assign('Chan_info', $Chan_info);
        $this->assign('uid', $uid);

        $this->display();
    }


    //根据关系进行分销
    public function Doprofit($uid, $paynums, $type)
    {
        $Lasts = D('Home/index');
        $Lastinfo = $Lasts->Getlasts($uid, 15, 'path');
        //查询我的级别
        $ismine_grade = M('user')->where(array('userid' => $uid))->getField('use_grade');
        if ($ismine_grade == 3) {
            return;
        }
        if (count($Lastinfo) > 0) {
            //积分加速释放率
            $add_relinfo = M('config')->where(array('group' => 4, 'status' => 1))->order('id asc')->select();
            foreach ($Lastinfo as $k => $v) {
                $k = $k + 1;
                //查询当前自己等级
                if (!empty($v)) {
                    //当前会员信息
                    $u_Grade = M('user')->where(array('userid' => $v))->getfield('use_grade');

                    if ($u_Grade >= 1) {
                        if ($k == 1) {
                            $release_bili = $add_relinfo[1]['value'];
                        } else {
                            $release_bili = $add_relinfo[2]['value'];
                        }
                        $Lastone = $release_bili / 100 * $paynums;
                        $u_get_money = $add_relinfo[3]['value'] / 100 * $paynums;

                        //vip加钱进余额
                        //加速积分释放率
                        $res_Incrate = M('user')->where(array('userid' => $v))->setInc('releas_rate', $Lastone);
                        if ($u_Grade == 3) {
                            $res_Add = M('store')->where(array('uid' => $v))->setInc('fengmi_num', $u_get_money);//给上级会员加积分
                            if ($res_Add) {
                                $earns['pay_id'] = $uid;
                                $earns['get_id'] = $v;
                                $earns['get_nums'] = $u_get_money;
                                $earns['get_level'] = $k;
                                $earns['get_types'] = $type;
                                $earns['get_time'] = time();
                                $res_Earn = M('moneyils')->add($earns);


                                $jifendets['pay_id'] = $uid;
                                $jifendets['get_id'] = $v;
                                $jifendets['get_nums'] = $u_get_money;
                                $jifendets['get_time'] = time();
                                $jifendets['get_type'] = 1;
                                M('tranmoney')->add($jifendets);
                            }
                            return;
                        }
                    }
                }//if
            }//foreach
        }
    }

    //转出记录
    public function Outrecords()
    {
        $traInfo = M('tranmoney');
        $uid = session('userid');
        $where['pay_id|get_id'] = $uid;
        $where['get_type'] = 0;
        //分页
        $p = getpage($traInfo, $where, 20);
        $page = $p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k => $v) {
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d', $v['get_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s', $v['get_time']);
            //转入转出
            if ($uid == $v['pay_id']) {
                $Chan_info[$k]['trtype'] = 1;
            } else {
                $Chan_info[$k]['trtype'] = 2;
            }
        }
        if (IS_AJAX) {
            if (count($Chan_info) >= 1) {
                ajaxReturn($Chan_info, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }
        $this->assign('page', $page);
        $this->assign('Chan_info', $Chan_info);
        $this->assign('uid', $uid);
        $this->display();
    }

    //兑换积分
    public function Exehange()
    {
        $uid = session('userid');
        $minems = M('store')->where(array('uid' => $uid))->find();
        if (IS_AJAX) {
            $dhnums = I('dhnums');
            $pwd = I('pwd');
            if ($dhnums < 100) {
                $this->ajaxReturn('最少兑换数量为100哦~', 0);
            }
            if ($dhnums % 100 != 0) {
                $this->ajaxReturn('兑换数量必须为100的倍数哦~', 0);
            }
            if ($dhnums > $minems['cangku_num']) {
                $this->ajaxReturn('您账户暂时没有这么多余额', 0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            $canget = $dhnums * 6;
            $dataget['cangku_num'] = array('exp', "cangku_num - $dhnums");
            $dataget['fengmi_num'] = array('exp', 'fengmi_num + ' . $canget);
            $res_get = M('store')->where(array('uid' => $uid))->save($dataget);//余额转入积分
            //查找当前账户余额
            $is_yue = M('store')->where(array('uid' => $uid))->getField('cangku_num');
            //执行兑换
            if ($res_get) {
                $data['pay_id'] = $uid;
                $data['get_id'] = $uid;
                $data['get_nums'] = $canget;
                $data['now_nums'] = $is_yue;
                $data['get_time'] = time();
                $data['get_type'] = 1;
            }
            $add_Dets = M('tranmoney')->add($data);
            if ($add_Dets) {
                //执行分销方法
                // $res_save = $this->Doprofit($uid, $dhnums, 2);
                $res_save = $this->Doprofit($uid, $canget, 2);//2018年4月10日14:10:35 HH
                //判断用户等级
                $uChanlev = D('Home/index');
                $uChanlev->Checklevel($uid);
                ajaxReturn('余额兑换积分成功', 1, '/Index/exehange');
            }
        }
        $this->assign('minems', $minems);
        $this->display();
    }

    //积分兑换记录
    public function Exchangerecords()
    {
        $uid = session('userid');
        $where['get_id'] = $uid;
        $where['get_type'] = 1;
        $traInfo = M('tranmoney');
        //分页
        $p = getpage($traInfo, $where, 20);
        $page = $p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k => $v) {
            $Chan_info[$k]['get_nums'] = $v['get_nums'];
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d', $v['get_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s', $v['get_time']);
        }
        if (IS_AJAX) {
            if (count($Chan_info) >= 1) {
                ajaxReturn($Chan_info, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }
        $this->assign('Chan_info', $Chan_info);
        $this->assign('page', $page);
        $this->display();
    }

    //获取仓库数据
    public function StoreData()
    {
        if (!IS_AJAX) {
            return false;
        }
        $store = D('Store');
        $userid = get_userid();
        $where['uid'] = $userid;
        $s_info = $store->field('cangku_num,fengmi_num,plant_num,huafei_total')->where($where)->find();

        $data['cangku'] = $s_info['cangku_num'] + 0;
        // $data['fengmi']=$s_info['fengmi_num']+0;
        $data['plant'] = $s_info['plant_num'] + 0;
        // $data['huafei_total']=$s_info['huafei_total']+0;
        // $data['total']=$s_info['cangku_num']+$s_info['plant_num'];
        $this->ajaxReturn($data);
    }

    //果树数据
    public function landdata()
    {
        if (!IS_AJAX) {
            return false;
        }
        $table = M('nzusfarm');
        $uid = session('userid');
        $where['uid'] = $uid;
        $where['status'] = array('gt', 0);
        $info = $table->field('id,seeds+fruits as num,farm_type type,status')->where($where)->order('id')->select();
        if ($info) {
            $this->ajaxReturn($info);
        }

    }


    public function tooldata()
    {
        if (!IS_AJAX) {
            return false;
        }

        $tree = M('config')->where(array('id' => array('in', array(8, 10, 12, 36))))->order('id asc')->field('value as price,id')->select();
        $tool = M('tool')->field('t_num as price,id')->order('id asc')->select();
        $data = array_merge($tree, $tool);
        if (empty($data)) {
            ajaxReturn('数据加载失败');
        } else {
            ajaxReturn('数据加载成功', 1, '', $data);
        }
    }

    //一键采蜜和狗粮
    public function onefooddata()
    {
        if (!IS_AJAX) {
            return false;
        }

        $where['uid'] = session('userid');
        $data = M('user_tool_month')->field('oneclick one,end_oneclick_time endo,dogfood food,end_dogfood_time endf')->where($where)->find();

        if (empty($data)) {
            ajaxReturn(null);
        } else {
            $time = time();
            if ($data['one'] > 0) {
                if ($time > $data['endo'])
                    $data['one_status'] = '已过期';
                else
                    $data['one_status'] = '使用中';

                $data['endo1'] = date('Y-m-d', $data['endo']);
            }
            if ($data['food'] > 0) {
                if ($time > $data['endf'])
                    $data['food_status'] = '已过期';
                else
                    $data['food_status'] = '使用中';

                $data['endf1'] = date('Y-m-d', $data['endf']);
            }
            ajaxReturn('数据加载成功', 1, '', $data);
        }
    }

    /**
     * 站内信
     */
    public function znx()
    {
        if (IS_AJAX) {
            $db_letter = M('nzletter');
            $userid = session('userid');

            $userInfo = session('user_login');

            $data['recipient_id'] = 0;
            $data['send_id'] = $userid;
            $data['title'] = trim(I('post.title'));
            $data['content'] = trim(I('post.content'));
            $data['username'] = $userInfo['username'];
            $data['account'] = $userInfo['account'];

            if (empty($data['title']) || empty($data['content'])) {
                ajaxReturn('标题或内容不能为空');
                return;
            }

            $data['time'] = time();
            $res = $db_letter->data($data)->add();
            if ($res) {
                ajaxReturn('我们已收到，会尽快处理您的问题', 1);
            } else {
                ajaxReturn('提交失败');
            }
        }

    }


    //购买道具
    public function buytool()
    {
        if (!IS_AJAX) {
            return false;
        }

        $id = I('post.id', 0, 'intval');
        $num = I('post.num', 1, 'intval');
        $typetree = I('post.type');
        if (empty($id)) {
            ajaxReturn('参数错误');
        }

        $uid = session('userid');
        if ($typetree == 'tree') {

            if ($id == 8 || $id == 36) {
                $type = 1;
            } elseif ($id == 10) {
                $type = 2;
            } elseif ($id == 12) {
                $type = 3;
            } else {
                ajaxReturn("操作失败");
            }
            //农田里最低的果子数
            $config = D('config');
            $min_guozi = $config->where(array('id' => $id))->getField('value');

            $des_num = $min_guozi;
            $is_land = no_land();
            if ($is_land && $id != 36) {
                $des_num = $des_num + 30;
            }

            $t_info['t_num'] = $des_num;
            $t_info['t_name'] = '树';
            $t_info['t_img'] = '';
            $num = 1;
            $order_type = 1; //树
        } else {

            $t_info = M('tool')->find($id);
            if (empty($t_info)) {
                ajaxReturn('参数错误');
            }

            //判断是否已拥有此道具，如果已拥有，不在购买
            $type = $t_info['t_type'];
            if ($type == 2) {
                $field = $t_info['t_fieldname'];
                $isbuytool = M('user_level')->where(array('uid' => $uid))->getField($field);
                if ($isbuytool > 0) {
                    ajaxReturn('您已经拥有该宠物了哦！');
                }
            }
            $order_type = 0; //道具
        }


        $data['tool_id'] = $id;
        $data['tool_name'] = $t_info['t_name'];
        $data['tool_price'] = $t_info['t_num'];
        $data['tool_img'] = $t_info['t_img'];
        $data['order_status'] = 0;
        $data['order_no'] = date('YmdHis');
        $data['tool_num'] = $num;
        $data['total_price'] = $num * $t_info['t_num'];
        $data['uid'] = $uid;
        $data['order_type'] = $order_type;


        $order = M('order');
        $order->startTrans();
        $res = $order->add($data);
        if ($res) {
            $url = U('Index/orderdetail', array('order_no' => $data['order_no']));
            ajaxReturn('购买成功', 1, $url);
        } else {
            ajaxReturn('购买失败');
            $order->startTrans();
        }
    }


    //选择支付
    public function orderdetail()
    {
        $order_no = I('order_no');
        $order_no = safe_replace($order_no);
        if (empty($order_no)) {
            return false;
        }
        $where['order_no'] = $order_no;
        $where['order_status'] = 0;
        $order = M('order');
        $o_info = $order->where($where)->find();
        if (empty($o_info)) {
            return false;
        }
        $uid = session('userid');
        $cangku_num = M('store')->where(array('uid' => $uid))->getField('cangku_num');
        $this->assign('o_info', $o_info)->assign('cangku_num', $cangku_num)->display();

    }

    public function gopay()
    {
        if (!IS_POST) {
            return false;
        }

        $order_paytype = I('post.paytype');
        $type_arr = array(1, 2, 3);
        if (!in_array($order_paytype, $type_arr)) {
            ajaxReturn('请选择支付方式');
        }
        $order_no = I('post.order_no');
        $order_no = safe_replace($order_no);
        if (empty($order_no)) {
            ajaxReturn('订单不存在');
        }
        $where['order_no'] = $order_no;
        $where['order_status'] = 0;
        $order = M('order');
        $count = $order->where($where)->count(1);
        if ($count == 0) {
            ajaxReturn('该订单已失效，请重新下单');
        }

        $arr = array(1 => '微信支付', 2 => '支付宝支付', 3 => '果子支付');
        $res = $order->where($where)->setField('order_paytype', $arr[$order_paytype]);
        $wxurl = 'http://yxgsgy.com/wxPay/example/jsapi.php?order_no=' . $order_no;
        $arr_url = array(1 => $wxurl, 2 => '', 3 => U('Ajaxdz/kaiken'));
        if ($res === false) {
            ajaxReturn('下单失败');
        } else {
            ajaxReturn('', 1, $arr_url[$order_paytype]);
        }
    }

    public function DogEat()
    {

        $uid = session('userid');

        $eat = M('user_dogeat');
        $pcount = $eat->where(array('uid' => $uid, 'datestr' => date('Ymd')))->count(1);
        if ($pcount > 0) {
            ajaxReturn('今天已经喂食过了哦');
        }

        $where['uid'] = $uid;
        $dog = M('user_level')->where($where)->getField('zangao_num');
        if ($dog) {
            //判断是否过期
            $table = M('user_tool_month');
            $where['dogfood'] = array('gt', 0);
            $info = $table->where($where)->field('dogfood,end_dogfood_time')->find();
            if (empty($info)) {
                ajaxReturn('您还没狗粮哦，赶紧去购买吧');
            }
            $time = time();
            if ($info['end_dogfood_time'] < $time) {
                ajaxReturn('狗粮没有了，赶紧去购买吧');
            }

            $eat = M('user_dogeat');
            $count = $eat->where(array('uid' => $uid))->count(1);
            $data['uid'] = $uid;
            if ($count == 0) {
                $eat->add($data);
            }
            $data['datestr'] = date('Ymd');
            $data['create_time'] = time();
            $res = $eat->where(array('uid' => $uid))->save($data);
            if ($res)
                ajaxReturn('喂食成功！', 1);
            else
                ajaxReturn('喂食失败！');
        }
    }
}