<?php
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;
class BaseController extends CommonController {


	protected $model;//定义一个变量，该变量在class这个类里可以全局调用
	public function _initialize()
	{

		parent::_initialize();
		$this->model = M("Base");//实例化模型赋值给一个变量
	}

    public function index()
    {
    	$this->delorder();
    	$this->ch_data = $this->model->where(array("lang" => 1))->find();
    	$this->display();
    }

    private function delorder(){
    	$time=time()-(86400*5);//5天未支付订单，直接删除
    	$where['order_state']=0;
    	$where['order_time']=array('elt',$time);
    	$m=M('order')->where($where)->delete();
    }


//公司企业的页面修改
    public function addindex()
    {
    	if(IS_POST)
    	{
    		$data = I("post.");//接收传过来的值
    		$data['footer'] = $_POST["footer"];
    		$data['contact'] = $_POST["contact"];

    		$lang = $data["lang"];
    		if($this->model->where(array("lang" => $lang))->find())
    		{
    			$this->model->where(array("lang" => $lang))->save($data);
    			$this->success('修改成功',U('Base/index'));
    		}
    	}
    }
     //修改管理员密码
    public function test()
    {
        if(IS_POST)
        {
            $oldpass = trim(I("post.oldpass"));
            $newpass = trim(I("post.newpass"));
            $renewpass = trim(I("post.renewpass"));

            if($oldpass == '' || $newpass == '' || $renewpass == '')
            {
                echo 0;
                return;
            }

            if($newpass != $renewpass)
            {
                echo 0;
                return;
            }

            $model = M("Admin");
            $aid = session("aid");
            if($model->where(array("id" => $aid, "password" => md5($oldpass)))->find())
            {
                if($model->where(array("id" => $aid, "password" => md5($oldpass)))->save(array("password" => md5($newpass))))
                {
                    echo 1;
                    return;
                }
            }
            else{
                echo 0;
                return;
            }
        }else
        {
            $this->display();
        }
    }
    
    public function clearHtml()
    {
        if(IS_POST)
        {
            $temp_path = APP_PATH . "Html/";
            $files = glob($temp_path."*.html");
            foreach ($files as $key => $value) {
                if(is_file($value))
                {
                    unlink($value);
                }
            }
            echo 1;
            return;
        }
    }

     /**
     * [cacheClear 清空系统缓存]
     * @return [type] [description]
     */
    public function cacheClear() { 
      //清文件缓存
      $dirs = array('./Application/Runtime');
      @mkdir('./Application/Runtime',0777,true);
      //清理缓存
      foreach($dirs as $value) {
         $this->rmdirr($value);
      }  
      $this->success('系统缓存清除成功！'); 
    }

     private function rmdirr($dirname) {
        if (!file_exists($dirname)) {
         return false;
        }
        if (is_file($dirname) || is_link($dirname)) {
         return unlink($dirname);
        }
        $dir = dir($dirname);
        if($dir){
         while (false !== $entry = $dir->read()) {
          if ($entry == '.' || $entry == '..') {
           continue;
          }
          //递归
          $this->rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
         }
        }
        $dir->close();
        return rmdir($dirname);
     }

}