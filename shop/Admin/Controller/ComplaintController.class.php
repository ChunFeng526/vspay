<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 回收控制器
 * 
 */
class ComplaintController extends AdminController
{

    public function index()
    {
        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword!=''){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['username|account'] = array(
                $condition,
                $condition,
                '_multi' => true,
            );
        }


        $map['status'] = array('eq', '0');
        $type=I('type');
        if($type=='over'){
           $map['status'] = array('eq', '1');
        }
        $table   = D('complaint');
        //分页
        $p=getpage($table,$map,10);
        $page=$p->show();
        $data_list     = $table
            ->where($map)
            ->order('id desc')
            ->select();
        if(!empty($data_list)){
            foreach ($data_list as $k=>$v){
                $userInfo = M('user')->where('userid = '.$v['user_id'])->find();
                $data_list[$k]['mobile'] = $userInfo['mobile'];
                $data_list[$k]['username'] = $userInfo['username'];
            }
        }
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }


     /*
      * 投诉详情
      */
    public function edit(){
        $id=I('get.id');
        $letter=M('complaint');
        $where['id']=$id;
        if($letter->where($where)->getField('status')==0){
            $letter->where($where)->setField('status',1);
        }
        $value=$letter->where($where)->find();
        if(!empty($value)){
            $userInfo = M('user')->where('userid = '.$value['user_id'])->find();
            $value['username'] = $userInfo['username'];
            $value['mobile'] = $userInfo['mobile'];
        }
        $this->assign('info',$value);

        $this->display();
    }

    /*
     * 删除投诉
     */
     public function delete(){
        $letter=M('complaint');
        $id=I('get.id');
        $bool=$letter->delete($id);
        if($bool){
            $this->success('删除成功');
        }else{
           $this->error('删除失败');
        }

    }
}
