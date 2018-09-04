<?php

namespace Admin\Controller;

use Think\Page;

/**
 * 轮播图控制器
 *
 */
class BannerController extends AdminController
{


    /**
     * 用户列表
     *
     */
    public function index()
    {
        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        //链接数据库
        $user_object   = M('banner');
        //分页
        $p=getpage($user_object,$map,10);
        $page=$p->show();  
        //条件查询
        $data_list = $user_object
            ->where($map)
            ->order('id desc')
            ->select();
       

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    /**
     * 新增轮播图
     *
     */
    public function add()
    {
        if (IS_POST) {

            $user_object = M('banner');
            $data        = I('post.');
            // var_dump($data);
            // die;
            if(empty($data['title'])){
              $this->error('名称不能为空');  
            }
            $data['uid_str']        = '0,';
            $data['create_time']        = time();
            $data['status']         =1;
         
            if ($data) {

                if($_FILES['picture']['tmp_name'])
                {
   
               
   
                   $inf=$this->upload();
                   
                   $data['picture']=$inf['picture']['savepath'].$inf['picture']['savename'];
   
             
                }else{
                  
                   $data['picture']='';
   
                }
                
                $id = $user_object->add($data);
                if ($id) {
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
                $this->display('edit');
        }
    }

    /**
     * 编辑轮播图
     *
     */
    public function edit($id)
    {
        if (IS_POST) {
            // 提交数据
            $user_object = D('banner');
            $data        = I('post.');
            $data['create_time'] = time();

            if(empty($data['title'])){
              $this->error('名称不能为空');  
            }

        //   var_dump($dat['picture']);
        //   die();
            
            
            if ($data) {
                //调用上传图片，拼接路径
            //     if($_FILES['picture']['tmp_name']){

            //         $inf  = $this->upload();
            //         //调用上传方法
                    
            //         $data['picture'] = $info['picture']['savepath'].$info['picture']['savename'];
            //         //上传拼接
            //     }
            // else{
            //     $data['picture'] = ''; //如果选择非图片，则将picture字段设置为空
            // }
    
      
             if($_FILES['picture']['tmp_name'])
             {

            

                $inf=$this->upload();
                
                $data['picture']=$inf['picture']['savepath'].$inf['picture']['savename'];

          
             }else{
               
                $data['picture']='';

             }

                $result = $user_object->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 获取账号信息
            $info = D('banner')->find($id);
            $this->assign('info',$info);
            $this->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     *
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        $ids = I('request.ids');
        parent::setStatus($model);
    }


  
/**
 * 
 * 
 * TP3.2 封装图片上传方法
 * 
 */
public function upload(){
    if(empty($_FILES)){
        $this->error("请选择上传文件！");
    }else{
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   = 3145728 ;// 设置附件上传大小
        $upload->exts      = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath  = './Uploads/'; // 设置附件上传根目录
        $upload->savePath  = ''; // 设置附件上传（子）目录
        // 上传文件
        $inf  =   $upload->upload();
        if(!$inf) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            return $inf;
        }
    }
}

}
