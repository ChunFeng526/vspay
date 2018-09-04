<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends AdminController {

    public function index(){
        //会员统计
        $this->getUserCount();
        //交易量
        $this->TraingCount();
        $this->assign('meta_title', "首页");
        $this->display();
    }
    
    public function getUserCount(){
        $user=D('User');
        $user_total=$user->count(1);
        $start=strtotime(date('Y-m-d'));
        $end=$start+86400;
        $where="reg_date BETWEEN {$start} AND {$end}";
        $user_count=$user->where($where)->count(1);
        $this->assign('user_total', $user_total);
        $this->assign('user_count', $user_count);
    }

    public function TraingCount(){
        $traing=M('trading');
        $trading_free=M('trading_free');

        $start=strtotime(date('Y-m-d'));
        $end=$start+86400;
        $where="create_time BETWEEN {$start} AND {$end}";

        $traing_count=$traing->where($where)->count(1);
        $traing_total=$traing->count(1);

        $traing_count+=$trading_free->where($where)->count(1);
        $traing_total+=$trading_free->count(1);

        $this->assign('traing_count', $traing_count);
        $this->assign('traing_total', $traing_total);
    }

    /**
     * 删除缓存
     * @author jry <598821125@qq.com>
     */
    public function removeRuntime()
    {
        $file   = new \Util\File();
        $result = $file->del_dir(RUNTIME_PATH);
        if ($result) {
            $this->success("缓存清理成功1");
        } else {
            $this->error("缓存清理失败1");
        }
    }
}