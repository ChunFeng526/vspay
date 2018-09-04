<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 激活码控制器
 * 
 */
class ActivateNumController extends AdminController
{

    public function index()
    {
        // 搜索
        $keyword = I('keyword', '', 'string');
        if($keyword!=''){
            $condition = array('like', '%' . $keyword . '%');
            $activate = array('eq', $keyword);
            $map['username|mobile|activate_num'] = array(
                $condition,
                $condition,
                $activate,
                '_multi' => true,
            );
        }
        

        $map['status'] = 0; 
        $type=I('type');
        if($type=='over'){
           $map['status'] = 1;  
        }
        $table   = D('activate_num');
        //分页
        $p=getpage($table,$map,10);
        $page=$p->show();  

        $data_list     = $table
            ->field()
            ->where($map)
            ->order('id asc')
            ->select();

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }


     //生成激活码
    public function add(){
        $code_len=I('num',0,'intval');
        if(empty($code_len) || $code_len<=0){
            $this->error('请输入生成个数');
        }
        if($code_len>1000){
            $this->error('每次最多可生成1000个激活码');
        }
        $c=$code_len;//生成100组激活码

        $numLen=16; //生成长度
        $cards=array();
        for($i=0; $i<$c; $i++){

            $code_num=$this->getActivate($numLen);
            $data[]=array('activate_num'=>$code_num,'create_time'=>time(),'status'=>0);
        }

        // $data=array_unique($cards);//去重
        
        $res=M('activate_num')->addAll($data);
        if($res)
            $this->success('操作成功');
        else
            $this->error('操作失败');
    }
    
    private function getActivate($Len){

        $tempNumStr=array();
        $sNumArr=range(0,9);//创建0-9的数组
        for($i=0;$i< $Len;$i++){
          $tempNumStr[]=array_rand($sNumArr);
        }
        $code=implode('',$tempNumStr);
        //判断激活码是否重复
        $where['activate_num']=$code;
        $count=M('activate_num')->where($where)->count(1);
        if($count==1){
            $this->getActivate(16);
        }
        return $code;
    }

  
   public function setStatus()
   {
        $model = 'activate_num';
        parent::setStatus($model);
   }
}
