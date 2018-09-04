<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use \Util\Tree;

/**
 * 导航控制器
 * @author jry <598821125@qq.com>
 */
class NavController extends AdminController
{
    /**
     * 导航列表
     * @author jry <598821125@qq.com>
     */
    public function index($group = 'main')
    {
        //搜索
        $keyword         = I('keyword', '', 'string');
        $condition       = array('like', '%' . $keyword . '%');
        $map['id|title'] = array(
            $condition,
            $condition,
            '_multi' => true,
        );

        // 获取所有导航
        $map['status'] = array('egt', '0');
        $map['group']  = $group;
        $data_list     = D('Admin/Nav')
            ->where($map)
            ->order('sort asc, id asc')
            ->select();

        // 给文章列表类型加上链接
        foreach ($data_list as &$val) {
            if ($val['type'] == 'post') {
                $val['title'] = '<a href="' . U('Admin/Post/index', array('cid' => $val['id'])) . '">' . $val['title'] . '</a>';
            }
        }

        // 转换成树状列表
        $tree      = new Tree();
        $data_list = $tree->array2tree($data_list);
        $this->assign('table_data_list',$data_list);
        $this->display();
    }

    // 根据导航类型设置表单项目
    private $extra_html = <<<EOF
    <script type="text/javascript">
        $(function(){
            $('input[name="type"]').change(function() {
                var type = $(this).val();
                // 链接类型
                if (type == 'link') {
                    $('.item_url').removeClass('hidden');
                    $('.item_content').addClass('hidden');
                    $('.item_module_name').addClass('hidden');
                // 模块类型
                } else if (type == 'module') {
                    $('.item_url').addClass('hidden');
                    $('.item_content').addClass('hidden');
                    $('.item_module_name').removeClass('hidden');
                // 单页类型
                } else if (type == 'page') {
                    $('.item_url').addClass('hidden');
                    $('.item_content').removeClass('hidden');
                    $('.item_module_name').addClass('hidden');
                // 文章列表类型
                } else if (type == 'post') {
                    $('.item_url').addClass('hidden');
                    $('.item_content').addClass('hidden');
                    $('.item_module_name').addClass('hidden');
                } else {
                    $('.item_url').addClass('hidden');
                    $('.item_content').addClass('hidden');
                    $('.item_module_name').addClass('hidden');
                }
            });
        });
    </script>
EOF;

    /**
     * 新增导航
     * @author jry <598821125@qq.com>
     */
    public function add($group)
    {
        if (IS_POST) {
            $nav_object = D('Admin/Nav');
            $data       = $nav_object->create();
            if ($data) {
                $id = $nav_object->add($data);
                if ($id) {
                    $this->success('新增成功', U('index', array('group' => $group)));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($nav_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增导航') // 设置页面标题
                ->setPostUrl(U('', array('group' => $group))) // 设置表单提交地址
                ->addFormItem('group', 'hidden', '导航分组', '导航分组')
                ->addFormItem('pid', 'select', '上级导航', '上级导航', select_list_as_tree('Admin/Nav', array('group' => $group), '顶级导航'))
                ->addFormItem('title', 'text', '导航标题', '导航前台显示标题')
                ->addFormItem('type', 'radio', '导航类型', '导航类型', D('Admin/Nav')->nav_type())
                ->addFormItem('url', 'text', '外链URL地址', '支持http://格式或者TP的U函数解析格式')
                ->addFormItem('content', 'kindeditor', '单页内容', '单页内容', null, 'hidden')
                ->addFormItem('target', 'radio', '打开方式', '打开方式', array('' => '当前窗口', '_blank' => '新窗口打开'))
                ->addFormItem('icon', 'icon', '图标', '导航图标')
                ->addFormItem('sort', 'num', '排序', '用于显示的顺序')
                ->setFormData(array('type' => 'link', 'group' => $group))
                ->setExtraHtml($this->extra_html)
                ->display();
        }
    }

    /**
     * 编辑导航
     * @author jry <598821125@qq.com>
     */
    public function edit($id, $group)
    {
        if (IS_POST) {
            $nav_object = D('Admin/Nav');
            $data       = $nav_object->create();
            if ($data) {
                if ($nav_object->save($data)) {
                    $this->success('更新成功', U('index', array('group' => $group)));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($nav_object->getError());
            }
        } else {
                $info = D('Admin/Nav')->find($id);
                $extra_html=$this->extra_html;
                
                $this->assign('extra_html',$extra_html);
                $this->assign('info',$info);
                $this->display();
        }
    }
}
