<?php

/**
 * 保存用户行为，前台用户和后台用户
 * $type C('FRONTEND_USER')/C('BACKEND_USER')
 */

function user_login()
{
    return D('Home/user')->user_login();
}



function storage_user_action($uid, $name, $type, $info)
{
	$data['type'] = $type;
	$data['user_id'] = $uid;
	$data['uname'] = $name;
	$data['add_time'] = date('Y-m-d H:i:s', time());
	$data['info'] = $info;
	M('user_action')->add($data);
}

//记录访问ip
function visitors_ip()
{

	if (!isset($_SESSION[C('SESSION_PREFIX')]['visitors_ip'])) {

		$ip = get_client_ip();

		$taobao_ip = new \Lib\Taobaoip();
		$region = $taobao_ip->getLocation($ip);
		//首次访问
		if (!M('visitors_ip')->where(array('ip' => $ip))->find()) {
			$ip_data['first_visit_time'] = date('Y-m-d H:i:s', time());
		}

		$ip_data['province'] = $region['region'];
		$ip_data['city'] = $region['city'];
		$ip_data['ip'] = $ip;
		$ip_data['last_visit_time'] = date('Y-m-d', time());
		$ip_data['add_time'] = date('Y-m-d H:i:s', time());
		$ip_data['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
		if (M('visitors_ip')->add($ip_data)) {
			session('visitors_ip', $ip);
		}
	}

}


// 短信发送接口
function newMsg() {
	 //$mobile = '15170788825';
	$mobile = '18167319936';
    $url='http://smssh1.253.com/msg/send/json';
    $content="vic was so beatultful！";//要发送的短信内容
    //创蓝接口参数
    $postArr = array (
        'account'  =>  'N533051_N4745204',
        'password' => 'T5amkJid3w51fa',
        'msg' => urlencode($content),
        'phone' => $mobile,
        'report' => 'true'
    );
    $result = curlPost($url, $postArr);
    if(!is_null(json_decode($result))){
        $output=json_decode($result,true);
        $mes=0 ;
    }else{
        $mes=1;
    }
    return $mes;
}

function curlPost($url,$postFields){
        $postFields = json_encode($postFields);
        $ch = curl_init ();
        curl_setopt( $ch, CURLOPT_URL, $url ); 
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8'
            )
        );
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt( $ch, CURLOPT_POST, 1 );
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $postFields);
        curl_setopt( $ch, CURLOPT_TIMEOUT,10); 
        curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0);
        $ret = curl_exec ( $ch );
        if (false == $ret) {
            $result = curl_error(  $ch);
        } else {
            $rsp = curl_getinfo( $ch, CURLINFO_HTTP_CODE);
            if (200 != $rsp) {
                $result = "请求状态 ". $rsp . " " . curl_error($ch);
            } else {
                $result = $ret;
            }
        }
        curl_close ( $ch );
        return $result;
    }



//生成唯一订单号
function build_order_no()
{
	return date('Ymd') . substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}

//取得url中加密的id
function get_url_id($id)
{
	$hashids = new \Lib\Hashids(C('PWD_KEY'), C('URL_ID'));
	$get_id = $hashids->decode(I($id));
	return $get_id[0];
}

//付款时生成的token
function pay_token($key_name)
{
	$key = 'oscshop' . rand(100000, 999999);
	$token = md5($key);
	session($key_name, $key);
	return $token;
}



//取得支付方式名称
function get_payment_name($code)
{

	$list = M('payment')->select();

	foreach ($list as $k => $v) {
		$payment[$v['payment_code']] = $v;
	}
	S('payment_list', $payment);
	$payment_list = $payment;

	return $payment_list[$code]['payment_name'];
}

//取得货运方式名称
function get_goods_category_name($id)
{
	if (!$goods_category = S('goods_category')) {
		$list = M('goods_category')->select();

		foreach ($list as $k => $v) {
			$category[$v['id']] = $v;
		}
		S('goods_category', $category);
		$goods_category = $category;
	}
	return $goods_category[$id]['name'];
}

//取得货运方式名称
function get_shipping_name($id)
{
	if (!$shipping_list = S('shipping_list')) {

		$list = M('transport')->select();

		foreach ($list as $k => $v) {
			$shipping[$v['id']] = $v;
		}
		S('shipping_list', $shipping);
		$shipping_list = $shipping;
	}
	return $shipping_list[$id]['title'];
}

//取得支付宝方式配置信息
function get_payment_config($code)
{

	$list = M('payment')->where(array('payment_code' => $code))->find();

	if (is_array($list) && !empty($list)) {
		$config = unserialize($list['payment_config']);
	}

	return $config;
}

/**
 * 调用系统的API接口方法（静态方法）
 * api('User/getName','id=5'); 调用公共模块的User接口的getName方法
 * api('Admin/User/getName','id=5');  调用Admin模块的User接口
 * @param  string $name 格式 [模块名]/接口名/方法名
 * @param  array|string $vars 参数
 */
function api($name, $vars = array())
{

	$array = explode('/', $name);
	$method = array_pop($array);
	$classname = array_pop($array);
	$module = $array ? array_pop($array) : 'Common';
	$callback = $module . '\\Api\\' . $classname . 'Api::' . $method;
	if (is_string($vars)) {
		parse_str($vars, $vars);
	}
	return call_user_func_array($callback, $vars);
}



//验证商品存在是否足够
function kuncun($com_id,$num){
	if(empty($num) || empty($com_id)){
		return false;
	}
	$where['id']=$com_id;
    $com_kc=M("product_detail")->where($where)->getField('stock');
    if($com_kc<$num || $com_kc==0){
    	return false;
    }else{
    	return true;
    }
}



/**
 * 2015-11-06
 * 系统邮件发送函数
 * @param string $to 接收邮件者邮箱
 * @param string $name 接收邮件者名称
 * @param string $subject 邮件主题
 * @param string $body 邮件内容
 * @param string $attachment 附件列表
 * @return boolean
 */
function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null)
{

	$mail = new \Lib\PHPMailer\Phpmailer();

	$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
	$mail->IsSMTP();  // 设定使用SMTP服务
	$mail->SMTPDebug = 0;                     // 关闭SMTP调试功能
	// 1 = errors and messages
	// 2 = messages only
	$mail->SMTPAuth = true;                  // 启用 SMTP 验证功能
	//  $mail->SMTPSecure = 'ssl';                 // 使用安全协议
	$mail->Host = C('SMTP_HOST');  // SMTP 服务器
	$mail->Port = C('SMTP_PORT');  // SMTP服务器的端口号
	$mail->Username = C('SMTP_USER');  // SMTP服务器用户名
	$mail->Password = C('SMTP_PASS');  // SMTP服务器密码
	$mail->SetFrom(C('FROM_EMAIL'), C('FROM_NAME'));
	$replyEmail = C('REPLY_EMAIL') ? C('REPLY_EMAIL') : C('FROM_EMAIL');
	$replyName = C('REPLY_NAME') ? C('REPLY_NAME') : C('FROM_NAME');
	$mail->AddReplyTo($replyEmail, $replyName);
	$mail->Subject = $subject;
	$mail->MsgHTML($body);
	$mail->AddAddress($to, $name);
	if (is_array($attachment)) { // 添加附件
		foreach ($attachment as $file) {
			is_file($file) && $mail->AddAttachment($file);
		}
	}
	return $mail->Send() ? true : $mail->ErrorInfo;
}

//通过id取重量的名称
function get_weight_name($weight_id)
{
	if (!$weight_list = S('weight_list')) {

		$list = M('weight_class')->select();

		foreach ($list as $k => $v) {
			$weight[$v['weight_class_id']] = $v;
		}
		S('weight_list', $weight);

		$weight_list = $weight;
	}
	return $weight_list[$weight_id]['title'];
}

//取得重量信息列表
function get_weight_list()
{
	if (!$weight = S('weight')) {

		$list = M('weight_class')->select();

		S('weight', $list);

		$weight = $list;
	}
	return $weight;
}

//通过id取长度的名称
function get_length_name($length_id)
{
	if (!$length_list = S('length_list')) {

		$list = M('length_class')->select();

		foreach ($list as $k => $v) {
			$length[$v['length_class_id']] = $v;
		}
		S('length_list', $length);

		$length_list = $length;
	}
	return $length_list[$length_id]['title'];
}

//取得长度信息列表
function get_length_list()
{
	if (!$length_list = S('length')) {

		$list = M('length_class')->select();

		S('length', $list);

		$length_list = $list;
	}
	return $length_list;
}

//通过id取得订单状态名称
function get_order_status_name($order_status_id)
{
	if (!$order_status = S('order_status_list')) {

		$list = M('order_status')->select();

		foreach ($list as $k => $v) {
			$o_status[$v['order_status_id']] = $v;
		}
		S('order_status_list', $o_status);

		$order_status = $o_status;
	}
	return $order_status[$order_status_id]['name'];
}

//获取的管理信息
function get_user_minfo($uid)
{
	$where['member_id'] = $uid;
	$info = D('v_menberinfo')->where($where)->find();
	return $info;
}

//获取用户的账户信息
function get_user_moneyinfo($uid)
{
	$where['member_id'] = $uid;
	$info = M('member_jifens')->where($where)->find();
	return $info;
}

//取得订单状态信息列表
function get_order_status_list()
{
	if (!$order_status = S('order_status')) {

		$status = M('order_status')->select();

		S('order_status', $status);

		$order_status = $status;
	}
	return $order_status;
}

//通过地区的id取地区的名称
function get_area_name($area_id)
{

	if (!$area_list = S('area_list')) {

		$list = M('Area')->field('area_id,area_name')->select();

		foreach ($list as $k => $v) {
			$area[$v['area_id']] = $v;
		}
		S('area_list', $area);

		$area_list = $area;
	}
	return $area_list[$area_id]['area_name'];
}

/*操作类型*/
function Opetypes($opetype)
{
	if (!empty($opetype)) {
		if (!in_array($opetype, nstate)) {
			$state = array(1 => '开窝', 2 => '清扫', 3 => '收货', 4 => '清窝', 5 => '喂养', 6 => '挑粪', 7 => '获得风车', 8 => '获得管家', 9 => '获得专家', 10 => '购买一键挑粪', 11 => '冻结积分');
		}
		return $state[$opetype];
	}
}


/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */


//字符串截取
function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = false)
{
	if (function_exists("mb_substr")) {
		if ($suffix)
			return mb_substr($str, $start, $length, $charset) . "…";
		else
			return mb_substr($str, $start, $length, $charset);
	} elseif (function_exists('iconv_substr')) {
		if ($suffix)
			return iconv_substr($str, $start, $length, $charset) . "…";
		else
			return iconv_substr($str, $start, $length, $charset);
	}
	$re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
	$re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
	$re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
	$re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
	preg_match_all($re[$charset], $str, $match);
	$slice = join("", array_slice($match[0], $start, $length));
	if ($suffix) return $slice . "…";
	return $slice;
}

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function is_login()
{
	$user = session('user_auth');
	if (empty($user)) {
		return 0;
	} else {
		return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
	}
}

/**
 * 数据签名认证
 * @param  array $data 被认证的数据
 * @return string       签名
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function data_auth_sign($data)
{
	//数据类型检测
	if (!is_array($data)) {
		$data = (array)$data;
	}
	ksort($data); //排序
	$code = http_build_query($data); //url编码并生成query字符串
	$sign = sha1($code); //生成签名
	return $sign;
}




/**
 * 清空缓存
 */
function clear_cache()
{
	$dirs = array();
	$noneed_clear = array(".", "..");
	$rootdirs = array_diff(scandir(RUNTIME_PATH), $noneed_clear);
	foreach ($rootdirs as $dir) {
		if ($dir != "." && $dir != "..") {
			$dir = RUNTIME_PATH . $dir;
			if (is_dir($dir)) {
				array_push($dirs, $dir);
				$tmprootdirs = scandir($dir);
				foreach ($tmprootdirs as $tdir) {
					if ($tdir != "." && $tdir != "..") {
						$tdir = $dir . '/' . $tdir;
						if (is_dir($tdir)) {
							array_push($dirs, $tdir);
						}
					}
				}
			}
		}
	}
	$dirtool = new \Lib\Dir();
	foreach ($dirs as $dir) {
		$dirtool->del($dir);
	}
}

/**
 * 把返回的数据集转换成Tree
 * @param array $list 要转换的数据集
 * @param string $pid parent标记字段
 * @param string $level level标记字段
 * @return array
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = 'children', $root = 0)
{
	// 创建Tree
	$tree = array();
	if (is_array($list)) {
		// 创建基于主键的数组引用
		$refer = array();
		foreach ($list as $key => $data) {
			$refer[$data[$pk]] =& $list[$key];
		}
		foreach ($list as $key => $data) {
			// 判断是否存在parent
			$parentId = $data[$pid];
			if ($root == $parentId) {
				$tree[] =& $list[$key];
			} else {
				if (isset($refer[$parentId])) {
					$parent =& $refer[$parentId];
					$parent[$child][] =& $list[$key];
				}
			}
		}
	}
	return $tree;
}

/**
 * 系统加密方法
 * @param string $data 要加密的字符串
 * @param string $key 加密密钥
 * @param int $expire 过期时间 (单位:秒)
 * @return string
 */
function think_ucenter_encrypt($data, $key, $expire = 0)
{
	$key = md5($key);
	$data = base64_encode($data);
	$x = 0;
	$len = strlen($data);
	$l = strlen($key);
	$char = '';
	for ($i = 0; $i < $len; $i++) {
		if ($x == $l) $x = 0;
		$char .= substr($key, $x, 1);
		$x++;
	}
	$str = sprintf('%010d', $expire ? $expire + time() : 0);
	for ($i = 0; $i < $len; $i++) {
		$str .= chr(ord(substr($data, $i, 1)) + (ord(substr($char, $i, 1))) % 256);
	}
	return str_replace('=', '', base64_encode($str));
}

/**
 * 系统解密方法
 * @param string $data 要解密的字符串 （必须是think_encrypt方法加密的字符串）
 * @param string $key 加密密钥
 * @return string
 */
function think_ucenter_decrypt($data, $key)
{
	$key = md5($key);
	$x = 0;
	$data = base64_decode($data);
	$expire = substr($data, 0, 10);
	$data = substr($data, 10);
	if ($expire > 0 && $expire < time()) {
		return '';
	}
	$len = strlen($data);
	$l = strlen($key);
	$char = $str = '';
	for ($i = 0; $i < $len; $i++) {
		if ($x == $l) $x = 0;
		$char .= substr($key, $x, 1);
		$x++;
	}
	for ($i = 0; $i < $len; $i++) {
		if (ord(substr($data, $i, 1)) < ord(substr($char, $i, 1))) {
			$str .= chr((ord(substr($data, $i, 1)) + 256) - ord(substr($char, $i, 1)));
		} else {
			$str .= chr(ord(substr($data, $i, 1)) - ord(substr($char, $i, 1)));
		}
	}
	return base64_decode($str);
}

//数字转ip
function ntoip($n)
{
	$iphex = dechex($n);//将10进制数字转换成16进制
	$len = strlen($iphex);//得到16进制字符串的长度
	if (strlen($iphex) < 8) {
		$iphex = '0' . $iphex;//如果长度小于8，在最前面加0
		$len = strlen($iphex); //重新得到16进制字符串的长度
	}
	//这是因为ipton函数得到的16进制字符串，如果第一位为0，在转换成数字后，是不会显示的
	//所以，如果长度小于8，肯定要把第一位的0加上去
	//为什么一定是第一位的0呢，因为在ipton函数中，后面各段加的'0'都在中间，转换成数字后，不会消失
	for ($i = 0, $j = 0; $j < $len; $i = $i + 1, $j = $j + 2) {//循环截取16进制字符串，每次截取2个长度
		$ippart = substr($iphex, $j, 2);//得到每段IP所对应的16进制数
		$fipart = substr($ippart, 0, 1);//截取16进制数的第一位
		if ($fipart == '0') {//如果第一位为0，说明原数只有1位
			$ippart = substr($ippart, 1, 1);//将0截取掉
		}
		$ip[] = hexdec($ippart);//将每段16进制数转换成对应的10进制数，即IP各段的值
	}
	$ip = array_reverse($ip);

	return implode('.', $ip);//连接各段，返回原IP值
}

//显示时间
function toDate($time, $format = 'Y-m-d H:i:s')
{
	if (empty($time)) {
		return '无';
	}
	$format = str_replace('#', ':', $format);
	return date($format, $time);
}

//验证字符串长度
function checkLength($str, $min, $max)
{
	preg_match_all("/./u", $str, $matches);

	$len = count($matches[0]);

	if ($len < $min || $len > $max) {
		return false;
	} else {
		return true;
	}
}

//字符串长度计算
function utf8_strlen($string)
{
	return strlen(utf8_decode($string));
}

function utf8_strrpos($string, $needle, $offset = null)
{
	if (is_null($offset)) {
		$data = explode($needle, $string);

		if (count($data) > 1) {
			array_pop($data);

			$string = join($needle, $data);

			return utf8_strlen($string);
		}

		return false;
	} else {
		if (!is_int($offset)) {
			trigger_error('utf8_strrpos expects parameter 3 to be long', E_USER_WARNING);

			return false;
		}

		$string = utf8_substr($string, $offset);

		if (false !== ($position = utf8_strrpos($string, $needle))) {
			return $position + $offset;
		}

		return false;
	}
}

//字符串截取
function utf8_substr($string, $offset, $length = null)
{
	// generates E_NOTICE
	// for PHP4 objects, but not PHP5 objects
	$string = (string)$string;
	$offset = (int)$offset;

	if (!is_null($length)) {
		$length = (int)$length;
	}

	// handle trivial cases
	if ($length === 0) {
		return '';
	}

	if ($offset < 0 && $length < 0 && $length < $offset) {
		return '';
	}

	// normalise negative offsets (we could use a tail
	// anchored pattern, but they are horribly slow!)
	if ($offset < 0) {
		$strlen = strlen(utf8_decode($string));
		$offset = $strlen + $offset;

		if ($offset < 0) {
			$offset = 0;
		}
	}

	$Op = '';
	$Lp = '';

	// establish a pattern for offset, a
	// non-captured group equal in length to offset
	if ($offset > 0) {
		$Ox = (int)($offset / 65535);
		$Oy = $offset % 65535;

		if ($Ox) {
			$Op = '(?:.{65535}){' . $Ox . '}';
		}

		$Op = '^(?:' . $Op . '.{' . $Oy . '})';
	} else {
		$Op = '^';
	}

	// establish a pattern for length
	if (is_null($length)) {
		$Lp = '(.*)$';
	} else {
		if (!isset($strlen)) {
			$strlen = strlen(utf8_decode($string));
		}

		// another trivial case
		if ($offset > $strlen) {
			return '';
		}

		if ($length > 0) {
			$length = min($strlen - $offset, $length);

			$Lx = (int)($length / 65535);
			$Ly = $length % 65535;

			// negative length requires a captured group
			// of length characters
			if ($Lx) {
				$Lp = '(?:.{65535}){' . $Lx . '}';
			}

			$Lp = '(' . $Lp . '.{' . $Ly . '})';
		} elseif ($length < 0) {
			if ($length < ($offset - $strlen)) {
				return '';
			}

			$Lx = (int)((-$length) / 65535);
			$Ly = (-$length) % 65535;

			// negative length requires ... capture everything
			// except a group of  -length characters
			// anchored at the tail-end of the string
			if ($Lx) {
				$Lp = '(?:.{65535}){' . $Lx . '}';
			}

			$Lp = '(.*)(?:' . $Lp . '.{' . $Ly . '})$';
		}
	}

	if (!preg_match('#' . $Op . $Lp . '#us', $string, $match)) {
		return '';
	}

	return $match[1];

}

/**
 * 自动生成新尺寸 的图片
 */
function resize($filename, $width, $height)
{

	$image_dir = ROOT_PATH . 'Uploads/image/';

	if (!is_file($image_dir . $filename)) {
		return;
	}

	$extension = pathinfo($filename, PATHINFO_EXTENSION);

	$old_image = $filename;
	$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

	if (!is_file($image_dir . $new_image) || (filectime($image_dir . $old_image) > filectime($image_dir . $new_image))) {
		$path = '';

		$directories = explode('/', dirname(str_replace('../', '', $new_image)));

		foreach ($directories as $directory) {
			$path = $path . '/' . $directory;

			if (!is_dir($image_dir . $path)) {
				@mkdir($image_dir . $path, 0777);
			}
		}

		list($width_orig, $height_orig) = getimagesize($image_dir . $old_image);

		if ($width_orig != $width || $height_orig != $height) {
			$image = new \Lib\Image($image_dir . $old_image);
			$image->resize($width, $height);
			$image->save($image_dir . $new_image);
		} else {
			copy($image_dir . $old_image, $image_dir . $new_image);
		}
	}

	return 'Uploads/image/' . $new_image;

}

/**
 * 格式化字节大小
 * @param  number $size 字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function format_bytes($size, $delimiter = '')
{
	$units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
	for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
	return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 上传文件类型控制 此方法仅限ajax上传使用
 * @param  string $path 字符串 保存文件路径示例： /Upload/image/
 * @param  string $format 文件格式限制
 * @param  integer $maxSize 允许的上传文件最大值 52428800
 * @return booler   返回ajax的json格式数据
 */
function ajax_upload($path = 'file', $format = 'empty', $maxSize = '52428800')
{
	ini_set('max_execution_time', '0');
	// 去除两边的/
	$path = trim($path, '/');
	// 添加Upload根目录
	$path = strtolower(substr($path, 0, 6)) === 'upload' ? ucfirst($path) : 'Upload/' . $path;
	// 上传文件类型控制
	$ext_arr = array(
		'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
		'photo' => array('jpg', 'jpeg', 'png'),
		'flash' => array('swf', 'flv'),
		'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
		'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2', 'pdf')
	);
	if (!empty($_FILES)) {
		// 上传文件配置
		$config = array(
			'maxSize' => $maxSize,               // 上传文件最大为50M
			'rootPath' => './',                   // 文件上传保存的根路径
			'savePath' => './' . $path . '/',         // 文件上传的保存路径（相对于根路径）
			'saveName' => array('uniqid', ''),     // 上传文件的保存规则，支持数组和字符串方式定义
			'autoSub' => true,                   // 自动使用子目录保存上传文件 默认为true
			'exts' => isset($ext_arr[$format]) ? $ext_arr[$format] : '',
		);
		// 实例化上传
		$upload = new \Think\Upload($config);
		// 调用上传方法
		$info = $upload->upload();
		$data = array();
		if (!$info) {
			// 返回错误信息
			$error = $upload->getError();
			$data['error_info'] = $error;
			echo json_encode($data);
		} else {
			// 返回成功信息
			foreach ($info as $file) {
				$data['name'] = trim($file['savepath'] . $file['savename'], '.');
				echo json_encode($data);
			}
		}
	}
}

//表单
function form($yname, $shu)
{
	$bd_id = M('bd')->where(array('bd_yname' => $yname))->getfield('bd_id');

	$biaocun = M('biaocun')->where(array('bd_id' => $bd_id))->limit(0, $shu)->select();
	//json转php数组
	foreach ($biaocun as $k => $v) {
		$biaocun[$k]['bc_shuju'] = json_decode($v['bc_shuju'], true);
	}
	//把数组转字符串
	foreach ($biaocun as $k => $v) {
		foreach ($v['bc_shuju'] as $kk => $vv) {
			if (is_array($vv)) {
				$biaocun[$k]['bc_shuju'][$kk] = implode("|", $vv);
			}
		}
	}
	return $biaocun;
}

//底部导航
function nav()
{
	$aaa = M('head')->select();
	for ($i = 0; $i < ceil(count($aaa)); $i++) {
		$bbb[] = array_slice($aaa, $i * 3, 3);
	}
	return $bbb;
}

/**
 * +----------------------------------------------------------
 * 生成随机字符串
 * +----------------------------------------------------------
 * @param int $length 要生成的随机字符串长度
 * @param string $type 随机码类型：0，数字+大小写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；-1，数字+大小写字母+特殊字符
 * +----------------------------------------------------------
 * @return string
+----------------------------------------------------------
 */
function randCode($length = 5, $type = 0)
{
	$arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
	if ($type == 0) {
		array_pop($arr);
		$string = implode("", $arr);
	} elseif ($type == "-1") {
		$string = implode("", $arr);
	} else {
		$string = $arr[$type];
	}
	$count = strlen($string) - 1;
	$code = '';
	for ($i = 0; $i < $length; $i++) {
		$code .= $string[rand(0, $count)];
	}
	return $code;
}

//查询动物数量
function dws($dw_id, $uid)
{
	$where['mdw_time'] = array('GT', date('Y-m-d', time()));
	$where['uid'] = $uid;
	$where['dw_id'] = $dw_id;
	$num = M('animal_list')->where($where)->count();
	return $num;
}

//消息模版
function msg($info, $status = '0', $name = '', $url = '')
{
	$arr = array('info' => $info, 'status' => $status, 'name' => $name, 'url' => $url);
	echo json_encode($arr);
	exit();
}

//判断交易密码是否正确
function twopass($twopass, $uid)
{
	//查询用户资料
	$me = M('member')->where(array('member_id' => $uid))->find();
	if (think_ucenter_encrypt($twopass, C('PWD_KEY')) == $me['twopass']) {
		return true;
		exit;
	} else {
		return false;
		exit;
	}
}

//返回用户资料
function user_info($uid)
{
	$info = M('member')->where(array('member_id' => $uid))->find();
	return $info;
}

/**
 * 数组分页函数  核心函数  array_slice
 * 用此函数之前要先将数据库里面的所有数据按一定的顺序查询出来存入数组中
 * $count   每页多少条数据
 * $page   当前第几页
 * $array   查询出来的所有数组
 * order 0 - 不变     1- 反序
 */

function page_array($count, $page, $array, $order)
{
	global $countpage; #定全局变量
	$page = (empty($page)) ? '1' : $page; #判断当前页面是否为空 如果为空就表示为第一页面
	$start = ($page - 1) * $count; #计算每次分页的开始位置
	if ($order == 1) {
		$array = array_reverse($array);
	}
	$totals = count($array);
	$countpage = ceil($totals / $count); #计算总页面数
	$pagedata = array();
	$pagedata = array_slice($array, $start, $count);
	return $pagedata;  #返回查询数据
}

//查询可以偷的蛋数
function toudanshu($uid)
{
	$time = date("H");

	if ($time >= C('chandan_time')) {
		//循环动物
		$animal = M('animal')->select();
		foreach ($animal as $k => $v) {
			//查询
			$where['uid'] = $uid;
			$where['is_feed'] = 1;
			$where['dw_id'] = $v['dw_id'];
			$where['mdw_wy_time'] = array('NEQ', date('Y-m-d', time()));
			$where['mdw_time'] = array('GT', date('Y-m-d', time()));
			$shu = M('animal_list')->where($where)->count();
			$animal[$k]['num'] = $shu * $v['dw_cdan'];
		}
		$shoudanshu = array_sum(array_map(function ($val) {
			return $val['num'];
		}, $animal));

		return $shoudanshu;
	} else {
		return 0;
	}


}

/**
 * 获取时间戳
 * $Ymd = Y 年
 * $Ymd = m 月
 * $Ymd = d 日
 * $Ymd = NULL 当前时间戳
 * $xia = true 是否取下次开始时间戳：取下年开始时间戳 或者下月开始时间戳  或者明日开始时间戳
 */
function getTime($Ymd = NULL, $xia = false)
{
	if ($Ymd == 'Y' && $xia == true) {
		//取下个年度开始时间戳
		return strtotime((date('Y', time()) + 1) . '-01-01 00:00:00');
	} else if ($Ymd == 'Y') {
		//取本年度开始时间戳
		return strtotime(date('Y', time()) . '-01-01 00:00:00');
	} else if ($Ymd == 'm' && $xia == true) {
		//取下个月度开始时间戳
		$xiayue_nianfen = date('Y', time());
		$xiayue_yuefen = date('m', time());
		if ($xiayue_yuefen == 12) {
			$xiayue_nianfen += 1;    //如果月份等于12月，那么下月年份+1
			$xiayue_yuefen = 1;    //如果月份等于12月，那么下月月份=1月
		} else {
			$xiayue_yuefen += 1;    //如果月份不是12月，那么在当前月份上+1
		}
		return strtotime($xiayue_nianfen . '-' . $xiayue_yuefen . '-01 00:00:00');
	} else if ($Ymd == 'm') {
		//取本月度开始时间戳
		return strtotime(date('Y-m', time()) . '-01 00:00:00');
	} else if ($Ymd == 'd' && $xia == true) {
		//取明日开始时间戳
		return strtotime(date('Y-m-d', time()) . ' 00:00:00') + 86400;
	} else if ($Ymd == 'd') {
		//取今日开始时间戳
		return strtotime(date('Y-m-d', time()) . ' 00:00:00');
	} else {
		//取当前时间戳
		return time();
	}
}

//购买记录
//1:伺料 2:牧羊犬 3:狼狗  4:藏獒 5:小鸡  6:小鸭 7:小鹅
//1 蛋  2金币
function mai($uid, $sid, $type, $num)
{
	$data['st_num'] = $num;
	$data['st_type'] = $type;
	$data['st_sid'] = $sid;
	$data['st_uid'] = $uid;
	$data['st_time'] = date('Y-m-d H:i:s', time());
	M('shoplist')->add($data);
}

//查询用户狗狗资料
function gougou($uid)
{
	$dog = M('dog_list')->where(array('uid' => $uid))->find();
	$dog['d_tu'] = M('dog')->where(array('d_id' => $dog['d_id']))->getfield('d_tu');
	$dog['d_steal'] = M('dog')->where(array('d_id' => $dog['d_id']))->getfield('d_steal');
	$dog['d_kd'] = M('dog')->where(array('d_id' => $dog['d_id']))->getfield('d_kd');
	$dog['d_name'] = M('dog')->where(array('d_id' => $dog['d_id']))->getfield('d_name');
	//判断是否过期
	$time = date('Y-m-d H:i:s', time());
	if ($dog['end_time'] < $time) {
		return false;
	} else {
		return $dog;
	}
}

//中奖计算
function getddd($item)
{
	//中奖概率基数
	$num = array_sum($item);//当前一等奖概率1/2000

	foreach ($item as $k => $v) {
		//获取一个1到当前基数范围的随机数
		$rand = mt_rand(1, $num);
		if ($rand <= $v) {
			//假设当前奖项$k=2,$v<=5才能中奖
			$res = $k;
			break;
		} else {
			//假设当前奖项$k=6,$v>1900,则没中六等奖,总获奖基数2000-1900,前五次循环都没中则2000-1-5-10-24-60=1900,必中6等奖,哈哈
			$num -= $v;
		}
	}
	return $res;
}

//返回是否中奖
//被偷用户uid
function zhong($tid, $dan)
{
	$uid = session('user_auth.uid');
	//可被偷次数 = 可被偷蛋数/每次被偷蛋数
	if (C('btd')) {
		$kbt_num = $dan / C('btd');
		$kbt_num = (int)$kbt_num;
	} else {
		$kbt_num = $dan / 1;
	}
	$sj = date('Y-m-d', time());
	$chatd['t_buid'] = $tid;
	$chatd['t_time'] = array('like', "{$sj}%");
	$ytshu = M('toudan')->where($chatd)->count();

	if ($ytshu >= $kbt_num) {
		return "wu";
		exit;
		//次数偷完了
	}
	//判断是否已经偷过
	$chattd['t_uid'] = $uid;
	$chattd['t_buid'] = $tid;
	$chattd['t_time'] = array('like', "{$sj}%");
	$uuuuuid = M('toudan')->where($chatd)->find();

	if ($uuuuuid) {
		return "tou";
		exit;
		//次数偷完了
	}
	//偷不中次数 = 可被偷次数*防偷概率%
	$gougou = gougou($tid);
	if ($gougou) {
		$tbz_num = $kbt_num * $gougou['d_steal'];
	} else {
		$tbz_num = 0;
	}
	//被偷过
	$tshu = td($tid);
	$tbz_num = $tbz_num + $tshu;

	//中奖次数  可被偷-偷不中
	$zhong = $kbt_num - $tbz_num;


	//计算中奖开始
	$prize_arr = array(
		'0' => array('id' => 1, 'prize' => 'ok', 'v' => $zhong),
		'1' => array('id' => 2, 'prize' => 'no', 'v' => $tbz_num),
	);
	//每个奖品的中奖几率,奖品ID作为数组下标
	foreach ($prize_arr as $val) {
		$item[$val['id']] = $val['v'];
	}
	$res = getddd($item);
	$h = $prize_arr[$res - 1]['prize'];
	//计算中奖结束 ---- end
	return $h;
}

//已经偷过次数
function td($t_buid)
{
	$sj = date('Y-m-d', time());
	$chasd['t_buid'] = $tid;
	$chasd['t_time'] = array('like', "{$sj}%");
	$tshu = M('toudan')->where($chasd)->count();
	return $tshu;

}


//查询返回好友关系
//我的id  儿子id
function friend($fid, $zid)
{
	//查询用户 上级ID 【1级】
	$one_id = M('member')->where(array('member_id' => $zid))->getfield('fid');
	if ($one_id == $fid) {
		return 1;
		exit;
	} else {
		$two_id = M('member')->where(array('member_id' => $one_id))->getfield('fid');
		if ($two_id == $fid) {
			return 2;
			exit;
		} else {
			$three_id = M('member')->where(array('member_id' => $two_id))->getfield('fid');
			if ($three_id == $fid) {
				return 3;
				exit;
			}
		}
	}
	return 0;
	exit;
}

//增加分润记录
//类型、得蛋id、儿子id、蛋数
function fenrun($type, $uid, $zid, $dd, $dj)
{

	$fen['f_type'] = $type;
	$fen['f_uid'] = $uid;
	$fen['f_zid'] = $zid;
	$fen['f_dd'] = $dd;
	$fen['f_time'] = date('Y-m-d H:i:s', time());
	$fen['f_dj'] = $dj;
	M('fenrun')->add($fen);

}

function send_sms($phone, $content)
{

	$post_data = array();
	$post_data['userid'] = C('m_sms_id');
	$post_data['account'] = c('m_sms_user');
	$post_data['password'] = C('m_sms_pwd');
	$post_data['content'] = $content; //短信内容需要用urlencode编码下
	$post_data['mobile'] = $phone;
	$post_data['sendtime'] = ''; //不定时发送，值为0，定时发送，输入格式YYYYMMDDHHmmss的日期值
	$url = 'http://120.76.213.253:8888/sms.aspx?action=send';
	$o = '';
	foreach ($post_data as $k => $v) {
		$o .= "$k=" . urlencode($v) . '&';
	}

	$post_data = substr($o, 0, -1);
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。

	$result = curl_exec($ch);

	return $result;

}


//Remove the exploer'bug XSS
function RemoveXSS($val)
{
// remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed
// this prevents some character re-spacing such as <java\0script>
// note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs
	$val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);
// straight replacements, the user should never need these since they're normal characters
// this prevents like <IMG SRC=@avascript:alert('XSS')>
	$search = 'abcdefghijklmnopqrstuvwxyz';
	$search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$search .= '1234567890!@#$%^&*()';
	$search .= '~`";:?+/={}[]-_|\'\\';
	for ($i = 0; $i < strlen($search); $i++) {
// ;? matches the ;, which is optional
// 0{0,7} matches any padded zeros, which are optional and go up to 8 chars
// @ @ search for the hex values
		$val = preg_replace('/(&#[xX]0{0,8}' . dechex(ord($search[$i])) . ';?)/i', $search[$i], $val); // with a ;
// @ @ 0{0,7} matches '0' zero to seven times
		$val = preg_replace('/(�{0,8}' . ord($search[$i]) . ';?)/', $search[$i], $val); // with a ;
	}
// now the only remaining whitespace attacks are \t, \n, and \r
	$ra1 = array('javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'style', 'script', 'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base');
	$ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
	$ra = array_merge($ra1, $ra2);
	$found = true; // keep replacing as long as the previous round replaced something
	while ($found == true) {
		$val_before = $val;
		for ($i = 0; $i < sizeof($ra); $i++) {
			$pattern = '/';
			for ($j = 0; $j < strlen($ra[$i]); $j++) {
				if ($j > 0) {
					$pattern .= '(';
					$pattern .= '(&#[xX]0{0,8}([9ab]);)';
					$pattern .= '|';
					$pattern .= '|(�{0,8}([9|10|13]);)';
					$pattern .= ')*';
				}
				$pattern .= $ra[$i][$j];
			}
			$pattern .= '/i';
			$replacement = substr($ra[$i], 0, 2) . '<x>' . substr($ra[$i], 2); // add in <> to nerf the tag
			$val = preg_replace($pattern, $replacement, $val); // filter out the hex tags
			if ($val_before == $val) {
// no replacements were made, so exit the loop
				$found = false;
			}
		}
	}
	return $val;
}

//防注入
function abacaAddslashes($var)
{
	if (!get_magic_quotes_gpc()) {
		if (is_array($var)) {
			foreach ($var as $key => $val) {
				$var [$key] = abacaAddslashes($val);
			}
		} else {
			$var = addslashes($var);
		}
	}
	return $var;
}

//增加业绩
function yeji($uid, $rmb)
{
	$path_id = M('member')->where(array('member_id' => $uid))->getField('path_id');
	$path_id = trim($path_id, ',');

	M('member')->where(array('member_id' => array('in', $path_id)))->setInc('yeji', $rmb);
}

//团队业绩
function tdyj()
{


}

/**
 * @Author:      HTL
 * @Email:       Huangyuan413026@163.com
 * @DateTime:    2016-04-22 11:25:02
 * @Description: 获取当前分类下所有父类ID
 * @id：子类ID
 */
function get_parent_ids($member_id)
{
	return __get_ids($member_id, '', 'fid');
}

/**
 * @Author:      HTL
 * @Email:       Huangyuan413026@163.com
 * @DateTime:    2016-04-22 11:25:02
 * @Description: 获取类下所有父/子类ID
 * @fid：多个父/子类ID集以,分隔
 * @childids：找到的子/父分类列表
 * @find_column:where查找的字段[id|fid:default]
 */
function __get_ids($fid, $childids, $find_column = 'member_id')
{
	if (!$fid || $fid <= 0 || strlen(fid) <= 0 || !in_array($find_column, array('member_id', 'fid'))) return 0;
	if (!$childids || strlen($childids) <= 0) $childids = $fid;
	$column = ($find_column == 'member_id' ? "fid" : "member_id");//id跟fid为互斥
	$ids = M('member')->where("$column in($fid)")->getField("$find_column", true);
	$ids = implode(",", $ids);

	//未找到,返回已经找到的
	if ($ids <= 0) return $childids;
	//添加到集合中
	$childids .= ',' . $ids;
	//递归查找
	return __get_ids($ids, $childids, $find_column);
}

/**
 * @Author:      HTL
 * @Email:       Huangyuan413026@163.com
 * @DateTime:    2016-04-07 09:33:27
 * @Description: 默认状态更改
 */
function is_default()
{
	$id = intval($_GET['id']);
	$type = intval($_GET['status']);
	if ($id > 0) {
		//取消默认时将取消所有子分类的默认
		if ($type != 1) {
			$id = $this->_get_child_ids($id);
		} else {
			$id = $this->_get_parent_ids($id);
		}
		print_r($id);
		exit;
		$rst = $this->model->where("id in($id)")->setField('is_default', $type);
		if ($rst) {
			$this->success(L("SAVE_SUCCESS"), U("index"));
		} else {
			$this->error(L('SAVE_ERROR'));
		}
	} else {
		$this->error(L('Parameter_ERROR'));
	}
}


//查询返回总业绩
function zong_yj($uid)
{

	$cond['path_id'] = array('like', "{$uid}");
	$yeji = M('member')->where($cond)->sum('yeji');

	return $yeji;
}

function chaname($uid)
{
	$u = M('member')->where(array('member_id' => $uid))->find();
	if ($u) {
		echo $u['uname'];
	} else {
		echo '无';
	}
}

/*对接2017-9-30(健林)*/
function message($info, $status = '0')
{
	$arr = array('info' => $info, 'status' => $status);
	echo json_encode($arr);

}

//字符串长度截取
function tercept($strings)
{
	$str = mb_substr($strings, 0, 44, 'utf-8');
	$str = $str . '...';
	return $str;
}

//字符串长度截取
function shorttercept($strings, $lenth)
{
	$str = mb_substr($strings, 0, $lenth, 'utf-8');
	$str = $str . '...';
	return $str;
}

//多个图片上传
function file_uploading($path_old = null)
{
	$images_path = './Uploads/image/product/';
	if (!is_dir($images_path)) {
		mkdir($images_path);
	}

	$upload = new \Think\Upload();// 实例化上传类
	$upload->maxSize = 3145728;// 设置附件上传大小
	$upload->exts = array('jpg', 'gif', 'png', 'jpeg','zip');// 设置附件上传类型
	$upload->rootPath = $images_path; // 设置上传根目录    // 上传文件
	$upload->savePath = ''; // 设置上传子目录    // 上传文件
	$upload->replace = true;
	$info = $upload->upload();

	if (!$info) {// 上传错误提示错误信息
		$res['stats'] = 'error';
		$res['res'] = $upload->getError();
	} else {// 上传成功
		foreach ($info as $file) {
			$img_path[] = '/Uploads/image/product/'.$file['savepath'] . $file['savename'];
			$name[]=$file['key'];
		}
		//上传成功后删除原来的图片
		if ($path_old && $img_path) {
			unlink($images_path . $path_old);
			// echo '删除成功';
		}
		$res['stats'] = 'success';
		$res['res'] = $img_path;
		$res['name']=$name;

	}
	return $res;
}


//多个图片上传
function uploadimg($path_old = null)
{
	$images_path = './Uploads/image/product/';
	if (!is_dir($images_path)) {
		mkdir($images_path);
	}

	$upload = new \Think\Upload();// 实例化上传类
	$upload->maxSize = 3145728;// 设置附件上传大小
	$upload->exts = array('jpg', 'gif', 'png', 'jpeg','zip');// 设置附件上传类型
	$upload->rootPath = $images_path; // 设置上传根目录    // 上传文件
	$upload->savePath = ''; // 设置上传子目录    // 上传文件
	$info = $upload->upload();

	if (!$info) {// 上传错误提示错误信息
		$res['stats'] = 'error';
		$res['res'] = $upload->getError();
	} else {// 上传成功
		foreach ($info as $file) {
			$res[$file['key']] = '/Uploads/image/product/'.$file['savepath'] . $file['savename'];
		}
		//上传成功后删除原来的图片
		if ($path_old && $res) {
			unlink($images_path . $path_old);
			// echo '删除成功';
		}
		$res['stats'] = 'success';

	}
	return $res;
}




//图片上传公共方法
function img_uploading($path_old = null)
{
	$images_path = './Uploads/image/touxiang/';
	if (!is_dir($images_path)) {
		mkdir($images_path);
	}

	$upload = new \Think\Upload();// 实例化上传类
	$upload->maxSize = 3145728;// 设置附件上传大小
	$upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
	$upload->rootPath = $images_path; // 设置上传根目录    // 上传文件
	$upload->savePath = ''; // 设置上传子目录    // 上传文件
	$info = $upload->upload();

	if (!$info) {// 上传错误提示错误信息
		$res['stats'] = 'error';
		$res['res'] = $upload->getError();
	} else {// 上传成功
		foreach ($info as $file) {
			$img_path = $file['savepath'] . $file['savename'];
		}
		//上传成功后删除原来的图片
		if ($path_old && $img_path) {
			unlink($images_path . $path_old);
			// echo '删除成功';
		}
		$res['stats'] = 'success';
		$res['res'] = $img_path;
	}
	return $res;
}



//多图片上传

function moreimg_uploads($path_old = null)
{
	$images_path = './Uploads/image/shop/';
	if (!is_dir($images_path)) {
		mkdir($images_path);
	}

	$upload = new \Think\Upload();// 实例化上传类
	$upload->maxSize = 6145728;// 设置附件上传大小
	$upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
	$upload->rootPath = $images_path; // 设置上传根目录    // 上传文件
	$upload->savePath = ''; // 设置上传子目录    // 上传文件
	$upload->replace = false;
	// $upload->saveName = md5(uniqid());
	$info = $upload->upload();

	if (!$info) {// 上传错误提示错误信息
		$res['status'] = 0;
		$res['res'] = $upload->getError();
	} else {// 上传成功
		foreach ($info as $file) {
			$img_path[] = '/Uploads/image/shop/'.$file['savepath'] . $file['savename'];
			$name[]=$file['key'];
		}
		//上传成功后删除原来的图片
		if ($path_old && $img_path) {
			unlink('.' . $path_old);
		}
		$res['stats'] = 1;
		$res['res'] = $img_path;
		$res['name']=$name;
	}
	return $res;
}






?>