<?php
 //手机端判断
	function is_mobile() {

    $_SERVER['ALL_HTTP'] = isset($_SERVER['ALL_HTTP']) ? $_SERVER['ALL_HTTP'] : '';
    $mobile_browser = '0';
    if(preg_match('/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|iphone|ipad|ipod|android|xoom)/i', strtolower($_SERVER['HTTP_USER_AGENT'])))
        $mobile_browser++;
    if((isset($_SERVER['HTTP_ACCEPT'])) and (strpos(strtolower($_SERVER['HTTP_ACCEPT']),'application/vnd.wap.xhtml+xml') !== false))
        $mobile_browser++;
    if(isset($_SERVER['HTTP_X_WAP_PROFILE']))
        $mobile_browser++;
    if(isset($_SERVER['HTTP_PROFILE']))
        $mobile_browser++;
    $mobile_ua = strtolower(substr($_SERVER['HTTP_USER_AGENT'],0,4));
    $mobile_agents = array(
    'w3c ','acs-','alav','alca','amoi','audi','avan','benq','bird','blac',
    'blaz','brew','cell','cldc','cmd-','dang','doco','eric','hipt','inno',
    'ipaq','java','jigs','kddi','keji','leno','lg-c','lg-d','lg-g','lge-',
    'maui','maxo','midp','mits','mmef','mobi','mot-','moto','mwbp','nec-',
    'newt','noki','oper','palm','pana','pant','phil','play','port','prox',
    'qwap','sage','sams','sany','sch-','sec-','send','seri','sgh-','shar',
    'sie-','siem','smal','smar','sony','sph-','symb','t-mo','teli','tim-',
    'tosh','tsm-','upg1','upsi','vk-v','voda','wap-','wapa','wapi','wapp',
    'wapr','webc','winw','winw','xda','xda-'
    );
    if(in_array($mobile_ua, $mobile_agents))
        $mobile_browser++;
    if(strpos(strtolower($_SERVER['ALL_HTTP']), 'operamini') !== false)
        $mobile_browser++;
    // Pre-final check to reset everything if the user is on Windows
    if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows') !== false)
        $mobile_browser=0;
    // But WP7 is also Windows, with a slightly different characteristic
    if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows phone') !== false)
        $mobile_browser++;
    if($mobile_browser>0)
        return true;
    else
        return false;
	}
	//生成订单号
function getOrderId() {
        list($usec, $sec) = explode(" ", microtime());
        $usec = substr(str_replace('0.', '', $usec), 0 ,4);
        $str  = rand(10,99);
        return date("YmdHis").$usec.$str;
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

// function rePicSize($ifile,$ofile,$width,$height){
//     include_once 'ImageResize.class.php';
//     $newimage = new ImageResize();
//     //将当前目录下的test.jpg生成缩略图并保存到test_400_400.jpg，指定的宽度高度分别是400和400像素
//     $newimage->resize($ifile, $ofile, $width, $height);
// }



function checkstr($str){

    $html_string = array("&amp;", "&nbsp;", "'", '"', "<", ">", "\t", "\r");

    $html_clear = array("&", " ", "&#39;", "&quot;", "&lt;", "&gt;", "&nbsp; &nbsp; ", "");

    $js_string = array("/<script(.*)<\/script>/isU");

    $js_clear = array("");



    $frame_string = array("/<frame(.*)>/isU", "/<\/fram(.*)>/isU", "/<iframe(.*)>/isU", "/<\/ifram(.*)>/isU",);

    $frame_clear = array("", "", "", "");



    $style_string = array("/<style(.*)<\/style>/isU", "/<link(.*)>/isU", "/<\/link>/isU");

    $style_clear = array("", "", "");



    $str = trim($str);

    //过滤字符串

    $str = str_replace($html_string, $html_clear, $str);

    //过滤JS

    $str = preg_replace($js_string, $js_clear, $str);

    //过滤ifram

    $str = preg_replace($frame_string, $frame_clear, $str);

    //过滤style

    $str = preg_replace($style_string, $style_clear, $str);


    return $str;

}


function encodereplace($str){
        $str = str_replace('-','%2D',$str);
        $str = str_replace('_','%5F',$str);
        $str = str_replace('.','%2E',$str);
        return $str;
}

function unencodereplace($str){
        $str = str_replace('%2D','-',$str);
        $str = str_replace('%5F','_',$str);
        $str = str_replace('%2E','.',$str);
return $str;
}
 function getRandChar($length){
   $str = null;
   $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   $max = strlen($strPol)-1;

   for($i=0;$i<$length;$i++){
    $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
   }

   return $str;
  }
	//curl,返回数组
    function get_curl_json($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
        $result = curl_exec($ch);
        if(curl_errno($ch)){
            print_r(curl_error($ch));
        }
        curl_close($ch);
        return json_decode($result,TRUE);
    }

	function unicode_decode($name)
{
    // 转换编码，将Unicode编码转换成可以浏览的utf-8编码
    $pattern = '/([\w]+)|(\\\u([\w]{4}))/i';
    preg_match_all($pattern, $name, $matches);
    if (!empty($matches))
    {
        $name = '';
        for ($j = 0; $j < count($matches[0]); $j++)
        {
            $str = $matches[0][$j];
            if (strpos($str, '\\u') === 0)
            {
                $code = base_convert(substr($str, 2, 2), 16, 10);
                $code2 = base_convert(substr($str, 4), 16, 10);
                $c = chr($code).chr($code2);
                $c = iconv('UCS-2', 'UTF-8', $c);
                $name .= $c;
            }
            else
            {
                $name .= $str;
            }
        }
    }
    return $name;
}

  // GET
   function get($url) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97'); // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
        $res = curl_exec($curl);
        curl_close($curl);
        return $res;
    }


	function objarray_to_array($obj) {
    $ret = array();
    foreach ($obj as $key => $value) {
    if (gettype($value) == "array" || gettype($value) == "object"){
            $ret[$key] =  objarray_to_array($value);
    }else{
        $ret[$key] = $value;
    }
    }
    return $ret;
}

function getRes($arr){
		static $result = array();
		foreach ($arr as $k => $v) {
			if (!is_array($v)) {
				$result[$k][] = $v;
			}else{
				getRes($v);
			}
		}

		return $result;
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



//字符串长度计算
function utf8_strlen($string) {
    return strlen(utf8_decode($string));
}

function utf8_strrpos($string, $needle, $offset = null) {
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
function utf8_substr($string, $offset, $length = null) {
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
        $Oy = $offset%65535;

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
            $Ly = (-$length)%65535;

            // negative length requires ... capture everything
            // except a group of  -length characters
            // anchored at the tail-end of the string
            if ($Lx) {
                $Lp = '(?:.{65535}){' . $Lx . '}';
            }

            $Lp = '(.*)(?:' . $Lp . '.{' . $Ly . '})$';
        }
    }

    if (!preg_match( '#' . $Op . $Lp . '#us', $string, $match)) {
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

function chaname($uid)
{
    $u = M('member')->where(array('member_id' => $uid))->find();
    if ($u) {
        echo $u['uname'];
    } else {
        echo '无';
    }
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





