console.log('message.js loaded')


$(function(){
	console.log('DOM ready');
	var $getMessage = $('.get-message');
	var $form = $('.compose');
	var $closeForm = $('.close-window');
	var $sendMessage = $('.send-message');
	var $li = $('<li class="msg-body"></li>');
	var formElements;
	var formData;

	var userType = $("#userType").text();
	console.log(userType);

	$form.hide();

	// this shows the message form
	$getMessage.on('click', function(e){
		$(this).next().slideDown();
		$closeForm.on('click', function(e){
			$form.slideUp();
		});
	});

	if (userType === "Mentee") {
		// this gets the message from the form
		$sendMessage.on('click', function(e){
			e.preventDefault();

			console.log("i've been clicked!")

			var submitId = $(this).attr('id').substring(5);

			formElements = $('#form_' + submitId)[0].elements;
			console.log(formElements);
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
				$form[0].reset();
				var sent = new Message(returnData);
				var $li = $('<li class="msg-body"></li>');
				renderMessage(sent, $li);
				var $ul = $('#conversation_' + sent.mentor_id);
				$ul.append($li);
				}
			})
		});

		// get past messages
		var populateMessages= function(){
			$.ajax({
				url: '/messages',
				type: 'GET',
				dataType: 'json',
				success: function(receivedData){
					console.log(receivedData);
					receivedData.forEach(function(message){
						renderMessage(message, $li);
						var $ul = $('#conversation_' + message.mentor_id);
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
			var h4 = document.createElement("h4");
			h4.innerHTML = subject;
			var p = document.createElement("p");
			p.innerHTML = content;

			var li = document.createElement("li");
			li.appendChild(h4);
			li.appendChild(p);

			var ul = document.getElementById("conversation_" + message.mentor_id)
			ul.appendChild(li);
		}

		populateMessages();

	}//end mentee conditional

	else if (userType === "Mentor") {
		// this gets the message from the form
		$sendMessage.on('click', function(e){
			e.preventDefault();

			console.log("i've been clicked!")

			var submitId = $(this).attr('id').substring(5);

			formElements = $('#form_' + submitId)[0].elements;
			console.log(formElements);
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
				$form[0].reset();
				var sent = new Message(returnData);
				var $li = $('<li class="msg-body"></li>');
				renderMessage(sent, $li);
				var $ul = $('#conversation_' + sent.mentee_id);
				$ul.append($li);
				}
			})
		});

		// get past messages
		var populateMessages= function(){
			$.ajax({
				url: '/messages',
				type: 'GET',
				dataType: 'json',
				success: function(receivedData){
					console.log(receivedData);
					receivedData.forEach(function(message){
						renderMessage(message, $li);
						var $ul = $('#conversation_' + message.mentee_id);
						$ul.append($li);
					})
				}
			})
		};

		var renderMessage = function (message) {
			subject = message.subject;
			content = message.content;
			mentee_id = message.mentee_id;
			mentor_id = message.mentor_id;

			var h4 = document.createElement("h4");
			h4.innerHTML = subject;
			var p = document.createElement("p");
			p.innerHTML = content;

			var li = document.createElement("li");
			li.appendChild(h4);
			li.appendChild(p);

			var ul = document.getElementById("conversation_" + message.mentee_id)
			ul.appendChild(li);
		}

		populateMessages();

	}


});

// var $h4 = $('<h4>');
// var $ptag = $('<p>');
// $h4.text(subject);
// $ptag.text(content);
// li.append($h4).append($ptag);
