<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Model;

use Common\Model\ModelModel;
use Think\Storage;
use Util\Tree;

/**
 * 功能模块模型
 * @author jry <598821125@qq.com>
 */
class MenuModel extends ModelModel
{
    /**
     * 数据库表名
     */
    protected $tableName = 'menu';

    /**
     * [getCol 获取用户可操作控制器]
     * @return [type] [description]
     */
    public function getCol(){
        $uid        = is_login();
        $auth_id    = M('admin')->where(array('id'=>$uid))->getField('auth_id');
        if($auth_id==1){
            return $auth_id;
        }
        
        //根据用户ID获用户角色
        $group_info = D('Admin/Group')->find($auth_id);
        $group_auth = $group_info['menu_auth']; // 获得当前登录用户的权限列表
        $con['status']      = 1;
        $con['_string']     = 'id IN ('.trim($group_auth,',').')';
        //顶级菜单
        $col = $this->where($con)->order('sort asc, id asc')->getField('col',true);
        return $col;
    }


    /**
     * 获取最顶级菜单
     */
    public function getTopMenu(){

        $uid        = is_login();

        //根据用户ID获用户角色
        $auth_id    = M('admin')->where(array('id'=>$uid))->getField('auth_id');

        //超级管理员
        if($auth_id==1){

                //顶级菜单
                $con['status']      = 1;
                $con['level']      = 0;
                $system_module_list_g = $this->where($con)->order('sort asc, id asc')->select();
                foreach ($system_module_list_g as $key => $val) {
                    $where['level']=2;
                    $where['gid']=$val['id'];
                    $info=$this->where($where)->order('sort asc, id asc')->field('col,act')->find();
                    if($info['col'] && $info['act']){
                        $system_module_list_g[$key]['col']=$info['col'];
                        $system_module_list_g[$key]['act']=$info['act'];
                    }
                }
                $menu_list['g_menu']=$system_module_list_g;
            

            return $menu_list;
        }

        $group_info = D('Admin/Group')->find($auth_id);
        $group_auth = $group_info['menu_auth']; // 获得当前登录用户所属部门的权限列表
        // 获取所有菜单
             //顶级菜单
            $con['level']      = 0;
            $con['status']      = 1;
            $con['_string']     = 'id IN ('.trim($group_auth,',').')';
            $system_module_list_g = $this->where($con)->order('sort asc, id asc')->select();
            foreach ($system_module_list_g as $key => $val) {
                $where['level']=2;
                $where['gid']=$val['id'];
                $where['_string']     = 'id IN ('.trim($group_auth,',').')';
                $info=$this->where($where)->order('sort asc, id asc')->field('col,act')->find();
                if($info['col'] && $info['act']){
                    $system_module_list_g[$key]['col']=$info['col'];
                    $system_module_list_g[$key]['act']=$info['act'];
                }
            }
            $menu_list['g_menu']=$system_module_list_g;
        return $menu_list;
    }

    /**
     * 获取二三级菜单
     * @param string $addon_dir
     */
    public function getAllMenu($gid=1)
    {
        
        $uid        = is_login();


        $auth_id    = M('admin')->where(array('id'=>$uid))->getField('auth_id');
        //超级管理员
        if($auth_id==1){

                //父级菜单
                $con['status']      = 1;
                $con['level']      = 1;
                $con['gid']      = $gid;
                $system_module_list_p=$this->where($con)->order('sort asc, id asc')->select();
                $menu_list['p_menu']=$system_module_list_p;
                //子级菜单
                $con['level']      = 2;
                $system_module_list_c=$this->where($con)->order('sort asc, id asc')->select();
                $menu_list['c_menu']=$system_module_list_c;


            return $menu_list;
        }

        //根据用户ID获用户角色
        $group_info = D('Admin/Group')->find($auth_id);
        $group_auth = $group_info['menu_auth']; // 获得当前登录用户所属部门的权限列表
        // 获取所有菜单
            $con['status']      = 1;
            $con['_string']     = 'id IN ('.trim($group_auth,',').')';
            $con['gid']      = $gid;
            //父级菜单
            $con['level']      = 1;
            $system_module_list_p=$this->where($con)->order('sort asc, id asc')->select();
            $menu_list['p_menu']=$system_module_list_p;
            //子级菜单
            $con['level']      = 2;
            $system_module_list_c=$this->where($con)->order('sort asc, id asc')->select();
            $menu_list['c_menu']=$system_module_list_c;
        return $menu_list;
    }

    /**
     * 根据菜单ID的获取其所有父级菜单
     * @return array 父级菜单集合
     */
    public function getParentMenu()
    {
        $col=CONTROLLER_NAME;
        $where['col']       = $col;
        $where['status']    = 1;
        $where['level']     = 2;
        //取当前菜单的顶级
        $m_info=$this->where($where)->field('pid,gid,name')->find();
        //取父级名称
        $p_where['id']=$m_info['pid'];
        $p_name=$this->where($p_where)->getField('name');
        //取顶级名称
        $g_where['id']=$m_info['gid'];
        $g_name=$this->where($g_where)->getField('name');
        // 面包屑导航
        $m_info['name']=array($g_name,$p_name,$m_info['name']);
        return $m_info;
    }

    /*
        判断菜单选中
     */
    public function SelectMenu(){
        $act=ACTION_NAME;
        $col=CONTROLLER_NAME;
        $select_url=strtolower(CONTROLLER_NAME.'-'.ACTION_NAME);
        $where['col']=$col;
        $where['act']=$act;
        $count=$this->where($where)->count(1);
        if($count>0){
            return $select_url;
        }

    }

    
}
