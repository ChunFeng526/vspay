<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * 
 */
class FruitsDetailController extends AdminController
{
    /**
     * 用户列表
     * 
     */
    public function index()
    {
         // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','account','string');
        if($keyword){
            $condition = array('like', '%' . $keyword . '%');
            $map[$querytype] = $condition;
        }
        
        //按日期搜索
        $date=date_query('create_time');
        if($date){
            $where=$date;
            if($map)
                $map=array_merge($map,$where);
            else
                $map=$where;
        }

        #++++转账明细++++++
        $adminzgz=M('admin_zhuangz');
         //分页
        $p=getpage($adminzgz,$map,10);
        $page=$p->show();  

        $data_list     = $adminzgz
            ->where($map)
            ->order('id desc')
            ->select();

        #+++++平台总数据+++++
        $admin_kucun=M('admin_kucun')->find();
        #+++++平台总数据+++++
        
        $this->assign('admin_kucun',$admin_kucun);   
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }


   
}
