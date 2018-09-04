<?php
namespace SAdmin\Model;
use Think\Model;
class BlogModel extends Model{
	
	public function del_blog($id){
		try{
			
			$image=M('Blog')->where(array('blog_id'=>$id))->field('image')->find();			
			if(!empty($image)){
				A('Image')->del_image('blog',$image['image'],'blog');
			}
			
			$gallery=M('blog_image')->where(array('blog_id'=>$id))->field('image')->select();
			
			if(!empty($gallery)){
				foreach ($gallery as $key => $value) {
					A('Image')->del_image('blog_gallery',$value['image'],'blog_gallery');
				}
			}
			
					
			M('Blog')->where(array('blog_id'=>$id))->delete();
			M('blog_content')->where(array('blog_id'=>$id))->delete();
			M('blog_image')->where(array('blog_id'=>$id))->delete();
		
						
			return array(
				'status'=>'success',
				'message'=>'删除成功',
				'jump'=>U('Blog/index')
				);
			
		}catch(Exception $e){
			return array(
				'status'=>'fail',
				'message'=>'删除失败,未知异常',
				'jump'=>U('Blog/index')
			);
		}
	}
	//修改时，取得博客图片
	public function get_blog_data($id){
		
		$d=M('Blog')->find($id);
		
		$d['thumb_image']=resize($d['image'], 100, 100);
		
		return $d;
		
	}
	//修改时，取得博客图册图片
	public function get_blog_image_data($id){
		
		$d=M('blog_image')->where(array('blog_id'=>$id))->select();
		
		foreach ($d as $k => $v) {
			$d[$k]['thumb']=resize($v['image'], 100, 100);
		}
		
		return $d;
		
	}
	//修改时，取得博客分类
	public function get_blog_category_data($id){
		
		$sql='SELECT bc.title,bc.id FROM '.C('DB_PREFIX').'blog_category bc,'
		.C('DB_PREFIX').'blog b WHERE bc.id=b.category_id AND b.blog_id='.$id;
		
		$d=M()->query($sql);		
		
		return $d[0];
		
	}
	
	public function show_blog_page(){
		
		$filter=I('get.');
		
		$search=array();
		
		if($filter['category_id']){
			$search['category_id']=$filter['category_id'];		
		}
		
		
		
		$sql='SELECT * FROM '.C('DB_PREFIX').'blog ';
		
		
		if($search['category_id']){
			$sql.=" where category_id  = ".$search['category_id'];
		}
		
		$count=count(M()->query($sql));
		
		$Page = new \Think\Page($count,C('BACK_PAGE_NUM'));
		
		$show  = $Page->show();// 分页显示输出	
		
		$sql.=' order by blog_id desc LIMIT '.$Page->firstRow.','.$Page->listRows;
		
		$list=M()->query($sql);

		
		foreach ($list as $key => $value) {
			$list[$key]['image']=resize($value['image'], 100, 100);
			
			$f = M('blog_category')->where(array('id'=>$value['category_id']))->find();
			$list[$key]['fen']=$f['title'];
		}
		
		return array(
			'empty'=>'<tr><td colspan="20">~~暂无数据</td></tr>',
			'list'=>$list,
			'page'=>$show
		);	
		
	}	
		public function validate($data){

			$error=array();
			if(empty($data['title'])){
				$error='博客标题必填';
			}
			
			if($error){
			
				return array(
					'status'=>'back',
					'message'=>$error				
				);
				
			}
	}
		
	public function edit_blog($data){
		$error=$this->validate($data);
			
			if($error){
				return $error;
			}
			
			$blog_id=$data['blog_id'];
			
			$blog['blog_id']=$blog_id;
			$blog['title']=$data['title'];			
			$blog['author']=$data['author'];
			$blog['image']=$data['image'];
			$blog['category_id']=$data['blog_category'];
			$blog['allow_reply']=$data['allow_reply'];			
			$blog['meta_description']=$data['meta_description'];
			$blog['meta_keywords']=$data['meta_keywords'];			
			$blog['status']=$data['status'];			
			$blog['update_time']=date('Y-m-d H:i:s',time());
			
			$r=M('Blog')->save($blog);
			
			if($r){				
				
				try{
					
					M('blog_content')->where(array('blog_id'=>$blog_id))->delete();
									
					$blog_content['blog_id']=$blog_id;
					$blog_content['summary']=$data['summary'];
					$blog_content['content']=$data['content'];					
					M('blog_content')->add($blog_content);
					
					M('blog_image')->where(array('blog_id'=>$blog_id))->delete();	
					if (isset($data['blog_images'])) {						
						foreach ($data['blog_images'] as $blog_image) {
							$this->execute("INSERT INTO " . C('DB_PREFIX') . "blog_image SET blog_id = '" . (int)$blog_id . "', image = '" . $blog_image['image']. "', title = '" . $blog_image['title'] . "', sort_order = '" . (int)$blog_image['sort_order'] . "'");
						}
					}
					
					
					return array(
						'status'=>'success',
						'message'=>'修改成功',
						'jump'=>U('Blog/index')
					);
				}catch(Exception $e){
					return array(
					'status'=>'fail',
					'message'=>'修改失败,未知异常',
					'jump'=>U('Blog/index')
					);
				}
				
			}else{
				return array(
				'status'=>'fail',
				'message'=>'修改失败',
				'jump'=>U('Blog/index')
				);
			}
			
	}	
		
	 function add_blog($data){
			
			$error=$this->validate($data);
			
			if($error){
				return $error;
			}			
			
			$blog['title']=$data['title'];			
			$blog['author']=$data['author'];
			$blog['image']=$data['image'];
			$blog['category_id']=$data['blog_category'];
			$blog['allow_reply']=$data['allow_reply'];			
			$blog['meta_description']=$data['meta_description'];
			$blog['meta_keywords']=$data['meta_keywords'];			
			$blog['status']=$data['status'];			
			$blog['create_time']=date('Y-m-d H:i:s',time());
						
			$blog_id=M('Blog')->add($blog);
			
			if($blog_id){
				
				try{
					$blog_content['blog_id']=$blog_id;
					$blog_content['summary']=$data['summary'];
					$blog_content['content']=$data['content'];
					
					
					M('blog_content')->add($blog_content);
					
					
					if (isset($data['blog_images'])) {
						foreach ($data['blog_images'] as $blog_image) {
							$this->execute("INSERT INTO " . C('DB_PREFIX') . "blog_image SET blog_id = '" . (int)$blog_id . "', image = '" . $blog_image['image']. "', title = '" . $blog_image['title'] . "', sort_order = '" . (int)$blog_image['sort_order'] . "'");
						}
					}
					
					
					return array(
						'status'=>'success',
						'message'=>'新增成功',
						'jump'=>U('Blog/index')
					);
				}catch(Exception $e){
					return array(
					'status'=>'fail',
					'message'=>'新增失败',
					'jump'=>U('Blog/index')
					);
				}
			}else{
				return array(
				'status'=>'fail',
				'message'=>'新增失败',
				'jump'=>U('Blog/index')
				);
			}
		
		
	}	
}
?>