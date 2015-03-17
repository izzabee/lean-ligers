console.log('message.js loaded')

// $(function(){
//   messageCollection = new MessageCollection();
//   messageCollectionView = new MessageCollectionView(messageCollection);

//   // On page load, get all the clowns from the database
//   messageCollection.fetch();
  
// })

$(function(){
	console.log('DOM ready');
	var $getMessage = $('.get-message');
	var $form = $('.compose');
	var $closeForm = $('.close-window');
	var $sendMessage = $('#send-message');
	var $inbox = $('#inbox');
	var $ul = $('.conversation');
	var $li = $('<li class="msg-body"></li>');
	var formElements;
	var formData;
	
	$form.hide();

	// this shows the message form
	$getMessage.on('click', function(e){
		$(this).next().slideDown();
		$closeForm.on('click', function(e){
			$form.slideUp();
		});
	});

	// this gets the message from the form
	$sendMessage.on('click', function(e){
		e.preventDefault();

		console.log("i've been clicked!")

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
			success: function(returnData){
				$form.slideUp($form[0].reset());
				var sent = new Message(returnData);
				var $li = $('<li class="msg-body"></li>');
				renderMessage(sent, $li);
				$ul.append($li);
			}
		})
	});

	// get past messages
	var populateMessages = function(){
		$.ajax({
			url: '/messages',
			type: 'GET',
			dataType: 'json',
			success: function(receivedData){
				console.log(receivedData);
				receivedData.forEach(function(message){
					renderMessage(message, $li);
					$ul.append($li);
				})
			}
		})
	};

	var renderMessage = function (message, li) {
		subject = message.subject;
		content = message.content;
		mentee_id = message.mentee_id;
		mentor_id = message.mentor_id;
		var $h4 = $('<h4>');
		var $ptag = $('<p>');
		$h4.text(subject);
		$ptag.text(content);

		li.append($h4).append($ptag);
	}

	populateMessages();


});
