console.log('message.js loaded')

// $(function(){
//   messageCollection = new MessageCollection();
//   messageCollectionView = new MessageCollectionView(messageCollection);

//   // On page load, get all the clowns from the database
//   messageCollection.fetch();
  
// })

$(document).ready(function(){
	console.log('DOM ready');
	var $getMessage = $('.get-message');
	var $form = $('.compose');
	var $closeForm = $('.close-window');
	var $sendMessage = $('#send-message');
	var $inbox = $('#inbox');
	var $div = $('.conversation');
	var $subject = $('.subject');
	var $body = $('.body');
	var formElements;
	var formData;
	
	$form.hide();

	// this shows the message form
	$getMessage.on('click', function(e){
		$(this).next().slideDown();
		$closeForm.on('click', function(e){
			$form.slideUp();
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
					$form.slideUp($form[0].reset());
				}
			})
		})
	});

	// get past messages
	var populateMessages = function(){
		$.ajax({
			url: '/messages',
			type: 'GET',
			dataType: 'json',
			success: function(receivedData){
				var newMessage = new Message (receivedData[0]);
				console.log(newMessage);
			}
		})
	};

	var renderInbox = function (messages) {

	}

	populateMessages();
	renderInbox();


});
