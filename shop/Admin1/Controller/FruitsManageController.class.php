<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * 
 */
class FruitsManageController extends AdminController
{


    /**
     * 用户列表
     * 
     */
    public function index()
    {

        $bofamx   = M('bofamx');
        //分页
        $p=getpage($bofamx,$map,10);
        $page=$p->show();  

        $data_list     = $bofamx
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

    /**
     * 新增用户
     * 
     */
    public function add()
    {
        if (IS_POST) {
            $db_bofa=M('bofamx');//播发明细
            $admin_kucun=M('admin_kucun');//平台总库存
            $m_info=session('user_auth');
            $manage_id=$m_info['uid'];
            $guozi_num=I('post.guozi_num');
            $note=I('post.note');

            $data['manage_id']=$manage_id;
            $data['bofa_num']=$guozi_num;
            $data['create_time']=time();
            $data['note']=$note;
            $data['manage_name']=$m_info['username'];
            $bf=$db_bofa->data($data)->add();
            #++++添加到总库存++++++
            $kucun_info=$admin_kucun->order('id')->find();
            $kucun_id=$kucun_info['id'];
            $kucun_total=$kucun_info['total_num'];
            $kucun_less_num=$kucun_info['less_num'];

            $kucun_data['total_num']=$kucun_total+$guozi_num;
            $kucun_data['less_num']=$kucun_less_num+$guozi_num;
            $kucun_data['id']=$kucun_id;
            $res=$admin_kucun->save($kucun_data);
            if($res){
                $this->success('添加成功',U('index'));
            }else{
                $this->error('添加失败');
            }
            #++++添加到总库存++++++
        } else {
                $this->display();
        }
    }

   
}
