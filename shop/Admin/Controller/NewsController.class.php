<?php

namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 *
 */
class NewsController extends AdminController
{


    /**
     * 用户列表
     *
     */
    public function index()
    {
        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $user_object   = M('news');
        //分页
        $p=getpage($user_object,$map,10);
        $page=$p->show();  

        $data_list     = $user_object
            ->where($map)
            ->order('id desc')
            ->select();
       

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

            $user_object = D('news');
            $data        = I('post.');
            if(empty($data['title'])){
              $this->error('标题不能为空');  
            }
            $data['uid_str']        = '0,';
            $data['create_time']        = time();
            $data['status']         =1;
            if ($data) {
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
     * 编辑用户
     *
     */
    public function edit($id)
    {
        if (IS_POST) {
            // 提交数据
            $user_object = D('news');
            $data        = I('post.');
            $data['create_time'] = time();
            if(empty($data['title'])){
              $this->error('标题不能为空');  
            }
          //  var_dump($data);exit;
            if ($data) {
                $result = $user_object
                    ->save($data);
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
            $info = D('news')->find($id);
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
}
