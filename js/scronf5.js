/**
 * Created by panxh
 */
function showMsg(text, position) {
	var show = $('.show_msg').length
	if (show > 0) {

	} else {
		var div = $('<div></div>');
		div.addClass('show_msg');
		var span = $('<span></span>');
		span.addClass('show_span');
		span.appendTo(div);
		span.text(text);
		$('body').append(div);
	}
	$(".show_span").text(text);
	if (position == 'bottom') {
		$(".show_msg").css('bottom', '5%');
	} else if (position == 'center') {
		$(".show_msg").css('top', '');
		$(".show_msg").css('bottom', '50%');
	} else {
		$(".show_msg").css('bottom', '95%');
	}
	$('.show_msg').hide();
	$('.show_msg').fadeIn(1000);
	$('.show_msg').fadeOut(1000);
}

// 加载刷新。
function refresh() {

	var evTimeStamp = 0;
	$(window).scroll(function() {
		var scrollTop = $(this).scrollTop(); // 滚动条距离顶部的高度
		var scrollHeight = $(document).height(); // 当前页面的总高度
		var clientHeight = $(this).height(); // 当前可视的页面高度
		// console.log("top:"+scrollTop+",doc:"+scrollHeight+",client:"+clientHeight);
		if (scrollTop + clientHeight >= scrollHeight) { // 距离顶部+当前高度 >=文档总高度
														// 即代表滑动到底部 count++;
														// //每次滑动count加1
			// filterData(serviceTypeId,industryId,cityId,count);
			// //调用筛选方法，count为当前分页数
			// alert('下拉');

		} else if (scrollTop <= 0) {
			// 滚动条距离顶部的高度小于等于0  

			var now = +new Date();
			if (now - evTimeStamp < 100) {
				return;
			}
			evTimeStamp = now;
			showMsg('页面重新加载', 'center');
			var uptime = window.setTimeout(function() {
				window.location.reload()
				clearTimeout(uptime);
			}, 2000)
		}
	});
}
// 调用
refresh();