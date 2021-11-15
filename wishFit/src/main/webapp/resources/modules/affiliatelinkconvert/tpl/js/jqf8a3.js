(function($){
	$(function(){
		$('.icon-info-circled-alt').click(function(){
			var index = $('.icon-info-circled-alt').index(this);
			if($('.icon-info-circled-alt').eq(index).next().attr('class') != 'dis_info_lp'){
				$('.icon-info-circled-alt').eq(index).after('<span class="dis_info_lp" id="dis_info_lp"><span class="dis_info_lp_in" style="width: '+info_width+'px;height: '+info_height+'px;">'+info_message_lp+'</span></span>');
			}
		});
		$(document).mouseup(function(e){
			var container = $(".icon-info-circled-alt");
			if (!container.is(e.target) && container.has(e.target).length === 0){
				container.next().remove();
			}
		});
	});
})(jQuery);