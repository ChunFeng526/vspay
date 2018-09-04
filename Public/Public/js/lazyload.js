/*
	使用懒加载注意事项：
		需要进行延迟加载的图片：
			src地址写在 自定义属性data-original里面，
			图片要规定width属性 和 height属性
		lazyload函数：
			参数  effect : 图片展示出来时的效果， fadeIn 淡入  slideDown  show
			参数  placeholder ： 未加载时，用来代替的图片路径
			其他参数可以自己了解
*/
$('img').lazyload({
	effect : 'fadeIn',
	placeholder : 'images/bj.jpg',
});