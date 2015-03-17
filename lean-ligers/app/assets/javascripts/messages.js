console.log('message.js loaded')

$(document).ready(function(){
	console.log('DOM ready');
	var $getMessage = $('.get-message');
	var $form = $('.compose');
	var $closeForm = $('.close-window');
	var $sendMessage = $('#send-message');
	var formElements;
	var formData;
	
	$form.hide();

	// this shows the message form
	$getMessage.on('click', function(e){
		$(this).next().show();
		$closeForm.on('click', function(e){
			$form.hide();
		});

		// this gets the message from the form
		$sendMessage.on('click', function(e){
			e.preventDefault();
			formElements = $form[0].elements;
			formData = {
				message: {
					mentee_id: formElements.mentee_id.value,
					mentor_id: formElements.mentor_id.value,
					subject: formElements.subject.value,
					content: formElements.content.value
				}
			};

			// and this sends it to server
			$.ajax({
				url: '/messages',
				type: 'POST',
				dataType: 'json',
				data: formData,
				success: function(formData){
					$form[0].reset();
					$form.hide();
				}
			})
		})
	});

	var populateMessages = function(){
		var $conversation = $('.conversation')
		var $subject = $('.subject');
		var $body = $('.body');

		$.ajax({
			url: '/messages',
			method: 'GET',
			dataType: 'json',
			success: function(returnedData){
				 $subject.text(returnedData.subject);
				 $body.text(returnedData.content);
			}
		})
	}




	populateMessages();




});
