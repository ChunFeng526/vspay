<?php

namespace SAdmin\Widget;
use Think\Controller;
/**
 * 后台菜单
 */
class MenuWidget extends Controller{	

	function menu_show(){		
		$shopmall = ("107,109,121,128,106,108");

	
		//隐藏所有分类SSSS
		$menu=M('Menu','nc_')->order('sort_order')->select();
		//所有分类EEEE

		//只显示商城分类SSSS
//		$menu=M('Menu')->where(array('id'=>array('IN',$shopmall)))->order('sort_order')->select();
		//只显示商城分类EEEE

		$tree=list_to_tree($menu,'id','pid','children',0);
		$this->admin_menu=$tree;
		$this->display('Widget:menu');
	}

	

}

