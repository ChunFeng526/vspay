<?php
namespace Home\Controller;
use Think\Controller;
class NewsController extends CommonController {
    /**
     * 直推奖励 
     */
    public function index(){
        if(!IS_AJAX){
            return false;
        }
        $news=M('news');
        $info=$news->field('id,title,content,FROM_UNIXTIME(create_time,"%Y-%m-%d") tt')->where('status=1')->order('id desc')->limit(4)->select();
        if(empty($info)){
           $info=null; 
        }
        $this->ajaxReturn($info);
    }

    public function NewsDetail(){
        $id=I('id',0,'intval');
        if($id){
            $info=M('news')->field('title,content,create_time')->find($id);
            $this->assign('info',$info);
        }
        $this->display();
    }
    
}
