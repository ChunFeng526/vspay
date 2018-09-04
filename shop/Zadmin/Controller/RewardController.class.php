<?php
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;
class RewardController extends CommonController {

	public function _initialize()
	{
		parent::_initialize();
	}

    public function index()
    {
    	$reward=M('reward');
        $info=$reward->order('id asc')->select();
        $this->info=$info;

    	$this->display();
    }

    public function add(){

        $this->display();
    }

     public function edit($id=null){
        $reward=M('reward');
        $info=$reward->find($id);
        $this->info=$info;

        $this->display('add');
    }

    //保存数据 
    public function sava(){
        $reward=M('reward');
        $data=I();
        foreach ($data as $v) {
           if($v=='')
           {
              echo "<meta charset=\"utf-8\"/> <script>alert('请将信息填写完整!');javascript:history.back(-1);</script>";
              die;
           }
        }
        $id=$data['id'];
        if(empty($id))
        {
            if($reward->add($data)){
                $this->success('保存成功',U('Reward/index'));
            }
            else{

                $this->error('保存失败');
            }
        }
        else{

            if($reward->save($data)){
                $this->success('修改成功',U('Reward/index'));
            }
            else{

                $this->error('修改失败');
            }
        }
        
    }

/*
    删除数据
 */
    public function del($id=null){

        $tb=M('reward');
        if($tb->delete($id)){

             $this->success('删除成功');
        }
        else{

             $this->error('删除失败');
        }
    }

    
}