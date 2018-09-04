<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * @author jry <598821125@qq.com>
 */
class ManageController extends AdminController
{


    /**
     * 用户列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        $condition                                = array('like', '%' . $keyword . '%');
        $map['a.id|a.username|a.nickname'] = array(
            $condition,
            $condition,
            $condition,
            '_multi' => true,
        );

        // 获取所有用户
        $map['a.status'] = array('egt', '0'); // 禁用和正常状态
        $user_object   = M('admin a')->join(C('DB_PREFIX').'group b ON a.auth_id=b.id','LEFT');
        //分页
        $p=getpage($user_object,$map,10);
        $page=$p->show();  

        $data_list     = $user_object
            ->field('a.*,b.title')
            ->where($map)
            ->order('a.id asc')
            ->select();
       

        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    /**
     * 新增用户
     * @author jry <598821125@qq.com>
     */
    public function add()
    {
        if (IS_POST) {

            $user_object = D('Manage');
            $data        = $user_object->create();
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
                $role=D('Group')->where(array('status'=>array('neq',-1)))->field('id,title')->order('id')->select();
                $this->assign('role',$role);
                $this->display('edit');
        }
    }

    /**
     * 编辑用户
     * @author jry <598821125@qq.com>
     */
    public function edit($id)
    {
        if (IS_POST) {

            // 提交数据
            $user_object = D('Manage');
            $data        = $user_object->create();
            // 密码为空表示不修改密码
            if(!$_POST['password'])
                unset($data['password']);
            if ($data) {
                $result = $user_object
                    ->field('id,nickname,username,password,mobile,auth_id,update_time')
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
            //角色信息
            $role=D('Group')->field('id,title')->order('id')->select();
            $this->assign('role',$role);

            // 获取账号信息
            $info = D('Manage')->find($id);
            unset($info['password']);
            $this->assign('info',$info);
            $this->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * @author jry <598821125@qq.com>
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        $ids = I('request.ids');
        if (is_array($ids)) {
            if (in_array('1', $ids)) {
                $this->error('超级管理员不允许操作');
            }
        } else {
            if ($ids === '1') {
                $this->error('超级管理员不允许操作');
            }
        }
        parent::setStatus($model);
    }
}
