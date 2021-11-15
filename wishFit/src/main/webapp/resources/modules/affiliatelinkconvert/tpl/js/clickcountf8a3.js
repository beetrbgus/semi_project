(function($){
	$(function(){
		$('a[af_srl]').click(function(){
			var index = $('a[af_srl]').index(this);
			var objs = new Array;
			var objs = {
				afflink_srl : $('a[af_srl]').eq(index).attr("af_srl")
				};
			$.exec_json('affiliatelinkconvert.procUpdateClickcount', objs, function(){})
		});
	});
})(jQuery);