<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * 
 */
class TraingController extends AdminController
{
    /**
     * 用户列表
     * 
     */
    public function index()
    {
         // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['sell_account|sell_username|buy_account|buy_username'] = array(
                $condition,
                $condition,
                $condition,
                $condition,
                '_multi' => true,
            );
        }
        
        
        #++++转账明细++++++
        $table=M('trading');
         //分页
        $p=getpage($table,$map,10);
        $page=$p->show();  

        $data_list     = $table
            ->where($map)
            ->order('id desc')
            ->select();

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    public function tradingfree()
    {
         // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['sell_account|sell_username|buy_account|buy_username'] = array(
                $condition,
                $condition,
                $condition,
                $condition,
                '_multi' => true,
            );
        }
        
        
        #++++转账明细++++++
        $table=M('trading_free');
         //分页
        $p=getpage($table,$map,10);
        $page=$p->show();  

        $data_list     = $table
            ->where($map)
            ->order('id desc')
            ->select();

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

   

    public function turntable(){
        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['bill_name|bill_username|bill_account'] = array(
                $condition,
                $condition,
                $condition,
                $condition,
                '_multi' => true,
            );
        }
        
        #++++转账明细++++++
        $table=M('nzbill');
         //分页
        $p=getpage($table,$map,10);
        $page=$p->show();  

        $data_list     = $table
            ->where($map)
            ->order('bill_id desc')
            ->select();

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    public function growth(){
        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['username|account'] = array(
                $condition,
                $condition,
                '_multi' => true,
            );
            $userid=M('user')->where($map)->getField('userid',true);
           
            if($userid){
                $where['uid']=array('IN',$userid);
            }else{
                $where['uid']=0;
            }
        }

        #++++转账明细++++++
        $table=M('shifeijl');
         //分页
        $p=getpage($table,$where,10);
        $page=$p->show();  

        $data_list     = $table
            ->where($where)
            ->order('id desc')
            ->select();

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

      /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        parent::setStatus($model);
    }
}
