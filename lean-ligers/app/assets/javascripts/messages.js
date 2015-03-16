console.log('message.js loaded');
var currentUser;

$(document).ready(function(){
	var $getMessage = $('.get-message');
	var $form = $('.message-form');
	var $closeForm = $('.close-window')
	var $sendMessage = $('.send-message')
	$form.hide();

	$getMessage.on('click', function(e){
		$form.show();
		$closeForm.on('click', function(e){
			$form.hide();
		});
	})

});
