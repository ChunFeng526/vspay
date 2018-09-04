<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Util\Tree;

/**
 * 部门控制器
 * @author jry <598821125@qq.com>
 */
class GoodController extends AdminController
{
    /**
     * 部门列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        
        $this->display();
    }


    /**
     * 设置一条或者多条数据的状态
     * @author jry <598821125@qq.com>
     */
    public function setStatus($model = CONTROLLER_NAME, $script = false)
    {
        $ids = I('request.ids');
        if (is_array($ids)) {
            if (in_array('1', $ids)) {
                $this->error('超级管理员组不允许操作');
            }
        } else {
            if ($ids === '1') {
                $this->error('超级管理员组不允许操作');
            }
        }
        parent::setStatus($model);
    }
}
