//通用消息
function message(msg,name){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  class="white_content_tb1" id="message_content"><div class="stealing"> <p>'+msg+'</p></div><div class="xftcan"><ul><li><a href="javascript:void(0)" id="colse_message"><img src="/Common/nongchang/fh.png" alt="" ></a></li><li><a href="javascript:void(0)" id="colse_message"><img src="/Common/nongchang/'+name+'" alt=""></a></li></ul></div></div>';
		$('body').append(html);
	}
	

}
//商店消息
function shop_mes(msg,name,url){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  class="white_content_tb1" id="message_content"><div class="stealing"> <p>'+msg+'</p></div><div class="xftcan"><ul><li><a href="javascript:void(0)" id="colse_message"><img src="/Common/nongchang/jxgg.png" alt="" ></a></li><li><a href="'+url+'"><img src="/Common/nongchang/'+name+'" alt=""></a></li></ul></div></div>';
		$('body').append(html);
	}
	

}


//登录消息
function login_mes(msg,name,url){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  class="white_content_tb1" id="message_content"><div class="stealing"> <p>'+msg+'</p></div><div class="xftcan"><ul><li><a href="/public/login.html" id="colse_message"><img src="/Common/nongchang/fhdl.jpg" alt="" ></a></li><li><a href="javascript:void(0)" id="colse_message"><img src="/Common/nongchang/cxtx.png" alt=""></a></li></ul></div></div>';
		$('body').append(html);
	}
	

}


//联系客服
function kf_mes(msg,name,url){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  class="white_content_tb1" id="message_content"><div class="stealing"> <p>'+msg+'</p></div><div class="xftcan"><ul><li><a href="javascript:void(0)" id="colse_message"><img src="/Common/nongchang/jxgg.png" alt="" ></a></li><li><a href="javascript:void(0)" id="lxkf"><img src="/Common/nongchang/lxkf.png" alt=""></a></li></ul></div></div>';
		$('body').append(html);
	}
	
	
	
}

//转增
function zz_mes(msg,name,url){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  class="white_content_tb1" id="message_content"><div class="stealing"> <p>'+msg+'</p></div><div class="xftcan"><ul><li><a href="/"><img src="/Common/nongchang/l01.png" alt="" ></a></li><li><a href="javascript:void(0)"  id="colse_message"><img src="/Common/nongchang/l02.png" alt=""></a></li></ul></div></div>';
		$('body').append(html);
	}
	

}

//转增
function no_mes(msg,name,url){
	var html='';
	
	var _length=$('#message_content').length;
	
	if(_length<1){
		
		html='<div style="display: block;"  id="nononono" class="white_content_tb2"> <a href = "javascript:void(0)" class="close" id="no_none"></a><div class="stealing" style="padding-top: 26vmin;"><p>'+msg+'</p></div></div><div id="fade21" class="black_overlay"></div>';
		$('body').append(html);
	}
	

}





$(function(){
	
	$('#colse_message').click(function(){
		
		$('#message_content').remove();
		
	})
	
	$('#no_none').click(function(){
		
		$('#nononono').remove();
		
	})
	
	
	$('#lxkf').click(function(){
		
		$('#message_content').remove();
		
		$('#fade6').css('display','none');
		$('#light6').css('display','none');
		
		$('#fade12').css('display','block');
		$('#light12').css('display','block');
		
		
	})
	
})

