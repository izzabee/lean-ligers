console.log('mentor.js loaded');

$(document).ready(function(){
	var $button = $('.available');
	var $user = $('.available').attr('id');

	$button.on('click', function(e){
		$(this).html('Request Sent');
		$.ajax({
			url: $user + '/mentorships',
			dataType: 'json',
			type: 'POST',
			success: function(data){
				console.log(data);
				console.log('this working? maybe???');
			}
		})
	})
	
});