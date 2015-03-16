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

	$getMessage.on('click', function(e){
		$(this).next().show();
		$closeForm.on('click', function(e){
			$form.hide();
		});

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

			$.ajax({
				url: '/messages',
				type: 'POST',
				dataType: 'json',
				data: formData,
				success: function(formData){
					console.log(formData);
				}
			})
		})
	});

	// var populateMessages = function(){
	// 	var that = this;

	// 	$.ajax({
	// 		url: '/messages',
	// 		method: 'GET',
	// 		dataType: 'json',
	// 		success: function(returnedData){
	// 			console.log(returnedData);
	// 		}
	// 	})
	// }









});
