<?php
namespace SAdmin\Controller;

class PublicController extends \Think\Controller {


    public function login($username = null, $password = null, $verify = null){
    	/* $ip = $_SERVER['SERVER_ADDR'];
		$url = $_SERVER['HTTP_HOST'];
		$auth=file_get_contents('http://auth.7az.cc/index.php/auth/index.html?v=12&url='.$url.'&ip='.$ip);
			if ($auth==1) {
			} else {
				exit($auth);
		} */
		$config =   S('DB_CONFIG_DATA');
	    if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
	    }
        C($config); //添加配置

        if(IS_POST){


		if(empty($username)){
			$this->error('用户名不能为空！');
		}elseif(empty($password)){
			$this->error('密码不能为空！');
		}

		$user=M('admin',"nc_")->getByAUname($username);

		//用户存在且可用
		if($user&&$user['a_status']==1){

			//验证密码
			if(think_ucenter_encrypt($password,C('PWD_KEY'))==$user['a_passwd']){
			
		        $auth = array(
		            'uid'             => $user['a_id'],
		            'username'        => $user['a_uname'],
		            'last_login_time' => $user['a_last_login_time'],
				 );

			    session('user_auth', $auth);
	    		session('user_auth_sign', data_auth_sign($auth));

		        $data = array();
		        $data['a_id']	=	$user['a_id'];
		        $data['a_last_login_time']	=	time();
		        $data['a_login_count']		=	array('exp','a_login_count+1');
				$data['a_last_login_ip']	=	get_client_ip();
				M('Admin','nc_')->save($data);
				
				
				storage_user_action($user['a_id'],$user['a_uname'],C('BACKEND_USER'),'登录了后台系统');

				$this->success('登录成功！', U('Index/index'));
			}else{
				$this->error('密码错误！');
			}


		}else{
			$this->error('用户不存在或被禁用！');
		}

        } else {

            if(is_login()){
                $this->redirect('Index/index');
            }else{
                $this->display();
            }
        }
    }


    public function logout(){

        session('[destroy]');

        $this->redirect('login');

    }

    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }

    public function clear(){
        $file   = new \Util\File();
        $result = $file->del_dir(RUNTIME_PATH);
        if ($result) {
            $this->success("缓存清理成功1");
        } else {
            $this->error("缓存清理失败1");
        }
    }

}
