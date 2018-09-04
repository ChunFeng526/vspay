<?php 
namespace Org\Util;
class Page{
	private $str = '';
	private $page_arr = array(
		'first'=>'',
		'prev'=>'',
		'num'=>'',
		'next'=>'',
		'last'=>'',
		);

	function __construct($current,$count,$limit,$size,$class='sabrosus'){
		$this->str='';

		if($count>$limit){
			$pages = ceil($count/$limit);//算出总页数
			$url = $this->get_url();//获取当前页面的URL地址（包含参数）
			//这里的$class是配置的样式
			$this->str.='<div class="'.$class.'">';
			//开始
			if($current==1){
				//如果说当前页是第一页的话，则输出span标签，无法点击首页及上一页
				//
				$this->page_arr['first'] = '<span class="disabled">首&nbsp;&nbsp;页</span>';
				$this->page_arr['prev'] = '<span class="disabled">  &lt;上一页 </span>';
			}else{
				//如果说当前页不是第一页的话，则输出a标签，点击分别跳转到首页及上一页
				$this->page_arr['first'] = '<a href="'.$url.'page=1">首&nbsp;&nbsp;页 </a>';
				$this->page_arr['prev'] = '<a href="'.$url.'page='.($current-1).'">  &lt;上一页 </a>';
			}

			//中间
			//判断得出star与end
		    
			if($current<=floor($size/2)){ //情况1
			 	//当前页的大小小于等于显示分页的一半（向下取整）的时候从1开始
				$star=1;
				$end=$pages >$size ? $size : $pages; //看看他两谁小，取谁的
			}else if($current>=$pages - floor($size/2)){ // 情况2
				//当前页的大小大于等于显示分页的一半（向下取整）的时候从总页数-显示页数+1开始
				$star=$pages-$size+1<=0?1:$pages-$size+1; //避免出现负数
			
				$end=$pages;
			}else{ //情况3
			 	
				$d=floor($size/2);
				$star=$current-$d;
				$end=$current+$d;
			}
			
			//循环输出中间显示页
			$tmp = '';
			for($i=$star;$i<=$end;$i++){
				if($i==$current){
					//当前页用span标签显示，并加样式
					$tmp.='<span class="current">'.$i.'</span>';	
				}else{
					$tmp.='<a href="'.$url.'page='.$i.'">'.$i.'</a>';
				}
			}
			$this->page_arr['num'] = $tmp;
			//最后
			if($pages==$current){
				//如果说当前页是最后一页的话，则输出span标签，无法点击尾页及下一页
				$this->page_arr['next'] = '<span class="disabled">  下一页&gt; </span>';
				$this->page_arr['last'] = '<span class="disabled">尾&nbsp;&nbsp;页  </span>';
			}else{
				//如果说当前页不是最后一页的话，则输出a标签，点击分别跳转到尾页及下一页
				$this->page_arr['next'] = '<a href="'.$url.'page='.($current+1).'">下一页&gt; </a>';
				$this->page_arr['last'] = '<a href="'.$url.'page='.$pages.'">尾&nbsp;&nbsp;页 </a>';
			}
			
		}
		// print_r($this->page_arr);
	}

	function first(){
		$this->str .= $this->page_arr['first'];
		return $this;
	}
	function prev(){
		$this->str .= $this->page_arr['prev'];
		return $this;
	}

	function num(){
		$this->str .= $this->page_arr['num'];
		return $this;
	}
	function next(){
		$this->str .= $this->page_arr['next'];
		return $this;
	}
	function last(){
		$this->str .= $this->page_arr['last'];
		return $this;
	}

	function show(){
		$this->str .= '</div>';
		return $this->str;
	}
	//得到当前网址
	function get_url(){
		$str = $_SERVER['PHP_SELF'].'?';
		if($_GET){
			foreach ($_GET as $k=>$v){  //$_GET['page']
				if($k!='page'){
					$str .= $k.'='.$v.'&';
				}
			}
		}
		return $str;
	}


}


