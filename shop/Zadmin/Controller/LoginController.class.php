<?php 
namespace Zadmin\Controller;
use Think\Controller;
class LoginController extends Controller{

	public function login()
	{	
		$this->display();
	}

	public function doLogin()
	{
		if(IS_POST)
		{
			$zusername = I("post.zusername");
			$pw= I("post.password");
			$password=md5($pw);
			if($zusername == ''){
				$this->ajaxReturn(array("state" => 0, "msg" => "用户名不能为空"));
				exit;
			}
			if($password == ''){
				$this->ajaxReturn(array("state" => 0, "msg" => "密码不能为空"));
				exit;
			}

			$model = M("Zadmin");
			if($info = $model->where(array("zusername" => $zusername, "password" => $password))->find())
			{
				$_SESSION["aid"] = $info["id"];
				$_SESSION["aname"] = $info["zusername"];
				$this->ajaxReturn(array("state" => 1));
				exit;
			}
			else
			{
				$this->ajaxReturn(array("state" => 0, "msg" => "用户名或密码错误"));
				exit;

			}

		}
	}


	public function loginOut()
	{
		session(null);
		//$this->success("退出成功", "/Zadmin/Login/login");
		echo "<meta charset=\"utf-8\"/> <script>alert('退出成功')</script>";
        echo '<script>location.href="' . U('Login/login').'"</script>';
        return;
	}


}


 ?>