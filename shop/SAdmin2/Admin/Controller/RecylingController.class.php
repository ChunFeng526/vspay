<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 回收控制器
 * 
 */
class RecylingController extends AdminController
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
        

        $map['status'] = array('neq', '2'); 
        $type=I('type');
        if($type=='over'){
           $map['status'] = array('eq', '2');  
        }
        $table   = D('nzletter');
        //分页
        $p=getpage($table,$map,10);
        $page=$p->show();  

        $data_list     = $table
            ->where($map)
            ->order('letter_id desc')
            ->select();
       

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }


     //详情页
    public function edit(){
        $id=I('get.id');
        $letter=M('nzletter');
        $where['letter_id']=$id;
        if($letter->where($where)->getField('status')==0){
            $letter->where($where)->setField('status',2);
        }
        $value=$letter->where($where)->find();
        $this->assign('info',$value);
        $this->display();
    }


     //保存回复
    public function savemessage(){
        $reply=I('reply');
        $id=I('id',0,'intval');
        if(empty($id)){
            $this->error('参数错误');
        }
        if(empty($reply)){
            $this->error('请填写回复内容');
        }

        $letter=M('nzletter');
        $data['reply']=$reply;
        $data['status']='2';
        $where['letter_id']=$id;
        $res=$letter->where($where)->save($data);
        if($res){
            $this->success('操作成功',U('index'));
           
        }else{
           $this->error('操作失败');
        }
    }

    #站内信之单独删除
     public function delete(){
        $letter=M('nzletter');
        $id=I('get.id');
        $bool=$letter->delete($id);
        if($bool){
            $this->success('删除成功');
        }else{
           $this->error('删除失败');
        }

    }
    

   
}
